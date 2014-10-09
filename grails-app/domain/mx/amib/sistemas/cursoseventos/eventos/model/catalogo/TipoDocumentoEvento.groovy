package mx.amib.sistemas.cursoseventos.eventos.model.catalogo

import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento

class TipoDocumentoEvento {
	
	String tipoDoumentoEvento
	String clave
	Boolean estatus
	
	static hasMany = [documentoEvento: DocumentoEvento]
	
	static mapping = {
		table 't015_c_tpdocevento'
		
		id generator: "assigned"
		version false
		
		tipoDoumentoEvento column:'ds_tpdocevento'
		clave colum:'tx_clave'
		estatus colum:'st_vigente'
	}

    static constraints = {
		tipoDoumentoEvento nullable: true, maxSize: 100
    }
}
