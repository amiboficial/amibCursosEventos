package mx.amib.sistemas.cursoseventos.institutos.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InstitutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Instituto.list(params), model:[institutoInstanceCount: Instituto.count()]
    }

    def show(Instituto institutoInstance) {
        respond institutoInstance
    }

    def create() {
        respond new Instituto(params)
    }

    @Transactional
    def save(Instituto institutoInstance) {
        if (institutoInstance == null) {
            notFound()
            return
        }

        if (institutoInstance.hasErrors()) {
            respond institutoInstance.errors, view:'create'
            return
        }

        institutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'instituto.label', default: 'Instituto'), institutoInstance.id])
                redirect institutoInstance
            }
            '*' { respond institutoInstance, [status: CREATED] }
        }
    }

    def edit(Instituto institutoInstance) {
        respond institutoInstance
    }

    @Transactional
    def update(Instituto institutoInstance) {
        if (institutoInstance == null) {
            notFound()
            return
        }

        if (institutoInstance.hasErrors()) {
            respond institutoInstance.errors, view:'edit'
            return
        }

        institutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Instituto.label', default: 'Instituto'), institutoInstance.id])
                redirect institutoInstance
            }
            '*'{ respond institutoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Instituto institutoInstance) {

        if (institutoInstance == null) {
            notFound()
            return
        }

        institutoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Instituto.label', default: 'Instituto'), institutoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'instituto.label', default: 'Instituto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
