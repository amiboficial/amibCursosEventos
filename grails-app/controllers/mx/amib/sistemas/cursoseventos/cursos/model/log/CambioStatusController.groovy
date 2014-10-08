package mx.amib.sistemas.cursoseventos.cursos.model.log



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CambioStatusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CambioStatus.list(params), model:[cambioStatusInstanceCount: CambioStatus.count()]
    }

    def show(CambioStatus cambioStatusInstance) {
        respond cambioStatusInstance
    }

    def create() {
        respond new CambioStatus(params)
    }

    @Transactional
    def save(CambioStatus cambioStatusInstance) {
        if (cambioStatusInstance == null) {
            notFound()
            return
        }

        if (cambioStatusInstance.hasErrors()) {
            respond cambioStatusInstance.errors, view:'create'
            return
        }

        cambioStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cambioStatus.label', default: 'CambioStatus'), cambioStatusInstance.id])
                redirect cambioStatusInstance
            }
            '*' { respond cambioStatusInstance, [status: CREATED] }
        }
    }

    def edit(CambioStatus cambioStatusInstance) {
        respond cambioStatusInstance
    }

    @Transactional
    def update(CambioStatus cambioStatusInstance) {
        if (cambioStatusInstance == null) {
            notFound()
            return
        }

        if (cambioStatusInstance.hasErrors()) {
            respond cambioStatusInstance.errors, view:'edit'
            return
        }

        cambioStatusInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CambioStatus.label', default: 'CambioStatus'), cambioStatusInstance.id])
                redirect cambioStatusInstance
            }
            '*'{ respond cambioStatusInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CambioStatus cambioStatusInstance) {

        if (cambioStatusInstance == null) {
            notFound()
            return
        }

        cambioStatusInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CambioStatus.label', default: 'CambioStatus'), cambioStatusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cambioStatus.label', default: 'CambioStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
