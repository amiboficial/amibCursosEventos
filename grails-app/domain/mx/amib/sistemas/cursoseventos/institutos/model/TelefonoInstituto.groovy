package mx.amib.sistemas.cursoseventos.institutos.model

class TelefonoInstituto {

	String telefono
	Instituto instituto
	TipoTelefono tipotelefono




	static belongsTo = [Instituto,TipoTelefono]

	static mapping = {
		table 't003_t_telefonoinstituto'

		id generator: "identity"
		version false

		telefono column:'tx_telefono'
		

		instituto column:'id_001_instituto'

		tipotelefono column:'id_005_tptelefono'
		
	}

	static constraints = {
		telefono nullable: true, maxSize: 50

	}
}
