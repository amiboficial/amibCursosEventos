package mx.amib.sistemas.cursoseventos.eventos.model.log



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CambioStatusEventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CambioStatusEvento.list(params), model:[cambioStatusEventoInstanceCount: CambioStatusEvento.count()]
    }

    def show(CambioStatusEvento cambioStatusEventoInstance) {
        respond cambioStatusEventoInstance
    }

    def create() {
        respond new CambioStatusEvento(params)
    }

    @Transactional
    def save(CambioStatusEvento cambioStatusEventoInstance) {
        if (cambioStatusEventoInstance == null) {
            notFound()
            return
        }

        if (cambioStatusEventoInstance.hasErrors()) {
            respond cambioStatusEventoInstance.errors, view:'create'
            return
        }

        cambioStatusEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cambioStatusEvento.label', default: 'CambioStatusEvento'), cambioStatusEventoInstance.id])
                redirect cambioStatusEventoInstance
            }
            '*' { respond cambioStatusEventoInstance, [status: CREATED] }
        }
    }

    def edit(CambioStatusEvento cambioStatusEventoInstance) {
        respond cambioStatusEventoInstance
    }

    @Transactional
    def update(CambioStatusEvento cambioStatusEventoInstance) {
        if (cambioStatusEventoInstance == null) {
            notFound()
            return
        }

        if (cambioStatusEventoInstance.hasErrors()) {
            respond cambioStatusEventoInstance.errors, view:'edit'
            return
        }

        cambioStatusEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CambioStatusEvento.label', default: 'CambioStatusEvento'), cambioStatusEventoInstance.id])
                redirect cambioStatusEventoInstance
            }
            '*'{ respond cambioStatusEventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CambioStatusEvento cambioStatusEventoInstance) {

        if (cambioStatusEventoInstance == null) {
            notFound()
            return
        }

        cambioStatusEventoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CambioStatusEvento.label', default: 'CambioStatusEvento'), cambioStatusEventoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioStatusEvento.label', default: 'CambioStatusEvento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
