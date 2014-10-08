package mx.amib.sistemas.cursoseventos.cursos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentoCursosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocumentoCursos.list(params), model:[documentoCursosInstanceCount: DocumentoCursos.count()]
    }

    def show(DocumentoCursos documentoCursosInstance) {
        respond documentoCursosInstance
    }

    def create() {
        respond new DocumentoCursos(params)
    }

    @Transactional
    def save(DocumentoCursos documentoCursosInstance) {
        if (documentoCursosInstance == null) {
            notFound()
            return
        }

        if (documentoCursosInstance.hasErrors()) {
            respond documentoCursosInstance.errors, view:'create'
            return
        }

        documentoCursosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentoCursos.label', default: 'DocumentoCursos'), documentoCursosInstance.id])
                redirect documentoCursosInstance
            }
            '*' { respond documentoCursosInstance, [status: CREATED] }
        }
    }

    def edit(DocumentoCursos documentoCursosInstance) {
        respond documentoCursosInstance
    }

    @Transactional
    def update(DocumentoCursos documentoCursosInstance) {
        if (documentoCursosInstance == null) {
            notFound()
            return
        }

        if (documentoCursosInstance.hasErrors()) {
            respond documentoCursosInstance.errors, view:'edit'
            return
        }

        documentoCursosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentoCursos.label', default: 'DocumentoCursos'), documentoCursosInstance.id])
                redirect documentoCursosInstance
            }
            '*'{ respond documentoCursosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocumentoCursos documentoCursosInstance) {

        if (documentoCursosInstance == null) {
            notFound()
            return
        }

        documentoCursosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentoCursos.label', default: 'DocumentoCursos'), documentoCursosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoCursos.label', default: 'DocumentoCursos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
