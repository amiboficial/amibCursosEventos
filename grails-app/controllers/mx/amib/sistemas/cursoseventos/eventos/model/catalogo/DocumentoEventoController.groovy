package mx.amib.sistemas.cursoseventos.eventos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentoEventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocumentoEvento.list(params), model:[documentoEventoInstanceCount: DocumentoEvento.count()]
    }

    def show(DocumentoEvento documentoEventoInstance) {
        respond documentoEventoInstance
    }

    def create() {
        respond new DocumentoEvento(params)
    }

    @Transactional
    def save(DocumentoEvento documentoEventoInstance) {
        if (documentoEventoInstance == null) {
            notFound()
            return
        }

        if (documentoEventoInstance.hasErrors()) {
            respond documentoEventoInstance.errors, view:'create'
            return
        }

        documentoEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentoEvento.label', default: 'DocumentoEvento'), documentoEventoInstance.id])
                redirect documentoEventoInstance
            }
            '*' { respond documentoEventoInstance, [status: CREATED] }
        }
    }

    def edit(DocumentoEvento documentoEventoInstance) {
        respond documentoEventoInstance
    }

    @Transactional
    def update(DocumentoEvento documentoEventoInstance) {
        if (documentoEventoInstance == null) {
            notFound()
            return
        }

        if (documentoEventoInstance.hasErrors()) {
            respond documentoEventoInstance.errors, view:'edit'
            return
        }

        documentoEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentoEvento.label', default: 'DocumentoEvento'), documentoEventoInstance.id])
                redirect documentoEventoInstance
            }
            '*'{ respond documentoEventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocumentoEvento documentoEventoInstance) {

        if (documentoEventoInstance == null) {
            notFound()
            return
        }

        documentoEventoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentoEvento.label', default: 'DocumentoEvento'), documentoEventoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoEvento.label', default: 'DocumentoEvento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
