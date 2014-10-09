<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.catalogo.TipoDocumentoEvento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'tipoDoumentoEvento', 'error')} ">
	<label for="tipoDoumentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.tipoDoumentoEvento.label" default="Tipo Doumento Evento" />
		
	</label>
	<g:textField name="tipoDoumentoEvento" maxlength="100" value="${tipoDocumentoEventoInstance?.tipoDoumentoEvento}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'clave', 'error')} required">
	<label for="clave" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${tipoDocumentoEventoInstance?.clave}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'documentoEvento', 'error')} ">
	<label for="documentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.documentoEvento.label" default="Documento Evento" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoDocumentoEventoInstance?.documentoEvento?}" var="d">
    <li><g:link controller="documentoEvento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoEvento" action="create" params="['tipoDocumentoEvento.id': tipoDocumentoEventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoEvento.label', default: 'DocumentoEvento')])}</g:link>
</li>
</ul>


</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoDocumentoEventoInstance, field: 'estatus', 'error')} ">
	<label for="estatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoDocumentoEvento.estatus.label" default="Estatus" />
		
	</label>
	<g:checkBox name="estatus" value="${tipoDocumentoEventoInstance?.estatus}" class ="form-control" />

</div>
<br>
</div>
