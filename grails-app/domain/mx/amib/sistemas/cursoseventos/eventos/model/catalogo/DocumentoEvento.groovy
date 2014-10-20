package mx.amib.sistemas.cursoseventos.eventos.model.catalogo

import mx.amib.sistemas.cursoseventos.eventos.model.Evento
import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento

class DocumentoEvento {
	
	String documentos
	Date fechaCreacion
	
	Evento evento
	TipoDocumentoEvento tipoDocumentoEvento
	
	static belongTo = [Evento, TipoDocumentoEvento]
	
	static mapping = {
		table 't014_t_docevento'
		
		id generator: "assigned"
		version false
		documentos column:'uuid_f_doc'
		evento column:'id_007_evento'
		tipoDocumentoEvento column:'id_015_tpdocevento'
		fechaCreacion column:'fh_creacion'
		
	}

    static constraints = {
		documentos nullable: true, maxSize: 100
		fechaCreacion nullable: true
    }
}
