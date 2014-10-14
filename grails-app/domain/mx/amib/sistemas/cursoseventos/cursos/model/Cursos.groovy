package mx.amib.sistemas.cursoseventos.cursos.model


import mx.amib.sistemas.cursoseventos.cursos.model.log.CambioStatus
import mx.amib.sistemas.cursoseventos.cursos.model.Expositor
import mx.amib.sistemas.cursoseventos.cursos.model.catalogo.DocumentoCursos
import mx.amib.sistemas.cursoseventos.eventos.model.Evento;
import mx.amib.sistemas.cursoseventos.institutos.model.Instituto

class Cursos {
	
	//Datos del curso
	String nombreDelCurso
	String siglas
	String objetivoDelCurso
	Integer duracionEnHoras
	String observaciones
	
	//Datos del coordinador
	String nombreCoordinador
	String primerApellidoCoordinador
	String segundoApellidoCordinador
	String telefonoFijoCoordinador
	String faxCoordinador
	String email
	String status
	Date fechaCreacion
	Date fechaModificacion
	
	
	Instituto instituto
	
	static hasMany = [cambioStatus: CambioStatus, expositores:Expositor, documentoCurso: DocumentoCursos, eventos:Evento]

	
	static mapping = {
		table 't006_t_curso'
		
		id generator: "assigned"
		version false
		
		nombreDelCurso column:'nb_nombre'
		siglas column:'nb_siglas'
		objetivoDelCurso column:'tx_objetivo'
		duracionEnHoras column:'nu_horas'
		observaciones column:'tx_observaciones'
		
		nombreCoordinador column:'nb_coordi_nombre'
		primerApellidoCoordinador column:'nb_coordi_apellido1'
		segundoApellidoCordinador column:'nb_coordi_apellido2'
		telefonoFijoCoordinador column:'tx_coordi_telfijo'
		faxCoordinador column:'tx_coordi_fax'
		email column:'tx_coordi_correoe'
		status column:'st_estatus'
		fechaCreacion column:'fh_creacion'
		fechaModificacion column:'fh_modificacion'
		
		instituto column:'id_001_instituto'
	}
	
	static constraints = {
	
		nombreDelCurso nullable: true, maxSize: 254
		siglas nullable: true, maxSize: 4
		objetivoDelCurso nullable: true, maxSize: 254
		duracionEnHoras nullable: true, maxSize: 254
		observaciones nullable: true, maxSize: 254
		
		nombreCoordinador nullable: true, maxSize: 254
		primerApellidoCoordinador nullable: true, maxSize: 4
		segundoApellidoCordinador nullable: true, maxSize: 254
		telefonoFijoCoordinador nullable: true, maxSize: 254
		faxCoordinador nullable: true, maxSize: 254
		email email: true, blank: false, unique: true
		status nullable: true
		fechaCreacion nullable: true
		fechaModificacion nullable: true
		
	}
	
	
}
