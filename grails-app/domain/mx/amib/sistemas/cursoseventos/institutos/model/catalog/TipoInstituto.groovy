package mx.amib.sistemas.cursoseventos.institutos.model.catalog

class TipoInstituto {

	Boolean stValido
	String dsTpinstituto

	//static hasMany = [t001TInstitutos: Instituto]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		stValido nullable: true
		dsTpinstituto nullable: true, maxSize: 100
	}
}
