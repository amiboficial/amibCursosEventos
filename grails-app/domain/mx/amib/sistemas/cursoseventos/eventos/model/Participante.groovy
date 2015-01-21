package mx.amib.sistemas.cursoseventos.eventos.model

import java.util.Date;

class Participante {
	
	Integer numeroMatricula
	String nombreCompleto
	
	//Date dateCreated
	//Date lastUpdated
	
	Evento evento
	boolean toBeDeleted
	
	static transients =['toBeDeleted']
	
	static belongsTo = [Evento]
	
	
	static mapping = {
		table 't010_t_participante'
		
		id generator: "identity"
		version false
		
		numeroMatricula column:'nu_matricula'
		nombreCompleto column:'nb_ncompleto'
		//dateCreated column: 'fh_creacion'
	//	lastUpdated column: 'fh_modificacion'
		evento column:'id_007_evento'
		
	}

    static constraints = {
	
		numeroMatricula nullable: true, maxSize: 100
		nombreCompleto nullable: true, maxSize: 100
	  //  dateCreated nullable: true 
		//lastUpdated nullable: true 
		
    }
	
	public String toString(){
		return numeroMatricula + ":" + nombreCompleto;
	}
}
