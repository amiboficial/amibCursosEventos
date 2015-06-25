package mx.amib.sistemas.cursoseventos.eventos.service

import grails.transaction.Transactional
import java.util.Date;
import java.util.List;
import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.StringEscapeUtils
import mx.amib.sistemas.cursoseventos.eventos.model.Evento
import mx.amib.sistemas.cursoseventos.eventos.model.Expositor
import mx.amib.sistemas.cursoseventos.eventos.model.HorarioEvento
import mx.amib.sistemas.cursoseventos.eventos.model.Participante
import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento
import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioService
import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioTO

@Transactional
class EventoService {
	def documentoRepositorioService
	def serviceMethod() {
		
		}
	class TransactionResult {
		def instance
		boolean valid = true;
		String errMsg
	}
	
	def save(Evento eventoInstance, List<String> participantesJson, List<String> documentosJson, List<String> ExpositoresJson){ //List<String> documentosJson,
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		
		eventoInstance.documentoEvento = new ArrayList<DocumentoEvento>()
		documentosJson.each{ String _documentosJson ->
			def parsedJson = JSON.parse(_documentosJson)
			
			DocumentoEvento dee = new DocumentoEvento()
			dee.uuid = parsedJson.'uuid'
			dee.tipoDocumentoEvento = TipoDocumentoEvento.get(parsedJson.'idTipo')
			
			dee.evento = eventoInstance
			eventoInstance.documentoEvento.add(dee)
			
			DocumentoRepositorioTO de = new DocumentoRepositorioTO()
			de.uuid = parsedJson.'uuid'
			de.clave = ''
			docsAEnviar.add(de)
		}
		
		eventoInstance.participantes = new HashSet<Evento>()
		participantesJson.each{
			def parsedJson = JSON.parse(it)
			
			Participante participante = new Participante()
			participante.numeroMatricula = parsedJson.'numeroMatricula'
			participante.nombreCompleto = parsedJson.'nombreCompleto'
			
			participante.evento = eventoInstance
			eventoInstance.participantes.add(participante)
		}
		eventoInstance.fechaCreacion = new Date()
		//eventoInstance.fechaModificacion = new Date()
		
		eventoInstance.expositores = new ArrayList<Expositor>()
		ExpositoresJson.each{
			def parsedJson = JSON.parse(it)
			
			Expositor expositor = new Expositor()
			expositor.nombreExpositor = parsedJson.'nombreExpositor'
			expositor.primerApellidoExpositor = parsedJson.'primerApellidoExpositor'
			expositor.segundoApellidoExpositor = parsedJson.'segundoApellidoExpositor'
			expositor.horas = parsedJson.'horas'
			
			expositor.evento = eventoInstance
			eventoInstance.expositores.add(expositor)
			
		}
		
			
		eventoInstance.validate()
		eventoInstance.save(flush:true, failOnError:true)
		return eventoInstance
		
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar) //envia documentos al repositorio
		
	}
	
	def update(Evento eventoInstance, List<String> participantesJson, List<String> documentosJson,  List<String> expositorJson){
	//// update para Expositores
		List<Expositor> expositorToDelete = new ArrayList<Expositor>()
		List<Expositor> expositorToAdd = new ArrayList<Expositor>()
		
		eventoInstance.expositores.each{
			it.toBeUpdated = false
		}	
		expositorJson.each{ String _expositorJson ->
			Expositor expositor = null
			def parsedJson = JSON.parse(_expositorJson)
	
			expositor = Expositor.get(parsedJson.'id')
				if(expositor == null){
					expositor = new Expositor()
					expositorToAdd.add(expositor)
				}
				expositor.nombreExpositor = parsedJson.'nombreExpositor'
				expositor.primerApellidoExpositor = parsedJson.'primerApellidoExpositor'
				expositor.segundoApellidoExpositor = parsedJson.'segundoApellidoExpositor'
				expositor.horas = parsedJson.'horas'
			expositor.toBeUpdated = true		
		}
		eventoInstance.expositores.each{ 
			if(it.toBeUpdated == false)
			expositorToDelete.add(it)
		}
		expositorToDelete.each{ 
			eventoInstance.removeFromExpositores(it)
			it.delete(flush:true)
		}
		expositorToAdd.each{ 
			it.evento = eventoInstance
			eventoInstance.expositores.add(it)
		}
		
		////update para participantes
		TransactionResult tr = new TransactionResult()
		StringBuilder errMsgSb = new StringBuilder()
		tr.valid = true
		
		List<Participante> participanteToDelete = new ArrayList<Participante>()
		List<Participante> participanteToAdd = new ArrayList<Participante>()
		
		eventoInstance.participantes.each{
			it.toBeDeleted = true
		}
		participantesJson.each{ _participanteJson ->
			def parsedJson = JSON.parse(_participanteJson)
			Participante participante = eventoInstance.participantes.find{ it.numeroMatricula == parsedJson.'numeroMatricula' }
				if(participante == null){
					participante = new Participante()
					participante.numeroMatricula = parsedJson.'numeroMatricula'
					participante.nombreCompleto = parsedJson.'nombreCompleto'
					participanteToAdd.add(participante)
				}
			participante.toBeDeleted = false
		}
		
		eventoInstance.participantes.each{ 
			if(it.toBeDeleted == true){
				participanteToDelete.add(it)
			}
		}
		participanteToDelete.each{ 
			eventoInstance.removeFromParticipantes(it)
			it.delete(flush:true)
		}
		participanteToAdd.each{
			it.evento = eventoInstance
			eventoInstance.participantes.add(it)
		}
		//eventoInstance.save(flush:true, failOnError:true)
		//return eventoInstance
	
		//evento.dateCreated = new Date()
		//evento.lastUpdated = new Date()
		
		
		

 	
		//// update para horario evento
		/*List<HorarioEvento> horarioEventoToDelete = new ArrayList<HorarioEvento>()
		List<HorarioEvento> horarioEventoToAdd = new ArrayList<HorarioEvento>()
		
		evento.horarioEvento.each{ HorarioEvento _h ->
			_h.toBeUpdate = false
		}
		
		horarioEventoJson.each{ String _horarioEventoJson ->
			HorarioEvento horarioEvento = null
			def parsedJson = JSON.parse(_horarioEventoJson)
			
			horarioEvento = HorarioEvento.get(parsedJson.'id')
				if(horarioEvento == null){
					horatioEvento = HorarioEvento()
					horarioEventoToAdd.add(horarioEvento)
				}
				horarioEvento.fechaDia = parsedJson.'fechaDia'
				horarioEvento.horaInicio = parsedJson.'horaInicio'
				horarioEvento.horafin = parsedJson.'horafin'
				horarioEvento.fechaCreacion = parsedJson.'fechaCreacion'
			horarioEvento.toBeUpdated = true
		}
		
		evento.horarioEvento.each{ HorarioEvento _h ->
			if(_h.toBeUpdated == false)
			participanteToDelete.add(_h)
		}
		horarioEventoToDelete.each{ HorarioEvento _h ->
			evento.removeFromHorarioEvento(_h)
			_h.delete(flush:true)
		}
		horarioEventoToAdd.each{HorarioEvento _h ->
			_h.evento = evento
			evento.horarioEvento.add(_h)
		}*/
		
		
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoRepositorioTO> docsAActualizar = new ArrayList<DocumentoRepositorioTO>()
		List<String> uuidsDocsABorrar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoEvento> deeABorrar = new ArrayList<DocumentoEvento>()
		List<DocumentoEvento> deeAAgregar = new ArrayList<DocumentoEvento>()
		
		eventoInstance.documentoEvento.each{
			it.toBeUpdate = false
		}
		documentosJson.each{ String _documentoJson ->
			DocumentoEvento dee = null
			def parsedJson = JSON.parse(_documentoJson)
			DocumentoRepositorioTO de = new DocumentoRepositorioTO()
			
			dee = DocumentoEvento.get(parsedJson.'id')
			if(dee == null){
				dee = new DocumentoEvento()
				dee.uuid = parsedJson.'uuid'
				dee.tipoDocumentoEvento = TipoDocumentoEvento.get( parsedJson.'idTipo' )
				
				deeAAgregar.add(dee)
				docsAEnviar.add(de)
			}
			else{
				docsAActualizar.add(de)
			}
			de.uuid = parsedJson.'uuid'
			de.clave = ''
			dee.toBeUpdate = true
		}
		eventoInstance.documentoEvento.each{
			if(it.toBeUpdate == false){
				uuidsDocsABorrar.add(it.uuid)
				deeABorrar.add(it)
			}
		}
		
		deeABorrar.each{
			eventoInstance.removeFromDocumentoEvento(it)
			it.delete(flush:true)
		}
		deeAAgregar.each{
			it.evento = eventoInstance
			eventoInstance.documentoEvento.add(it)
		}
		eventoInstance.validate()
		
		eventoInstance.save(flush:true, failOnError:true)
		return eventoInstance
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar)//envia documentos al repositorio
		//documentoRepositorioService.actualizaMetadatosDocumentos(docsAActualizar) //por ahorita no lo mandamos nada porque no estamos adjuntado datos al repo.
		documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)
			
	}
	
	def delete(Evento eventoInstance){
		List<String>expositorToDelete = new ArrayList<String>()
		eventoInstance.expositores.each{
			expositorToDelete.add(it.nombreExpositor)
		}
		List<String>uuidsDocsABorrar = new ArrayList<String>()
		eventoInstance.documentoEvento.each{
			uuidsDocsABorrar.add(it.uuid)
		}
		List<String>participanteToDelete = new ArrayList<String>()
		eventoInstance.participantes.each{
			participanteToDelete.add(it.numeroMatricula)
		}
		
		eventoInstance.delete(flush:true,failOnError:true)
		documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)
	}
	
}
