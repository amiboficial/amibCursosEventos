package mx.amib.sistemas.cursoseventos.institutos.model

import mx.amib.sistemas.cursoseventos.institutos.model.catalog.TipoInstituto;
import mx.amib.sistemas.cursoseventos.institutos.model.log.CambioAutorizacion;

class Instituto {

	String razonSocial
	String siglas
	String rfc
	String correo
	Long numeroEscritura
	Integer aniosExperiencia
	String urlSitioWeb
	Boolean aplicaCobroIva
	Integer repLegalNombre
	Integer repLegalPrimerApellido
	Integer repLegalSegundoApellido
	Long domicilioOficialIdSepomex
	String domicilioOficialCalle
	String domicilioOficialNumext
	Long domicilioFiscalIdSepomex
	String domicilioFiscalCalle
	String domicilioFiscalNumext
	String statusAutorizacion
	Date fechaAlta
	Date fechaFinVigencia
	Date fechaCreacion
	Date fechaModificacion
	
	TipoInstituto tipoInstituto

	static hasMany = [telefonos: TelefonoInstituto,
	                  cambiosAutorizacion: CambioAutorizacion]
	static belongsTo = [TipoInstituto]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		Long domicilioFiscalIdSepomex
		String domicilioFiscalCalle
		String domicilioFiscalNumext
		String statusAutorizacion
		Date fechaAlta
		Date fechaFinVigencia
		Date fechaCreacion
		Date fechaModificacion
		razonSocial nullable: true, maxSize: 254
		siglas nullable: true, maxSize: 4
		rfc nullable: true, maxSize: 13
		correo nullable: true, maxSize: 254
		numeroEscritura nullable: true
		aniosExperiencia nullable: true
		urlSitioWeb nullable: true, maxSize: 1000
		aplicaCobroIva nullable: true
		repLegalNombre nullable: true
		repLegalPrimerApellido nullable: true
		repLegalSegundoApellido nullable: true
		domicilioOficialIdSepomex nullable: true
		domicilioOficialCalle nullable: true, maxSize: 254
		domicilioOficialNumext nullable: true, maxSize: 36
		domicilioFiscalIdSepomex nullable: true
		domicilioFiscalCalle nullable: true, maxSize: 254
		domicilioFiscalNumext nullable: true, maxSize: 36
		statusAutorizacion nullable: true, maxSize: 1
		fechaAlta nullable: true
		fechaFinVigencia nullable: true
		fechaCreacion nullable: true
		fechaModificacion nullable: true
	}
}
