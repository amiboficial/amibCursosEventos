package mx.amib.sistemas.cursoseventos.institutos.model

class TelefonoInstituto {

	String telefono
	Date fechaCreacion
	Instituto instituto

	static belongsTo = [Instituto]

	static mapping = {
		table 't003_t_telefonosinstituto'
		
		id generator: "assigned"
		version false
		
		telefono column:'tx_telefono'
		fechaCreacion column:'fh_creacion'
		
		instituto column:'id_001_instituto'
	}

	static constraints = {
		telefono nullable: true, maxSize: 50
		fechaCreacion nullable: true
	}
}
