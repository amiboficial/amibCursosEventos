package mx.amib.sistemas.cursoseventos.eventos.model.catalogo

import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento

class TipoDocumentoEvento {
	
	String tipoDoumentoEvento
	
	static hasMany = [documentoEvento: DocumentoEvento]
	
	static mapping = {
		table 't015_c_tpdocevento'
		
		id generator: "assigned"
		version false
		
		tipoDoumentoEvento column:'ds_tpdocevento'
	}

    static constraints = {
		tipoDoumentoEvento nullable: true, maxSize: 100
    }
}
