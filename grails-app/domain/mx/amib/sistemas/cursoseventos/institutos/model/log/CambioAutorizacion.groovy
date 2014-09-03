package mx.amib.sistemas.cursoseventos.institutos.model.log

import mx.amib.sistemas.cursoseventos.institutos.model.Instituto

class CambioAutorizacion {

	String estatusAutorizacion
	String comentarios
	Date fechaCreacion
	
	Instituto instituto

	static belongsTo = [Instituto]

	static mapping = {
		table 't004_b_cambioautorizacion'
		
		id generator: "assigned"
		version false
		
		estatusAutorizacion column:'st_autorizacion'
		comentarios column:'tx_comentarios'
		fechaCreacion column:'fh_creacion'
		
		instituto column:'id_001_instituto'
	}

	static constraints = {
		estatusAutorizacion nullable: true, maxSize: 1
		comentarios nullable: true, maxSize: 1000
		fechaCreacion nullable: true
	}
}
