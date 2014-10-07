package mx.amib.sistemas.cursoseventos.institutos.model

class TipoTelefono {

	Boolean vigente
	String descripcion
	
	
	static hasMany = [telefonos: TelefonoInstituto,]
	
	static mapping = {
		table 't005_c_tptelefono'
		
		id generator: "assigned"
		version false
		
		vigente column:'st_vigente'
		descripcion column:'ds_tptelefono'
	}
	
    static constraints = {
		vigente nullable: true
		descripcion nullable: true, maxSize: 100
		
    }
}
