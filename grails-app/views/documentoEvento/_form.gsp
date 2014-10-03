<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: documentoEventoInstance, field: 'documentos', 'error')} ">
	<label for="documentos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoEvento.documentos.label" default="Documentos" />
		
	</label>
	<g:field name="documentos" type="number" value="${documentoEventoInstance.documentos}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoEventoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoEvento.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${documentoEventoInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoEventoInstance, field: 'evento', 'error')} required">
	<label for="evento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoEvento.evento.label" default="Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evento" name="evento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" optionKey="id" required="" value="${documentoEventoInstance?.evento?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: documentoEventoInstance, field: 'tipoDocumentoEvento', 'error')} required">
	<label for="tipoDocumentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="documentoEvento.tipoDocumentoEvento.label" default="Tipo Documento Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoDocumentoEvento" name="tipoDocumentoEvento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento.list()}" optionKey="id" required="" value="${documentoEventoInstance?.tipoDocumentoEvento?.id}" class="many-to-one" class ="form-control"/>

</div>

</div>