package mx.amib.sistemas.cursoseventos.eventos.model

import mx.amib.sistemas.cursoseventos.eventos.model.Evento;

class Expositor {
	
	String nombreExpositor
	String primerApellidoExpositor
	String segundoApellidoExpositor
	
	Date fechaCreacion
	Integer horas
	Evento evento
	
	static belongsTo = [Evento]
	
	static mapping = {
		table 't009_t_expositor'
		id generator: "identity"
		version false
		
		nombreExpositor column:'nb_nombre'
		primerApellidoExpositor column:'nb_apellido1'
		segundoApellidoExpositor column:'nb_apellido2'
		horas column:'nu_horas'
		fechaCreacion column:'fh_creacion'
		evento column:'id_007_evento'
	}
	 

    static constraints = {
		
		nombreExpositor nullable: true, maxSize: 100
		primerApellidoExpositor nullable: true, maxSize: 100
		segundoApellidoExpositor nullable: true, maxSize: 100
		horas nullable: true, maxSize: 20
		fechaCreacion nullable: true
    }
}
