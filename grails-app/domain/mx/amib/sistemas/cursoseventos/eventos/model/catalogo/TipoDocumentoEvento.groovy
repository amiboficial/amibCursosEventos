package mx.amib.sistemas.cursoseventos.eventos.model.catalogo

import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento

class TipoDocumentoEvento {
	
	String tipoDocumentoEvento
	String clave
	Boolean estatus
	
	static hasMany = [documentoEvento: DocumentoEvento]
	
	static mapping = {
		table 't015_c_tpdocevento'
		
		id generator: "assigned"
		version false
		
		tipoDocumentoEvento column:'ds_tpdocevento'
		clave column:'tx_clave'
		estatus column:'st_vigente'
	}

	static constraints = {
		tipoDocumentoEvento nullable: true, maxSize: 100
	}
}
