package mx.amib.sistemas.cursoseventos.institutos.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TelefonoInstitutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TelefonoInstituto.list(params), model:[telefonoInstitutoInstanceCount: TelefonoInstituto.count()]
    }

    def show(TelefonoInstituto telefonoInstitutoInstance) {
        respond telefonoInstitutoInstance
    }

    def create() {
        respond new TelefonoInstituto(params)
    }

    @Transactional
    def save(TelefonoInstituto telefonoInstitutoInstance) {
        if (telefonoInstitutoInstance == null) {
            notFound()
            return
        }

        if (telefonoInstitutoInstance.hasErrors()) {
            respond telefonoInstitutoInstance.errors, view:'create'
            return
        }

        telefonoInstitutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto'), telefonoInstitutoInstance.id])
                redirect telefonoInstitutoInstance
            }
            '*' { respond telefonoInstitutoInstance, [status: CREATED] }
        }
    }

    def edit(TelefonoInstituto telefonoInstitutoInstance) {
        respond telefonoInstitutoInstance
    }

    @Transactional
    def update(TelefonoInstituto telefonoInstitutoInstance) {
        if (telefonoInstitutoInstance == null) {
            notFound()
            return
        }

        if (telefonoInstitutoInstance.hasErrors()) {
            respond telefonoInstitutoInstance.errors, view:'edit'
            return
        }

        telefonoInstitutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TelefonoInstituto.label', default: 'TelefonoInstituto'), telefonoInstitutoInstance.id])
                redirect telefonoInstitutoInstance
            }
            '*'{ respond telefonoInstitutoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TelefonoInstituto telefonoInstitutoInstance) {

        if (telefonoInstitutoInstance == null) {
            notFound()
            return
        }

        telefonoInstitutoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TelefonoInstituto.label', default: 'TelefonoInstituto'), telefonoInstitutoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
