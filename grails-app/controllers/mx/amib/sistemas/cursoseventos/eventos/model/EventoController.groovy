package mx.amib.sistemas.cursoseventos.eventos.model



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

import java.text.DateFormat;
import java.text.SimpleDateFormat
import java.util.Date;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Evento.list(params), model:[eventoInstanceCount: Evento.count()]
    }

    def show(Evento eventoInstance) {
        respond eventoInstance
    }

    def create() {
        respond new Evento(params)
    }

    @Transactional
    def save(Evento eventoInstance) {
        if (eventoInstance == null) {
            notFound()
            return
        }
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/dd/MM HH:mm")
		
     
		DateFormat formatoDia = new SimpleDateFormat("yyyy-MM-dd")
		
		//sacando los participantes
		def listaParticipantesJson = params.list('participante')
		def listaParticipantes = new ArrayList<Participante>()
		listaParticipantesJson.each{
			//para cada uno en la lista
			def jsPar = JSON.parse(it)
			Participante par = new Participante()
			
			par.matricula = jsPar.'matricula'
			par.nombreParticipante = jsPar.'nombreParticipante'
			par.fechaCreacion =  formatoDia.parse(jsPar.'fechaCreacion')
			par.fechaModificacion = jsPar.'fechaModificacion'
			//ex.curso = Curso.get( jsEx.'idCurso'.toInteger() )
			
			par.evento = eventoInstance
			listaParticipantes.add(par)
		}
		eventoInstance.participantes = listaParticipantes
		
		println (eventoInstance.participantes as JSON)
		///////////////////
		//sacando los horarios
		def listaHorarioEventosJson = params.list('horarioEvento')
		def listaHorarioEventos = new ArrayList<HorarioEvento>()
		listaHorarioEventosJson.each{
			//para cada uno en la lista
			def jsHor = JSON.parse(it)
			HorarioEvento hor = new HorarioEvento()
			
			hor.fechaDia = jsHor.'fechaDia'
			hor.horaInicio = jsHor.'horaInicio'
			hor.horafin = jsHor.'horafin'
			hor.fechaCreacion = jsHor.'fechaCreacion'
			//ex.curso = Curso.get( jsEx.'idCurso'.toInteger() )
			
			hor.evento = eventoInstance
			listaHorarioEventos.add(hor)
		}
		eventoInstance.horarioEvento = listaHorarioEventos
		
		println (eventoInstance.horarioEvento as JSON)
		///////////////////
		//sacando los expositores
		def listaExpositoresJson = params.list('expositor')
		def listaExpositores = new ArrayList<Expositor>()
		listaExpositoresJson.each{
			//para cada uno en la lista
			def jsEx = JSON.parse(it)
			Expositor ex = new Expositor()
			
			ex.nombreExpositor = jsEx.'nombreExpositor'
			ex.primerApellidoExpositor = jsEx.'primerApellidoExpositor'
			ex.segundoApellidoExpositor = jsEx.'segundoApellidoExpositor'
			//ex.fechaCreacion = jsEx.'fechaCreacion'
			ex.horas = jsEx.'horas'
						
			ex.curso = cursosInstance
			listaExpositores.add(ex)
		}
		eventoInstance.expositores = listaExpositores
		
		println (eventoInstance.expositores as JSON)
			/////////////////
		//////////////////
		
		
		
		
	    if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view:'create'
            return
        }

        eventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])
                redirect eventoInstance
            }
            '*' { respond eventoInstance, [status: CREATED] }
        }
    }

    def edit(Evento eventoInstance) {
        respond eventoInstance
    }

    @Transactional
    def update(Evento eventoInstance) {
        if (eventoInstance == null) {
            notFound()
            return
        }

        if (eventoInstance.hasErrors()) {
            respond eventoInstance.errors, view:'edit'
            return
        }

        eventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect eventoInstance
            }
            '*'{ respond eventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Evento eventoInstance) {

        if (eventoInstance == null) {
            notFound()
            return
        }

        eventoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Evento.label', default: 'Evento'), eventoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
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
}
