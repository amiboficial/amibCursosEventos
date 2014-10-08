package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

class TipoDocumentoCurso {
	
	String tipoDoumentoCurso
	String clave
	Boolean estatus
	static hasMany = [documentoCurso: DocumentoCursos]
	
	static mapping = {
		table 't013_c_tpdoccurso'
		
		id generator: "assigned"
		version false
		clave column: 'tx_clave'
		tipoDoumentoCurso column:'ds_tpdoccurso'
		estatus column :'st_vigente'
		
		
	}

    static constraints = {
		tipoDoumentoCurso nullable: true, maxSize: 100
    }
}
