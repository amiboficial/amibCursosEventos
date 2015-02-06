package mx.amib.sistemas.cursoseventos.eventos.model

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import java.text.DateFormat;
import java.text.SimpleDateFormat
import java.util.Date;
import java.util.List;
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioService
import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento
import mx.amib.sistemas.external.catalogos.service.SepomexService
import mx.amib.sistemas.external.expediente.service.SustentanteService
import mx.amib.sistemas.cursoseventos.eventos.service.EventoService
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	//servicios
	def sepomexService
	def sustentanteService
	def eventoService
	def documentoRepositorioService
	
    def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		
        respond Evento.list(params), model:[eventoInstanceCount: Evento.count()] //resultListCount, viewModelInstance:evm 
    }
	
    def show(Evento eventoInstance) {
		eventoInstance.documentoEvento.each{
			it.nombreDeArchivo = documentoRepositorioService.obtenerMetadatosDocumento(it.uuid)?.nombre;
		}
        respond eventoInstance
    }

    def create() {
		def eventoInstance = new Evento(params);
        respond new Evento(params), model:[viewModelInstance: this.getCreateVewModel()]
    }
	
	private EventoViewModel getCreateVewModel(){
		EventoViewModel eventoVewModel = new EventoViewModel()
		eventoVewModel.tipoDocumentoList = TipoDocumentoEvento.list()
		eventoVewModel.validDocumentosCargados = false
		return eventoVewModel
	}

    @Transactional
    def save(Evento evento) {
		
		def documentosToBind = params.list('documento')
		def documentosToEraseStrParam = params.'idDocumentosBorrados'
		def documentosToErase = null
		def eventoInstance = evento
		def jsonStrLstParticipantes = params.list('participante')
		def jsonStrLstExpositores = params.list('expositor')

        if (eventoInstance == null) {
            notFound()
            return
        }
	    /*if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view:'create'
            return
        }
        eventoInstance.save flush:true
		*/
		eventoService.save(eventoInstance, jsonStrLstParticipantes, documentosToBind, jsonStrLstExpositores)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])
                redirect eventoInstance
            }
            '*' { respond eventoInstance, [status: CREATED] }
        }
    }

    def edit(Evento eventoInstance) {
		EventoViewModel eventoViewModel = this.editViewModel()
		eventoInstance = this.cargaNombresArchivo(eventoInstance)
        respond eventoInstance, model:[viewModelInstance: eventoViewModel]
    }
	private EventoViewModel editViewModel(){
		EventoViewModel eventoViewModel = new EventoViewModel()
		eventoViewModel.tipoDocumentoList = TipoDocumentoEvento.list()
		eventoViewModel.validDocumentosCargados = true
		return eventoViewModel
	}
	private Evento cargaNombresArchivo(Evento eventoInstance){
		eventoInstance.documentoEvento.each{
			it.nombreDeArchivo = documentoRepositorioService.obtenerMetadatosDocumento(it.uuid).nombre
		}
		return eventoInstance
	}
	
    @Transactional
    def update(Evento evento) {
		def eventoInstance = evento
		def documentosToBind = params.list('documento')
		def documentosToEraseStrParam = params.'idsDocumentosBorrados'
		def jsonStrLstExpositores = params.list('expositor')

		def jsonStrLstParticipantes = params.list('participante')
        if (eventoInstance == null) {
            notFound()
            return
        }
       /* if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view:'edit'
            return
        }*/
		
		eventoService.update(eventoInstance, jsonStrLstParticipantes, documentosToBind, jsonStrLstExpositores) //
		//eventoInstance = tr.instance
        //eventoInstance.save flush:true
		//if(tr.valid == true){
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect eventoInstance
            }
            '*'{ respond eventoInstance, [status: OK] }
        }
    //}
	/*else{
		request.withFormat{
			'*'{
				respond eventoInstance, model:[errorMessage:tr.errMsg],view:"edit"
			}
		}
	}*/
    }
    @Transactional
    def delete(Evento eventoInstance) {
        if (eventoInstance == null) {
            notFound()
            return
        }
        eventoInstance.delete flush:true
		def tr = eventoInstance.delete(eventoInstance)
		if(tr.valid == true){
        request.withFormat {
            '*'{// form multipartForm
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect action:"index", method:"GET"
            }
           // '*'{ render status: NO_CONTENT }
        }
    }
		else{
			request.whitFormat{
				'*'{
					flash.errorMessage = tr.errMsg
					redirect action:"index", method:"GET"
				}
			}
		}
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	
	
	
	//busca por codigo postal
	def findSepomex(String id)
	{
		def sepomexList = sepomexService.obtenerDatosSepomexPorCodigoPostal(id)
		
		render sepomexList as JSON
	}
	//el id es la matricula
	def obtenerSustentantePorMatricula(int id){
		def sustentante = sustentanteService.obtenerPorMatricula(id)
		def res = null
		if(sustentante != null){
			res = [ status: 'OK' , object: sustentante ]
		}
		else{
			res = [ status: 'NOT_FOUND' ]
		}
		render res as JSON
	}
	
}
class EventoViewModel{
	List<TipoDocumentoEvento> tipoDocumentoList
	boolean validDocumentosCargados
}

class EventoIndexViewModel{
	String fltType //'DO','AMAT','ANOM'
	
	//String fltDODga
	//Integer fltDOFhDelDay
	//Integer fltDOFhDelMonth
	//Integer fltDOFhDelYear
	//Integer fltDOFhAlDay
	//Integer fltDOFhAlMonth
	//Integer fltDOFhAlYear
	
	Integer fltAMat
	String fltANom
}
