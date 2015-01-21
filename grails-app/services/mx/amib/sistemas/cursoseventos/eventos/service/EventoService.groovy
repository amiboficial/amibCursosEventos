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

import mx.amib.sistemas.external.documentos.service.DocumentoRepositorioTO

@Transactional
class EventoService {
	def serviceMethod() {
		
		}
	class TransactionResult {
		def instance
		boolean valid = true;
		String errMsg
	}
	
	def save(Evento eventoInstance, List<String> participantesJson, List<String> documentosJson){ //List<String> documentosJson,
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
		
			
		eventoInstance.validate()
		eventoInstance.save(flush:true, failOnError:true)
		return eventoInstance
		
		documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar) //envia documentos al repositorio
		
	}
	
	def update(Evento eventoInstance, List<String> participantesJson){//, List<String> expositorJson, List<String> documentosJson, List<String> horarioEventoJson
	//// update para Expositores
		/*List<Expositor> expositorToDelete = new ArrayList<Expositor>()
		List<Expositor> expositorToAdd = new ArrayList<Expositor>()
		
		evento.expositores.each{ Expositor _e ->
			_e.toBeUpdate = false
		}
		
		expositorJson.each{ String _expositorJson ->
			Expositor expositor = null
			def parsedJson = JSON.parse(_expositorJson)
			
			expositor = Expositor.get(parsedJson.'id')
				if(expositor == null){
					expositor = Expositor()
					expositorToAdd.add(expositor)
				}
				expositor.nombreExpositor = parsedJson.'nombreExpositor'
				expositor.primerApellidoExpositor = parsedJson.'primerApellidoExpositor'
				expositor.segundoApellidoExpositor = parsedJson.'segundoApellidoExpositor'
				expositor.horas = parsedJson.'horas'
			expositor.toBeUpdated = true
				
		}
		
		evento.expositores.each{ Expositor _e ->
			if(_e.toBeUpdated == false)
			expostorToDelete.add(_e)
		}
		expositorToDelete.each{ Expositor _e ->
			evento.removeFromExpositores(_e)
			_e.delete(flush:true)
		}
		expositorToAdd.each{ Expositor _e ->
			_e.evento = evento
			evento.expositores.add(_e)
		}*/
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
		/*participanteToDelete.each{ 
			evento.removeFromParticipantes(it)
			it.delete(flush:true)
		}*/
		participanteToAdd.each{
			it.evento = eventoInstance
			eventoInstance.participantes.add(it)
		}
		eventoInstance.save(flush:true, failOnError:true)
		return eventoInstance
	
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
		}
		
		
		List<DocumentoRepositorioTO> docsAEnviar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoRepositorioTO> docsAActualizar = new ArrayList<DocumentoRepositorioTO>()
		List<String> uuidsDocsABorrar = new ArrayList<DocumentoRepositorioTO>()
		List<DocumentoEvento> deeABorrar = new ArrayList<DocumentoEvento>()
		List<DocumentoEvento> deeAAgregar = new ArrayList<DocumentoEvento>()
		
		evento.documentoEvento.each{
			it.toBeUpdated = false
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
			dee.toBeUpdated = true
		}
		evento.documentoEvento.each{
			if(it.toBeUpdated == false){
				uuidsDocsABorrar.add(it.documentos)
				deeABorrar.add(it)
			}
		}
		
		deeABorrar.each{
			evento.removeFromDocumentoEvento(it)
			it.delete(flush:true)
		}
		deeAAgregar.each{
			it.evento = evento
			curso.documentoEvento.add(it)
		}*/
		//eventoInstance.validate()
		
		//documentoRepositorioService.enviarDocumentosArchivoTemporal(docsAEnviar)//envia documentos al repositorio
		//documentoRepositorioService.actualizaMetadatosDocumentos(docsAActualizar) por ahorita no lo mandamos nada porque no estamos adjuntado datos al repo.
		//documentoRepositorioService.eliminarDocumentos(uuidsDocsABorrar)
			
	}
	
}
