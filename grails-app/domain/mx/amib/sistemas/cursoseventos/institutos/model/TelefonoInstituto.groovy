package mx.amib.sistemas.cursoseventos.institutos.model

class TelefonoInstituto {

	String telefono
	Date fechaCreacion
	Instituto instituto
	TipoTelefono tipotelefono
	
	
	//falta relacion con instituto y tipo de telefono instituto
	
	
	static belongsTo = [Instituto, TipoTelefono]

	static mapping = {
		table 't003_t_telefonoinstituto'
		
		id generator: "identity"
		version false
		
		telefono column:'tx_telefono'
		fechaCreacion column:'fh_creacion'
		
		instituto column:'id_001_instituto'
		
		tipotelefono column:'id_005_tptelefono'
	}

	static constraints = {
		telefono nullable: true, maxSize: 50
		fechaCreacion nullable: true
	}
}
