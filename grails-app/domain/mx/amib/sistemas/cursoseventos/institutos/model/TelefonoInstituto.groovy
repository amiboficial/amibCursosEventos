package mx.amib.sistemas.cursoseventos.institutos.model

class TelefonoInstituto {

	String telefono
	Date fechaCreacion
	Instituto instituto

	static belongsTo = [Instituto]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		telefono nullable: true, maxSize: 50
		fechaCreacion nullable: true
	}
}
