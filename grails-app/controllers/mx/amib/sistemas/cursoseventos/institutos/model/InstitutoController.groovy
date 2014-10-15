package mx.amib.sistemas.cursoseventos.institutos.model



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
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
		
		def institutoInstance = new Instituto(params);
		
			
        respond new Instituto(params)
    }

    @Transactional
    def save(Instituto institutoInstance) {

		if (institutoInstance == null) {
			notFound()
			return
		}
		
		//sacando los telefonos
		def listaTelefonosJson = params.list('telefono')
		def listaTelefonos = new ArrayList<TelefonoInstituto>()
		listaTelefonosJson.each{
			//deja checar algo
			def jsTi = JSON.parse(it)
			TelefonoInstituto ti = new TelefonoInstituto()
			
			ti.telefono = jsTi.'telefono'
			ti.tipotelefono = TipoTelefono.get( jsTi.'idTipoTelefono'.toInteger() )
			
			ti.instituto = institutoInstance
			
			listaTelefonos.add(ti)
		}
		institutoInstance.telefonos = listaTelefonos
        
		
		//institutoInstance.telefonos = new ArrayList<TelefonoInstituto>(telefonos)
		//institutoInstance.telefonos.add(telefonoInstitutoInstance)
		//institutoInstance.telefonos.each{
		//	it.instituto = institutoInstance
		//}
		
		println (institutoInstance.telefonos as JSON)
		
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

	//probando backbone
	def testback(){
		
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
