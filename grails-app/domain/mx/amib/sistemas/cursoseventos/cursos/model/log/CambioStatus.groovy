package mx.amib.sistemas.cursoseventos.cursos.model.log

import java.util.Date;
import mx.amib.sistemas.cursoseventos.cursos.model.Cursos


class CambioStatus {

    String estatusStatus
	String comentarios
	Date fechaCreacion
	
	Cursos curso

	static belongsTo = [Cursos]

	static mapping = {
		table 't011_b_cambioestatus'
		
		id generator: "assigned"
		version false
		
		estatusStatus column:'st_estatus'
		comentarios column:'tx_comentarios'
		fechaCreacion column:'fh_creacion'
		
		curso column:'id_006_curso'
	}

	static constraints = {
		estatusStatus nullable: true, maxSize: 1
		comentarios nullable: true, maxSize: 1000
		fechaCreacion nullable: true
	}
}
