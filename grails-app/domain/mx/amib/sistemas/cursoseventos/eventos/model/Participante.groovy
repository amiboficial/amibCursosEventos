package mx.amib.sistemas.cursoseventos.eventos.model

class Participante {
	String matricula
	String nombreParticipante
	Evento evento
	Date fechaCreacion
	Date fechaModificacion
	
	static belongsTo = [Evento]
	
	
	static mapping = {
		table 't010_t_participante'
		
		id generator: "assigned"
		version false
		matricula column:'nu_matricula'
		nombreParticipante column:'nb_ncompleto'
		fechaCreacion column: 'fh_creacion'
		fechaModificacion column: 'fh_modificacion'
		evento column:'id_007_evento'
		
	}

    static constraints = {
	
		nombreParticipante nullable: true, maxSize: 100
		
    }
}
