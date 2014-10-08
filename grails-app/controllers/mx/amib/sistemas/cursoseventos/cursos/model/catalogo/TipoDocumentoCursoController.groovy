package mx.amib.sistemas.cursoseventos.cursos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDocumentoCursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDocumentoCurso.list(params), model:[tipoDocumentoCursoInstanceCount: TipoDocumentoCurso.count()]
    }

    def show(TipoDocumentoCurso tipoDocumentoCursoInstance) {
        respond tipoDocumentoCursoInstance
    }

    def create() {
        respond new TipoDocumentoCurso(params)
    }

    @Transactional
    def save(TipoDocumentoCurso tipoDocumentoCursoInstance) {
        if (tipoDocumentoCursoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoCursoInstance.hasErrors()) {
            respond tipoDocumentoCursoInstance.errors, view:'create'
            return
        }

        tipoDocumentoCursoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDocumentoCurso.label', default: 'TipoDocumentoCurso'), tipoDocumentoCursoInstance.id])
                redirect tipoDocumentoCursoInstance
            }
            '*' { respond tipoDocumentoCursoInstance, [status: CREATED] }
        }
    }

    def edit(TipoDocumentoCurso tipoDocumentoCursoInstance) {
        respond tipoDocumentoCursoInstance
    }

    @Transactional
    def update(TipoDocumentoCurso tipoDocumentoCursoInstance) {
        if (tipoDocumentoCursoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoCursoInstance.hasErrors()) {
            respond tipoDocumentoCursoInstance.errors, view:'edit'
            return
        }

        tipoDocumentoCursoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDocumentoCurso.label', default: 'TipoDocumentoCurso'), tipoDocumentoCursoInstance.id])
                redirect tipoDocumentoCursoInstance
            }
            '*'{ respond tipoDocumentoCursoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDocumentoCurso tipoDocumentoCursoInstance) {

        if (tipoDocumentoCursoInstance == null) {
            notFound()
            return
        }

        tipoDocumentoCursoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDocumentoCurso.label', default: 'TipoDocumentoCurso'), tipoDocumentoCursoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDocumentoCurso.label', default: 'TipoDocumentoCurso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
