package mx.amib.sistemas.cursoseventos.cursos.model.catalogo

import mx.amib.sistemas.cursoseventos.cursos.model.Cursos


class DocumentoCursos {
	
	String documentos
	
	Cursos curso
	
	static belongsTo = [Cursos]
	
	
	static mapping = {
		table 't012_t_doccurso'
		
		id generator: "assigned"
		version false
		
		documentos column:'tx_telefono'
		
		
		curso column:'id_006_curso'
	}
	

	

    static constraints = {
    }
}
