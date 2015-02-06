package mx.amib.sistemas.cursoseventos.cursos.service

import grails.transaction.Transactional
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import java.util.List;

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.StringEscapeUtils
import mx.amib.sistemas.cursoseventos.cursos.model.Cursos
import mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos
import mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoDocumentoCurso
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioTO
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioService


@Transactional
class CursosService {
	def documentoRepositorioService
	
	def serviceMethod() {
	
		}
	
	def save(Cursos curso, List<String> documentosJson){
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		
		curso.documentoCurso = new ArrayList<DocumentoCursos>()
		documentosJson.each{ String _documentosJson ->
			def parsedJson = JSON.parse(_documentosJson)
			
			DocumentoCursos dcc = new DocumentoCursos()
			dcc.uuid = parsedJson.'uuid'
			dcc.tipoDocumentoCurso = TipoDocumentoCurso.get(parsedJson.'idTipo')
			
			dcc.curso = curso
			curso.documentoCurso.add(dcc)
			
			
			DocumentoRepositorioTO dc = new DocumentoRepositorioTO()
			dc.uuid = parsedJson.'uuid'
			dc.clave= ''
			//dc.tipoDocumento = TipoDocumentoCurso.get(parsedJson.'idTipo').tipoDoumentoCurso 
			docsAEnviar.add(dc)
		}
		curso.validate()//valida con respecto a domains
		curso.save (flush:true, failOnError: true)
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar)//envia documentos al repostorio
	}
	
	def update (Cursos curso, List<String> documentosJson) {
		
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoRepositorioTO> docsAActualizar = new ArrayList<DocumentoRepositorioTO>()
		List<String> uuidsDocsABorrar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoCursos> dccABorrar = new ArrayList<DocumentoCursos>()
		List<DocumentoCursos> dccAAgregar = new ArrayList<DocumentoCursos>()
		
		curso.documentoCurso.each{
			it.toBeUpdated = false
		}
		documentosJson.each{ String _documentoJson ->
			DocumentoCursos dcc = null
			def parsedJson = JSON.parse(_documentoJson)
			DocumentoRepositorioTO dc = new DocumentoRepositorioTO()
			
			dcc = DocumentoCursos.get(parsedJson.'id')
			if(dcc == null){
				dcc = new DocumentoCursos()
				dcc.uuid = parsedJson.'uuid'
				dcc.tipoDocumentoCurso = TipoDocumentoCurso.get( parsedJson.'idTipo' )
				
				dccAAgregar.add(dcc)
				docsAEnviar.add(dc)		
			}
			else{
				docsAActualizar.add(dc)
			}
			dc.uuid = parsedJson.'uuid'
			dc.clave = ''
			//dc.tipoDocumentoRespaldo = dcc.tipoDocumentoCurso.tipoDoumentoCurso
			dcc.toBeUpdated = true
		}
		curso.documentoCurso.each{
			if(it.toBeUpdated == false){
				uuidsDocsABorrar.add(it.uuid)
				dccABorrar.add(it)
			}
		}
		
		dccABorrar.each{
			curso.removeFromDocumentoCurso(it)
			it.delete(flush:true)
		}
		dccAAgregar.each{
			it.curso = curso
			curso.documentoCurso.add(it)			
		}
		
		curso.validate()
		curso.save(flush:true, failOnError:true)
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar)//envia documentos al repositorio
		//documentoRepositorioService.actualizaMetadatosDocumentos(docsAActualizar) por ahorita no lo mandamos nada porque no estamos adjuntado datos al repo.
		documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)	
		
    }
	def delete(Cursos cursosInstance){
		List<String>uuidsDocsABorrar = new ArrayList<String>()
		cursosInstance.documentoCurso.each{
			uuidsDocsABorrar.add(it.uuid)
		}
		cursosInstace.delete(flush:true,failOnError:true)
		documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)
		
	}
	
	
	/*fecha creacion 
	 * fecha actual
	 * si fecha actual - fecha creacion = a 3 a–os
	 * anular curso 
	 * en caso contrario 
	 * cruso activo
	 * 
	 * */
/*
	Date fechaCreacion = new Date()
	Date fechaActual = new Date()
	
	TimeDuration tiempo = TimeCategory(fechaCreacion, fechaActual)
		def resta(fechaCreacion, fechaActual){
		resta = fechaActual - fechaCreacion
		return resta
	}
		int anio = 3.Years
		if (resta == anio){
			desactivar curso
		}else{
		activar curso
		}
	
	*/	
}

	

