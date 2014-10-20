package mx.amib.sistemas.cursoseventos.cursos.model.catalogo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoCursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoCurso.list(params), model:[tipoCursoInstanceCount: TipoCurso.count()]
    }

    def show(TipoCurso tipoCursoInstance) {
        respond tipoCursoInstance
    }

    def create() {
        respond new TipoCurso(params)
    }

    @Transactional
    def save(TipoCurso tipoCursoInstance) {
        if (tipoCursoInstance == null) {
            notFound()
            return
        }

        if (tipoCursoInstance.hasErrors()) {
            respond tipoCursoInstance.errors, view:'create'
            return
        }

        tipoCursoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoCurso.label', default: 'TipoCurso'), tipoCursoInstance.id])
                redirect tipoCursoInstance
            }
            '*' { respond tipoCursoInstance, [status: CREATED] }
        }
    }

    def edit(TipoCurso tipoCursoInstance) {
        respond tipoCursoInstance
    }

    @Transactional
    def update(TipoCurso tipoCursoInstance) {
        if (tipoCursoInstance == null) {
            notFound()
            return
        }

        if (tipoCursoInstance.hasErrors()) {
            respond tipoCursoInstance.errors, view:'edit'
            return
        }

        tipoCursoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoCurso.label', default: 'TipoCurso'), tipoCursoInstance.id])
                redirect tipoCursoInstance
            }
            '*'{ respond tipoCursoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoCurso tipoCursoInstance) {

        if (tipoCursoInstance == null) {
            notFound()
            return
        }

        tipoCursoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoCurso.label', default: 'TipoCurso'), tipoCursoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoCurso.label', default: 'TipoCurso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
