package mx.amib.sistemas.cursoseventos.eventos.model

import java.util.Date;

class Participante {
	
	Integer matricula
	String nombreParticipante
	
	Date dateCreated
	Date lastUpdated
	
	Evento evento
	
	static belongsTo = [Evento]
	
	
	static mapping = {
		table 't010_t_participante'
		
		id generator: "identity"
		version false
		
		matricula column:'nu_matricula'
		nombreParticipante column:'nb_ncompleto'
		dateCreated column: 'fh_creacion'
		lastUpdated column: 'fh_modificacion'
		evento column:'id_007_evento'
		
	}

    static constraints = {
	
		matricula nullable: true, maxSize: 100
		nombreParticipante nullable: true, maxSize: 100
	    dateCreated nullable: true 
		lastUpdated nullable: true 
		
    }
}
