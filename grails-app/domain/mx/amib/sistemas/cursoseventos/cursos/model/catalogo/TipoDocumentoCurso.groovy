package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

class TipoDocumentoCurso {
	
	Integer tipoDoumentoCurso
	
	static hasMany = [documentoCurso: DocumentoCursos]
	
	static mapping = {
		table 't013_c_tpdoccurso'
		
		id generator: "assigned"
		version false
		
		tipoDoumentoCurso column:'ds_tpdoccurso'
	}

    static constraints = {
		tipoDoumentoCurso nullable: true, maxSize: 100
    }
}
