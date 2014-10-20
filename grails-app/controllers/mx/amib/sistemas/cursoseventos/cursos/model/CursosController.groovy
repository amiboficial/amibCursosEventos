package mx.amib.sistemas.cursoseventos.cursos.model



import static org.springframework.http.HttpStatus.*

import java.util.Date;

import grails.transaction.Transactional
import grails.converters.JSON
@Transactional(readOnly = true)
class CursosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cursos.list(params), model:[cursosInstanceCount: Cursos.count()]
    }

    def show(Cursos cursosInstance) {
        respond cursosInstance
    }

    def create() {
		
		def cursosInstance = new Cursos(params);
		
        respond new Cursos(params)
    }

    @Transactional
    def save(Cursos cursosInstance) {
        if (cursosInstance == null) {
            notFound()
            return
        }
				
        if (cursosInstance.hasErrors()) {
            respond cursosInstance.errors, view:'create'
            return
        }

        cursosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect cursosInstance
            }
            '*' { respond cursosInstance, [status: CREATED] }
        }
    }

    def edit(Cursos cursosInstance) {
        respond cursosInstance
    }

    @Transactional
    def update(Cursos cursosInstance) {
        if (cursosInstance == null) {
            notFound()
            return
        }

        if (cursosInstance.hasErrors()) {
            respond cursosInstance.errors, view:'edit'
            return
        }

        cursosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect cursosInstance
            }
            '*'{ respond cursosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cursos cursosInstance) {

        if (cursosInstance == null) {
            notFound()
            return
        }

        cursosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cursos.label', default: 'Cursos'), cursosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
