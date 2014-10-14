package mx.amib.sistemas.cursoseventos.institutos.model.catalogo

import mx.amib.sistemas.cursoseventos.institutos.model.Instituto

class TipoInstituto {

	Boolean vigente
	String descripcion
	
	static hasMany = [institutos: Instituto]

	static mapping = {
		table 't002_c_tpinstituto'
		
		id generator: "identity"
		version false
		
		vigente column:'st_vigente'
		descripcion column:'ds_tpinstituto'
	}

	static constraints = {
		vigente nullable: true
		descripcion nullable: true, maxSize: 100
	}
}
