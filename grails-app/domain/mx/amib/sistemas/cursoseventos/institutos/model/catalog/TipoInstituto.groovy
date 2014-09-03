package mx.amib.sistemas.cursoseventos.institutos.model.catalog

class TipoInstituto {

	Boolean vigente
	String descripcion

	//static hasMany = [t001TInstitutos: Instituto]

	static mapping = {
		table 't002_c_tpinstituto'
		
		id generator: "assigned"
		version false
		
		vigente column:'st_vigente'
		descripcion column:'ds_tpinstituto'
	}

	static constraints = {
		vigente nullable: true
		descripcion nullable: true, maxSize: 100
	}
}
