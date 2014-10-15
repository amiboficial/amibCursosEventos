package mx.amib.sistemas.cursoseventos.institutos.model



import mx.amib.sistemas.cursoseventos.cursos.model.Cursos;
import mx.amib.sistemas.cursoseventos.institutos.model.catalogo.TipoInstituto;
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
	String repLegalNombre
	String repLegalPrimerApellido
	String repLegalSegundoApellido
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




	static hasMany = [telefonos : TelefonoInstituto,
		cambiosAutorizacion: CambioAutorizacion, cursos:Cursos]
	static belongsTo = [TipoInstituto]

	static mapping = {


		table 't001_t_instituto'

		id generator: "identity"
		version false

		razonSocial column:'nb_razonsocial'
		siglas column:'nb_siglas'
		rfc column:'tx_rfc'
		correo column:'tx_correo'
		numeroEscritura column:'nm_numeroescritura'
		aniosExperiencia column:'nm_aniosexp'
		urlSitioWeb column:'tx_sitioweburl'
		aplicaCobroIva column:'st_aplicacobroiva'
		repLegalNombre column:'nb_replegal_nombre'
		repLegalPrimerApellido column:'nb_replegal_apellido1'
		repLegalSegundoApellido column:'nb_replegal_apellido2'
		domicilioOficialIdSepomex column:'id_domoficial_f_sepomex'
		domicilioOficialCalle column:'tx_domoficial_calle'
		domicilioOficialNumext column:'tx_domoficial_numext'
		domicilioFiscalIdSepomex column:'id_domfiscal_f_sepomex'
		domicilioFiscalCalle column:'tx_domfiscal_calle'
		domicilioFiscalNumext column:'tx_domfiscal_numext'
		statusAutorizacion column:'st_autorizacion'
		fechaAlta column:'fh_alta'
		fechaFinVigencia column:'fh_finvigencia'
		fechaCreacion column:'fh_creacion'
		fechaModificacion column:'fh_modificacion'

		tipoInstituto column:'id_002_tpinstituto'
	}

	static constraints = {

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
