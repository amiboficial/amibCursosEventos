package mx.amib.sistemas.cursoseventos.institutos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoInstitutoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoInstituto.list(params), model:[tipoInstitutoInstanceCount: TipoInstituto.count()]
    }

    def show(TipoInstituto tipoInstitutoInstance) {
        respond tipoInstitutoInstance
    }

    def create() {
        respond new TipoInstituto(params)
    }

    @Transactional
    def save(TipoInstituto tipoInstitutoInstance) {
        if (tipoInstitutoInstance == null) {
            notFound()
            return
        }

        if (tipoInstitutoInstance.hasErrors()) {
            respond tipoInstitutoInstance.errors, view:'create'
            return
        }

        tipoInstitutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoInstituto.label', default: 'TipoInstituto'), tipoInstitutoInstance.id])
                redirect tipoInstitutoInstance
            }
            '*' { respond tipoInstitutoInstance, [status: CREATED] }
        }
    }

    def edit(TipoInstituto tipoInstitutoInstance) {
        respond tipoInstitutoInstance
    }

    @Transactional
    def update(TipoInstituto tipoInstitutoInstance) {
        if (tipoInstitutoInstance == null) {
            notFound()
            return
        }

        if (tipoInstitutoInstance.hasErrors()) {
            respond tipoInstitutoInstance.errors, view:'edit'
            return
        }

        tipoInstitutoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoInstituto.label', default: 'TipoInstituto'), tipoInstitutoInstance.id])
                redirect tipoInstitutoInstance
            }
            '*'{ respond tipoInstitutoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoInstituto tipoInstitutoInstance) {

        if (tipoInstitutoInstance == null) {
            notFound()
            return
        }

        tipoInstitutoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoInstituto.label', default: 'TipoInstituto'), tipoInstitutoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoInstituto.label', default: 'TipoInstituto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
