package mx.amib.sistemas.external.documentos.service

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date

import mx.amib.sistemas.util.service.ArchivoTO
import mx.amib.sistemas.util.service.ArchivoTemporalService
import mx.amib.sistemas.utils.AmibFechaUtils

import org.codehaus.groovy.grails.web.json.JSONObject
import org.junit.After;
import org.springframework.aop.aspectj.RuntimeTestWalker.ThisInstanceOfResidueTestVisitor;

import java.io.File

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.transaction.Transactional



/**
 * DocumentoRepositorioService
 *
 * Este servicio permite gestionar documentos empleado llamadas
 * HTTP/REST al sistema de amibDocumentos
 *
 * @author Gabriel
 * @version 1.1 - (Última actualización) 22/09/2014
 *
 */
@Transactional
class DocumentoRepositorioService {

	ArchivoTemporalService archivoTemporalService
	String saveUrl
	String documentoCursoSaveUrl
	String docuemntoCursoUpdateUrl
	
	String saveMultipartUrl
	String getUrl
	String downloadUrl
	String deleteUrl
	
	/**
	 * Obtiene, del repositorio amibdocumentos,
	 * los metadatos de un documento dado su uuID
	 * 
	 * @param uuid
	 * @return Instancia de DocumentosREpositorioTO 
	 * 
	 */
	
	DocumentoRepositorioTO obtenerMetadatosDocumento(String uuid, ClaseDocumento cd = ClaseDocumento.DOCUMENTO){
		def docRep = null
		String restUrl = getUrl + uuid
		DateFormat df = new SimpleDateFormat("yyy-MM-dd")
		
		def rest = new RestBuilder()
		def restMultipart = new RestBuilder()
		
		def resp = rest.get(restUrl)
		resp.json instanceof JSONObject
		
		if(resp.json == null)
			return null
		else{
			switch(cd){
				case ClaseDocumento.DOCUMENTO:
					docRep = new DocumentoRepositorioTO()
				break;
				case ClaseDocumento.OFICIO:
					docRep = new DocumentoOficioREpositorioTO()
				break
			}
			docRep.id = resp.json.'id'
			docRep.uuid = resp.json.'uuid'
			docRep.clave = resp.json.'clave'
			docRep.nombre = resp.json.'nombre'
			docRep.mimetype = resp.json.'mimetype'
			//docRep.fechaModificacion = resp.json.'fechaModificacion'
			//docRep.fechaCreacion = resp.json.'fechaCreacion'
		}
		
		return docRep
	}
	/**
	 * 
	 * 
	 * 
	 * 
	 * 
	 * @author desarrollo
	 *
	 */
	void enviarDocumentosArchivoTemporal(Collection<DocumentoRepositorioTO> docs){
		
	}
}
class DocumentoRepositorioTO{
	Long id
	String uuid
	String clave
	String nombre
	String mimetype
	Date fechaModificacion
	Date fechaCreacion
}

class DocumentoOficioREpositorioTO extends DocumentoRepositorioTO{
	String datosAdicionales
}

class DocumentoPoderRepositorioTO extends DocumentoRepositorioTO{
	String tipoDocumentoRespaldo
	String representanteLegalNombre
	String representanteLegalApellido1
	String representanteLegalApellido2
	Boolean esRegistradoPorGrupoFinanciero
	Integer numeroEscritura
	Date fechaApoderamiento
	String jsonApoderados
	String jsonNotario
	String jsonGrupoFinanciero
	String jsonInstitucion
}

class DocumentoCursosRepositorioTO extends DocumentoRepositorioTO{
	String tipoDocumentoRespaldo
	String representanteLegalNombre
	String representanteLegalApellido1
	String representanteLegalApellido2
	Boolean esRegistradoPorGrupoFinanciero
	Integer numeroEscritura
	Date fechaRevocacion
	String jsonRevocados
	String jsonNotario
	String jsonGrupoFinanciero
	String jsonInstitucion
}

class DocumentoFotoSustentanteRepositorioTO extends DocumentoRepositorioTO{
	String datosAdicionales
}

class DocumentoSustentanteRepositorioTO extends DocumentoRepositorioTO{
	String datosAdicionales
}

enum ClaseDocumento{
	DOCUMENTO, OFICIO, PODER, FOTO_SUSTENTANTE, DOC_SUSTENTANTE
}
