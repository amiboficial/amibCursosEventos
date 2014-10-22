package mx.amib.sistemas.cursoseventos.eventos.model

class Participante {
	
	Integer matricula
	String nombreParticipante
	String fechaCreacion
	String fechaModificacion
	Evento evento
	
	static belongsTo = [Evento]
	
	
	static mapping = {
		table 't010_t_participante'
		
		id generator: "identity"
		version false
		
		matricula column:'nu_matricula'
		nombreParticipante column:'nb_ncompleto'
		fechaCreacion column: 'fh_creacion'
		fechaModificacion column: 'fh_modificacion'
		evento column:'id_007_evento'
		
	}

    static constraints = {
	
		matricula nullable: true, maxSize: 100
		nombreParticipante nullable: true, maxSize: 100
		fechaCreacion nullable: true
		fechaModificacion nullable: true
		
    }
}
