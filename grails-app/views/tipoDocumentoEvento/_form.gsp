<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'tipoDoumentoEvento', 'error')} ">
	<label for="tipoDoumentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.tipoDoumentoEvento.label" default="Tipo Doumento Evento" />
		
	</label>
	<g:textField name="tipoDoumentoEvento" maxlength="100" value="${tipoDocumentoEventoInstance?.tipoDoumentoEvento}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'documentoEvento', 'error')} ">
	<label for="documentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.documentoEvento.label" default="Documento Evento" />
		
	</label>
	


<g:select id="documentoEvento" name="documentoEvento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.catalogo.DocumentoEvento.list()}" optionKey="id" required="" value="${tipoDocumentoEventoInstance?.documentoEvento?.id}" class="many-to-one"/>

</div>
</div>
