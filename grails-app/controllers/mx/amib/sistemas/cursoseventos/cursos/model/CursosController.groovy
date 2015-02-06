package mx.amib.sistemas.cursoseventos.cursos.model

import static org.springframework.http.HttpStatus.*

import java.util.Collection;
import grails.transaction.Transactional
import grails.converters.JSON
import java.util.Date;
import grails.transaction.Transactional
import mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso
import mx.amib.sistemas.cursoseventos.cursos.model.Cursos
import mx.amib.sistemas.cursoseventos.cursos.service.CursosService
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioService

@Transactional(readOnly = true)
class CursosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	//servicios
	def cursosService
	def documentoRepositorioService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cursos.list(params), model:[cursosInstanceCount: Cursos.count()]
    }

    def show(Cursos cursosInstance) {
		cursosInstance.documentoCurso.each{
			it.nombreDeArchivo = documentoRepositorioService.obtenerMetadatosDocumento(it.uuid)?.nombre;
		}
        respond cursosInstance
    }

    def create() {
		def cursosInstance = new Cursos(params);
        respond new Cursos(params), model:[viewModelInstance: this.getCreateVewModel()]
    }
	


	private CursoViewModel getCreateVewModel(){
		CursoViewModel cursoVewModel = new CursoViewModel()
		cursoVewModel.tipoDocumentoList = TipoDocumentoCurso.list()
		cursoVewModel.validDocumentosCargados = false
		return cursoVewModel
	}
	
    @Transactional
    def save(Cursos cursosInstance) {
		
		def documentosToBind = params.list('documento')
		def documentosToEraseStrParam = params.'idDocumentosBorrados'
		def documentosToErase = null
		//if(documentosToEraseStrParam != null || documentosToEraseStrParam != ""){
		//	documentosToErase = documentosToEraseStrParam.split("\\|")
		//}
        if (cursosInstance == null) {
            notFound()
            return
        }
		
		/*
        if (cursosInstance.hasErrors()) {
            respond cursosInstance.errors, view:'create'
            return
        }
		*/
		
		cursosService.save(cursosInstance, documentosToBind)
     

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect cursosInstance
            }
            '*' { respond cursosInstance, [status: CREATED] }
        }
    }

    def edit(Cursos cursosInstance) {
		CursoViewModel cursoViewModel = this.editViewModel()
		cursosInstance = this.cargaNombresArchivo(cursosInstance)
        respond cursosInstance, model:[viewModelInstance: cursoViewModel]
    }
	private CursoViewModel editViewModel(){
		CursoViewModel cursoViewModel = new CursoViewModel()
		cursoViewModel.tipoDocumentoList = TipoDocumentoCurso.list()
		cursoViewModel.validDocumentosCargados = true
		return cursoViewModel
	}
	private Cursos cargaNombresArchivo(Cursos cursosInstance){
		cursosInstance.documentoCurso.each{
			it.nombreDeArchivo = documentoRepositorioService.obtenerMetadatosDocumento(it.uuid).nombre
		}
		return cursosInstance
	}

    @Transactional
    def update(Cursos cursosInstance) {
		def documentosToBind = params.list('documento')
		def documentosToEraseStrParam = params.'idsDocumentosBorrados'
		
        if (cursosInstance == null) {
            notFound()
            return
        }

       /* if (cursosInstance.hasErrors()) {
            respond cursosInstance.errors, view:'edit'
            return
        }*/
		
		cursosService.update(cursosInstance, documentosToBind)
       // cursosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect cursosInstance
            }
            '*'{ respond cursosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cursos cursosInstance) {

        if (cursosInstance == null) {
            notFound()
            return
        }

        cursosInstance.delete flush:true
		//cursosService.delete(cursosInstace)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
}

class CursoViewModel{
	List<TipoDocumentoCurso> tipoDocumentoList
	
	boolean validDocumentosCargados
	
}
