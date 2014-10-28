package mx.amib.sistemas.cursoseventos.eventos.model


class HorarioEvento {
	
	Date fechaDia
	Date horaInicio
	Date horafin
	Date fechaCreacion
	
	Evento evento
	
	static belongTo = [Evento]
	
	static mapping = {
		table 't008_t_horarioevento'
		
		id generator: "identity"
		version false
		
		fechaDia column:'fh_dia'
		horaInicio column: 'nu_horainicio'
		horafin column: 'nu_horafin'
		fechaCreacion column: 'fh_creacion'
		 
		evento column:'id_007_evento'
		
	}

    static constraints = {
		fechaDia nullable: true
		horaInicio nullable:true
		horafin nullable:true
		fechaCreacion nullable:true
    }
}
