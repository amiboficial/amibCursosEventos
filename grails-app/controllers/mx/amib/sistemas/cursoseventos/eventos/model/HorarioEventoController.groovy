package mx.amib.sistemas.cursoseventos.eventos.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HorarioEventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HorarioEvento.list(params), model:[horarioEventoInstanceCount: HorarioEvento.count()]
    }

    def show(HorarioEvento horarioEventoInstance) {
        respond horarioEventoInstance
    }

    def create() {
        respond new HorarioEvento(params)
    }

    @Transactional
    def save(HorarioEvento horarioEventoInstance) {
        if (horarioEventoInstance == null) {
            notFound()
            return
        }

        if (horarioEventoInstance.hasErrors()) {
            respond horarioEventoInstance.errors, view:'create'
            return
        }

        horarioEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'horarioEvento.label', default: 'HorarioEvento'), horarioEventoInstance.id])
                redirect horarioEventoInstance
            }
            '*' { respond horarioEventoInstance, [status: CREATED] }
        }
    }

    def edit(HorarioEvento horarioEventoInstance) {
        respond horarioEventoInstance
    }

    @Transactional
    def update(HorarioEvento horarioEventoInstance) {
        if (horarioEventoInstance == null) {
            notFound()
            return
        }

        if (horarioEventoInstance.hasErrors()) {
            respond horarioEventoInstance.errors, view:'edit'
            return
        }

        horarioEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HorarioEvento.label', default: 'HorarioEvento'), horarioEventoInstance.id])
                redirect horarioEventoInstance
            }
            '*'{ respond horarioEventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(HorarioEvento horarioEventoInstance) {

        if (horarioEventoInstance == null) {
            notFound()
            return
        }

        horarioEventoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HorarioEvento.label', default: 'HorarioEvento'), horarioEventoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'horarioEvento.label', default: 'HorarioEvento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
