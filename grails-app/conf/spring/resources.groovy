import grails.util.Environment
// Place your Spring DSL code here
beans = {
	archivoTemporalService(mx.amib.sistemas.util.service.ArchivoTemporalService) {
		directorioTemporal = application.config.mx.amib.sistemas.registro.tempDir
		minutosCaducidadPorArchivo = 50
	}
	documentoRepositorioService(mx.amib.sistemas.external.documentos.service.DocumentoRepositorioService) {
		saveUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.Documento.save
		documentoPoderSaveUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.DocumentoPoder.save
		documentoPoderUpdateUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.DocumentoPoder.update
		documentoRevocacionSaveUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.DocumentoRevocacion.save
		documentoRevocacionUpdateUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.DocumentoRevocacion.update
		saveMultipartUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.archivo.subirArchivoDocumentoUuid
		getUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.Documento.getByUuid
		downloadUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.archivo.descargarArchivoDocumentoUuid
		deleteUrl = application.config.mx.amib.sistemas.documentos.resthttpURL + application.config.mx.amib.sistemas.documentos.Documento.deleteByUuid
		archivoTemporalService = archivoTemporalService
	}
	sepomexService(mx.amib.sistemas.external.catalogos.service.SepomexService) {
		listEntidadFederativaUrl = application.config.mx.amib.sistemas.catalogos.resthttpURL + application.config.mx.amib.sistemas.catalogos.sepomex.EntidadFederativa.list
		findByCodigoPostalUrl = application.config.mx.amib.sistemas.catalogos.resthttpURL + application.config.mx.amib.sistemas.catalogos.sepomex.Sepomex.findByCodigoPostal
	}
	sustentanteService(mx.amib.sistemas.external.expediente.service.SustentanteService) {
		getByNumeroMatriculaUrl = application.config.mx.amib.sistemas.expediente.resthttpURL + application.config.mx.amib.sistemas.expediente.Sustentante.obtenerSustentantePorMatricula
	}
}
