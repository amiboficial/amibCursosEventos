package mx.amib.sistemas.cursoseventos.eventos.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParticipanteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Participante.list(params), model:[participanteInstanceCount: Participante.count()]
    }

    def show(Participante participanteInstance) {
        respond participanteInstance
    }

    def create() {
        respond new Participante(params)
    }

    @Transactional
    def save(Participante participanteInstance) {
        if (participanteInstance == null) {
            notFound()
            return
        }

        if (participanteInstance.hasErrors()) {
            respond participanteInstance.errors, view:'create'
            return
        }

        participanteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'participante.label', default: 'Participante'), participanteInstance.id])
                redirect participanteInstance
            }
            '*' { respond participanteInstance, [status: CREATED] }
        }
    }

    def edit(Participante participanteInstance) {
        respond participanteInstance
    }

    @Transactional
    def update(Participante participanteInstance) {
        if (participanteInstance == null) {
            notFound()
            return
        }

        if (participanteInstance.hasErrors()) {
            respond participanteInstance.errors, view:'edit'
            return
        }

        participanteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Participante.label', default: 'Participante'), participanteInstance.id])
                redirect participanteInstance
            }
            '*'{ respond participanteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Participante participanteInstance) {

        if (participanteInstance == null) {
            notFound()
            return
        }

        participanteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Participante.label', default: 'Participante'), participanteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
