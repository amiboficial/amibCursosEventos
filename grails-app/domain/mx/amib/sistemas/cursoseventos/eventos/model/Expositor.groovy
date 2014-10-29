package mx.amib.sistemas.cursoseventos.eventos.model

import java.util.Date;

import mx.amib.sistemas.cursoseventos.eventos.model.Evento;

class Expositor {
	
	String nombreExpositor
	String primerApellidoExpositor
	String segundoApellidoExpositor
	
	//Date fechaCreacion
	Integer horas
	Evento evento
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [Evento]
	
	static mapping = {
		table 't009_t_expositor'
		id generator: "identity"
		version false
		
		nombreExpositor column:'nb_nombre'
		primerApellidoExpositor column:'nb_apellido1'
		segundoApellidoExpositor column:'nb_apellido2'
		horas column:'nu_horas'
		
		dateCreated column:'fh_creacion'
		lastUpdated column:'fh_modificacion'
		evento column:'id_007_evento'
	}
	 

    static constraints = {
		
		nombreExpositor nullable: true, maxSize: 100
		primerApellidoExpositor nullable: true, maxSize: 100
		segundoApellidoExpositor nullable: true, maxSize: 100
		horas nullable: true, maxSize: 20
		//fechaCreacion nullable: true
    }
}
