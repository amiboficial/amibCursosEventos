package mx.amib.sistemas.cursoseventos.eventos.model.catalogo

import mx.amib.sistemas.cursoseventos.eventos.model.Evento
import mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento

class DocumentoEvento {
	
	
	Date fechaCreacion
	
	Evento evento
	TipoDocumentoEvento tipoDocumentoEvento
	String uuid
	
	String nombreDeArchivo
	boolean toBeUpdate
	
	static transients = ['nombreDeArchivo','toBeUpdate']
	
	static belongTo = [Evento, TipoDocumentoEvento]
	
	static mapping = {
		table 't014_t_docevento'
		
		id generator: "identity"
		version false
		uuid column:'uuid_f_doc'
		evento column:'id_007_evento'
		tipoDocumentoEvento column:'id_015_tpdocevento'
		fechaCreacion column:'fh_creacion'
		
	}

    static constraints = {
		fechaCreacion nullable: true
    }
}
