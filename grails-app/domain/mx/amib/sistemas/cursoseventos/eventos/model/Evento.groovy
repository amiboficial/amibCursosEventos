package mx.amib.sistemas.cursoseventos.eventos.model

import mx.amib.sistemas.cursoseventos.cursos.model.Expositor;
import mx.amib.sistemas.cursoseventos.institutos.model.log.Domicilio



class Evento {
	
	
	//detalles del curso
	Date fechaInicio
	Date fechaTermino
	//Detalles del coordinador
	String nombreCordinador
	String primerApellidoCoordinador
	String segundoApellidoCoordinador
	String telefonoFijoCoordinador
	String faxCoordinador
	String email
	Boolean estatus
	String domicilioSEDECalle
	String domicilioSEDENumero
	Long domicilioSEDESepomex
	Date fechaCreacion
	
	static hasMany = [expositores: Expositor, participantes: Participante, domicilo: Domicilio]

	static mapping = {
		table 't007_t_evento'
		
		id generator: "assigned"
		version false
		fechaInicio column:'fh_inicio'
		fechaTermino column:'fh_termino'
		nombreCordinador column:'nb_coordi_nombre'
		primerApellidoCoordinador column:'nb_coordi_apellido1'
		segundoApellidoCoordinador column:'nb_coordi_apellido2'
		telefonoFijoCoordinador column:'tx_coordi_telfijo'
		faxCoordinador column:'tx_coordi_fax'
		email column:'tx_coordi_correoe'
		estatus column:'st_estatus'
		domicilioSEDECalle column:'tx_domsede_calle'
		domicilioSEDENumero column:'tx_domsede_numext'
		domicilioSEDESepomex column:'id_domsede_f_sepomex'
		fechaCreacion column:'fh_creacion'
		}
	
    static constraints = {
		fechaInicio nullable: true
		fechaTermino nullable: true
		nombreCordinador nullable: true, maxSize: 100
		primerApellidoCoordinador nullable: true, maxSize:100 
		segundoApellidoCoordinador nullable: true, maxSize: 100
		telefonoFijoCoordinador nullable: true, maxSize: 20
		faxCoordinador nullable: true, maxSize: 20
		email email: true, blank: false, unique: true
		estatus nullable: true
		domicilioSEDECalle nullable: true, maxSize: 100
		domicilioSEDENumero nullable: true, maxSize: 20
		domicilioSEDESepomex nullable: true, maxSize: 100
		fechaCreacion nullable: true
	
    }
}
