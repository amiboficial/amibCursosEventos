package mx.amib.sistemas.cursoseventos.eventos.model

class HorarioEvento {
	
	Date fechaDia
	String horaInicio
	String horafin
	Evento evento
	static belongTo = [Evento]
	
	static mapping = {
		table 't008_t_horarioevento'
		
		id generator: "asigned"
		version false
		
		fechaDia column:'fh_dia'
		horaInicio column: 'nu_horainicio'
		horafin column: 'nu_horafin'
		
		evento column:'id_007_evento'
		
	}

    static constraints = {
		fechaDia nullable: true
		horaInicio nullable:true
		horafin nullable:true
    }
}
