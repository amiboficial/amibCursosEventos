package mx.amib.sistemas.cursoseventos.cursos.model

class Expositor {
	
	String nombreExpositor
	String primerApellidoExpositor
	String segundoApellidoExpositor
	
	Date fechaCreacion
	Integer horas
	Cursos curso
	
	static belongsTo = [Cursos]
	
	static mapping = {
		table 't009_t_expositor'
		id generator: "assigned"
		version false
		
		nombreExpositor column:'nb_nombre'
		primerApellidoExpositor column:'nb_apellido1'
		segundoApellidoExpositor column:'nb_apellido2'
		horas column:'nu_horas'
		fechaCreacion column:'fh_creacion'
		curso column:'id_006_curso'
	}
	 

    static constraints = {
		
		nombreExpositor nullable: true, maxSize: 100
		primerApellidoExpositor nullable: true, maxSize: 100
		segundoApellidoExpositor nullable: true, maxSize: 100
		horas nullable: true, maxSize: 20
		fechaCreacion nullable: true
    }
}
