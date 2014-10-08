package mx.amib.sistemas.cursoseventos.institutos.model.log



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CambioAutorizacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CambioAutorizacion.list(params), model:[cambioAutorizacionInstanceCount: CambioAutorizacion.count()]
    }

    def show(CambioAutorizacion cambioAutorizacionInstance) {
        respond cambioAutorizacionInstance
    }

    def create() {
        respond new CambioAutorizacion(params)
    }

    @Transactional
    def save(CambioAutorizacion cambioAutorizacionInstance) {
        if (cambioAutorizacionInstance == null) {
            notFound()
            return
        }

        if (cambioAutorizacionInstance.hasErrors()) {
            respond cambioAutorizacionInstance.errors, view:'create'
            return
        }

        cambioAutorizacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion'), cambioAutorizacionInstance.id])
                redirect cambioAutorizacionInstance
            }
            '*' { respond cambioAutorizacionInstance, [status: CREATED] }
        }
    }

    def edit(CambioAutorizacion cambioAutorizacionInstance) {
        respond cambioAutorizacionInstance
    }

    @Transactional
    def update(CambioAutorizacion cambioAutorizacionInstance) {
        if (cambioAutorizacionInstance == null) {
            notFound()
            return
        }

        if (cambioAutorizacionInstance.hasErrors()) {
            respond cambioAutorizacionInstance.errors, view:'edit'
            return
        }

        cambioAutorizacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CambioAutorizacion.label', default: 'CambioAutorizacion'), cambioAutorizacionInstance.id])
                redirect cambioAutorizacionInstance
            }
            '*'{ respond cambioAutorizacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CambioAutorizacion cambioAutorizacionInstance) {

        if (cambioAutorizacionInstance == null) {
            notFound()
            return
        }

        cambioAutorizacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CambioAutorizacion.label', default: 'CambioAutorizacion'), cambioAutorizacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
