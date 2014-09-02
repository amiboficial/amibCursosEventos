package mx.amib.sistemas.cursoseventos.institutos.model.log

import mx.amib.sistemas.cursoseventos.institutos.model.Instituto

class CambioAutorizacion {

	String stAutorizacion
	String txComentarios
	Date fhCreacion
	Instituto instituto

	static belongsTo = [Instituto]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		stAutorizacion nullable: true, maxSize: 1
		txComentarios nullable: true, maxSize: 1000
		fhCreacion nullable: true
	}
}
