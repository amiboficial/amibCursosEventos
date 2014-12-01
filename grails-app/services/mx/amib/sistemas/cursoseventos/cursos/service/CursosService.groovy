package mx.amib.sistemas.cursoseventos.cursos.service

import grails.transaction.Transactional
import java.util.List;

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.StringEscapeUtils
import mx.amib.sistemas.cursoseventos.cursos.model.Cursos
import mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioTO
import mx.amib.sistemas.external.documentos.service.DocumentoCursosRepositorioTO

@Transactional
class CursosService {
	def documentoRepositorioService
	
	def save(Cursos cursos, List<String> documentosJson){
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		
		cursos.documentoCurso = new ArrayList<DocumentoCursos>()
		documentosJson.each{ String _documentosJson ->
			def parsedJson = JSON.pase(_documentosJson)
			
			DocumentoCursos dcc = new DocumentoCursos()
			dcc.uuidDocumentoCursos = parseredJson.'uuid'
			dcc.tipoDocumentoCurso = TipoDocumentoCurso.get(parsedJson.'idTipo')
			
			dcc.cursos = cursos
			cursos.documentoCurso.add(dcc)
			
			DocumentoCursosRepositorioTO dc = new DocumentoCursosRepositorioTO()
			dc.uuid = parsedJson.'uuid'
			dc.clave= ''
			dc.tipoDocumento = TipoDocumentoCurso.get(parsed.'idTipo').tipoDoumentoCurso
			docsAEnviar.add(dc)
			
						
		}
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsEnviar)
	}
	
	def update (Cursos cursos, List<String> documentosJson) {
		
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoRepositorioTO> docsAActualizar = new ArrayList<DocumentoRepositorioTO>()
		List<String> uuidsDocsABorrar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoCursos> dccABorrar = new ArrayList<DocumentoCursos>()
		List<DocumentoCursos> dccAAgregar = new ArrayList<DocumentoCursos>()
		
		cursos.documentoCursos.each{
			it.toBeUpdated = false
		
		DocumentoCursos dcc = null
		def parsedJson = JSON.parse(_docuemntoJson)
		DocumentoCursosRepositorioTO dc = new DocumentoCursosRepositorioTO()
		
		drr = DocumentoCurso.get(parsedJson.'id')
		if(dcc == null){
			dcc = new DocumentoCursos()
			dcc.uiidDocumentoRepositorio = parsedJson.'uuid'
			dcc.tipoDocumentoCurso = TipoDocumentoCurso.get(parsedJson.'idTipo')
			
			dccAAgregar.add(dcc)
			docsAEnviar.add(dc)		
		}
		else{
			docsAActualizar.add(dc)
		}
		dc.uuid = parsedJson.'uuid'
		dc.clave = ''
		dc.tipoDocumentoRespaldoCurso = dcc.tipoDocumentoCurso.tipoDoumentoCurso
		}
		cursos.documentoCursos.each{
			if(it.toBeUpdated == false){
				uuidsDocsABorrar.add(it.uuidDocumentoRepositorio)
				dccABorrar.add(it)
			}
		dccABorrar.each{
			cursos.removeFromDocumentosCursos(it)
			it.delete(flush:true)
			}
		dccAAgregar.each{
			it.cursos = cursos
			cursos.documentoCursos.add(it)			
			}
			documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar)
			documentoRepositorioService.actualizarMetadatosDocumentos(docsAActualizar)
			documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)
			
		}

    }
	
	
    def serviceMethod() {
    }
	
}
