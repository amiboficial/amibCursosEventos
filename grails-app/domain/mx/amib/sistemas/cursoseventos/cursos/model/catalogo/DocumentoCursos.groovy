package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

import mx.amib.sistemas.cursoseventos.cursos.model.Cursos


class DocumentoCursos {
	
	Date fechaCreacion
	
	Cursos curso
	TipoDocumentoCurso tipoDocumentoCurso
	String uuid
	
	String nombreDeArchivo
	boolean toBeUpdated
	
	static transients = ['nombreDeArchivo','toBeUpdated']
	
	static belongsTo = [Cursos, TipoDocumentoCurso]
	
	
	static mapping = {
		table 't012_t_doccurso'
		
		id generator: "identity"
		version false
		
		fechaCreacion column:'fh_creacion'
		uuid column:'uuid_f_doc'
		
		curso column:'id_006_curso'
		tipoDocumentoCurso column:'id_013_tpdoccurso'
	}
	

    static constraints = {
		fechaCreacion nullable: true
    }
}
