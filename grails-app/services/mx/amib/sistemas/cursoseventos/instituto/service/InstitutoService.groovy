package mx.amib.sistemas.cursoseventos.instituto.service
import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.StringEscapeUtils
import mx.amib.sistemas.cursoseventos.institutos.model.Instituto
import mx.amib.sistemas.cursoseventos.institutos.model.TelefonoInstituto
import mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono


@Transactional
class InstitutoService {
	
	
	def update(Instituto instituto, List<String> telefonosJson){
		
		List<TelefonoInstituto> telefonoInstitutoToDelete = new ArrayList<TelefonoInstituto>()
		List<TelefonoInstituto> telefonoInstitutoToAdd = new ArrayList<TelefonoInstituto>()
		
		instituto.telefonos.each{ TelefonoInstituto _t ->
			_t.toBeUpdated = false
			
		}
		
		telefonosJson.each{ String _telefonoJson ->
			TelefonoInstituto telefonoInstituto = null	
			def parsedJson = JSON.parse(_telefonoJson)
			
			telefonoInstituto = TelefonoInstituto.get(parsedJson.'id')
				if(telefonoInstituto == null){
					telefonoInstituto = new TelefonoInstituto()
					telefonoInstitutoToAdd.add(telefonoInstituto)
				}
				telefonoInstituto.telefono = parsedJson.'telefono'
				telefonoInstituto.tipotelefono = TipoTelefono.get(parsedJson.'idTipoTelefono')
			telefonoInstituto.toBeUpdated = true
		}

		instituto.telefonos.each{ TelefonoInstituto _t ->
			if(_t.toBeUpdated == false)
			telefonoInstitutoToDelete.add(_t)	
		}
		telefonoInstitutoToDelete.each{ TelefonoInstituto _t ->
			instituto.removeFromTelefonos(_t)
			_t.delete(flush:true)
			
		}
		telefonoInstitutoToAdd.each{ TelefonoInstituto _t ->
			_t.instituto = instituto
			instituto.telefonos.add(_t)
			
		}
		
		instituto.save (flush:true, failOnError: true)
		
	}
	

    def serviceMethod() {

			
    }
}
