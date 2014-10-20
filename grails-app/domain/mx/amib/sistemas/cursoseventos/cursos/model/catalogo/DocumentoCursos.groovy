package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

import mx.amib.sistemas.cursoseventos.cursos.model.Cursos


class DocumentoCursos {
	
	String documentos
	Date fechaCreacion
	
	Cursos curso
	TipoDocumentoCurso tipoDocumentoCurso
	
	static belongsTo = [Cursos, TipoDocumentoCurso]
	
	
	static mapping = {
		table 't012_t_doccurso'
		
		id generator: "assigned"
		version false
		
		documentos column:'uuid_f_doc'
		fechaCreacion column:'fh_creacion'
		
		curso column:'id_006_curso'
		tipoDocumentoCurso column:'id_013_tpdoccurso'
	}
	

	

    static constraints = {
		documentos nullable: true, maxSize: 10
		fechaCreacion nullable: true
    }
}
