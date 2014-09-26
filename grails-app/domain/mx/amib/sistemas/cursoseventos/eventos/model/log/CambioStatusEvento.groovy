package mx.amib.sistemas.cursoseventos.eventos.model.log

import java.util.Date;
import mx.amib.sistemas.cursoseventos.eventos.model.Evento
class CambioStatusEvento {
	
	String estatusStatus
	String comentarios
	Date fechaCreacion
	
	Evento evento
	
	static belongTo = [Evento]
	
	static mapping = {
		table 't016_b_cambioestatusevt'
		
		id generator: "assigned"
		version false
		
		estatusStatus column:'st_status'
		comentarios column:'tx_comentarios'
		fechaCreacion column:'fh_creacion'
		
		evento column:'id_007_evento'
		
	}

    static constraints = {
		estatusStatus nullable: true, maxSize: 1
		comentarios nullable: true, maxSize: 1000
		fechaCreacion nullable: true
		
    }
}
