package mx.amib.sistemas.cursoseventos.eventos.model



import static org.springframework.http.HttpStatus.*
import mx.amib.sistemas.cursoseventos.eventos.model.Expositor;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExpositorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Expositor.list(params), model:[expositorInstanceCount: Expositor.count()]
    }

    def show(Expositor expositorInstance) {
        respond expositorInstance
    }

    def create() {
        respond new Expositor(params)
    }

    @Transactional
    def save(Expositor expositorInstance) {
        if (expositorInstance == null) {
            notFound()
            return
        }

        if (expositorInstance.hasErrors()) {
            respond expositorInstance.errors, view:'create'
            return
        }

        expositorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'expositor.label', default: 'Expositor'), expositorInstance.id])
                redirect expositorInstance
            }
            '*' { respond expositorInstance, [status: CREATED] }
        }
    }

    def edit(Expositor expositorInstance) {
        respond expositorInstance
    }

    @Transactional
    def update(Expositor expositorInstance) {
        if (expositorInstance == null) {
            notFound()
            return
        }

        if (expositorInstance.hasErrors()) {
            respond expositorInstance.errors, view:'edit'
            return
        }

        expositorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Expositor.label', default: 'Expositor'), expositorInstance.id])
                redirect expositorInstance
            }
            '*'{ respond expositorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Expositor expositorInstance) {

        if (expositorInstance == null) {
            notFound()
            return
        }

        expositorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Expositor.label', default: 'Expositor'), expositorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'expositor.label', default: 'Expositor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
