package mx.amib.sistemas.cursoseventos.eventos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDocumentoEventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDocumentoEvento.list(params), model:[tipoDocumentoEventoInstanceCount: TipoDocumentoEvento.count()]
    }

    def show(TipoDocumentoEvento tipoDocumentoEventoInstance) {
        respond tipoDocumentoEventoInstance
    }

    def create() {
        respond new TipoDocumentoEvento(params)
    }

    @Transactional
    def save(TipoDocumentoEvento tipoDocumentoEventoInstance) {
        if (tipoDocumentoEventoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoEventoInstance.hasErrors()) {
            respond tipoDocumentoEventoInstance.errors, view:'create'
            return
        }

        tipoDocumentoEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDocumentoEvento.label', default: 'TipoDocumentoEvento'), tipoDocumentoEventoInstance.id])
                redirect tipoDocumentoEventoInstance
            }
            '*' { respond tipoDocumentoEventoInstance, [status: CREATED] }
        }
    }

    def edit(TipoDocumentoEvento tipoDocumentoEventoInstance) {
        respond tipoDocumentoEventoInstance
    }

    @Transactional
    def update(TipoDocumentoEvento tipoDocumentoEventoInstance) {
        if (tipoDocumentoEventoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoEventoInstance.hasErrors()) {
            respond tipoDocumentoEventoInstance.errors, view:'edit'
            return
        }

        tipoDocumentoEventoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDocumentoEvento.label', default: 'TipoDocumentoEvento'), tipoDocumentoEventoInstance.id])
                redirect tipoDocumentoEventoInstance
            }
            '*'{ respond tipoDocumentoEventoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDocumentoEvento tipoDocumentoEventoInstance) {

        if (tipoDocumentoEventoInstance == null) {
            notFound()
            return
        }

        tipoDocumentoEventoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDocumentoEvento.label', default: 'TipoDocumentoEvento'), tipoDocumentoEventoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDocumentoEvento.label', default: 'TipoDocumentoEvento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
