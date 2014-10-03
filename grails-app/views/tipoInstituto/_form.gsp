<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.catalogo.TipoInstituto" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoInstitutoInstance, field: 'vigente', 'error')} ">
	<label for="vigente" class="col-lg-2 col-sm-4 col-md-4 col-xs-4 control-label">
		<g:message code="tipoInstituto.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoInstitutoInstance?.vigente}" />

</div>

<br>

<div class="fieldcontain ${hasErrors(bean: tipoInstitutoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="col-lg-2 col-sm-4 col-md-4 col-xs-4 control-label">
		<g:message code="tipoInstituto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoInstitutoInstance?.descripcion}" class ="form-control"/>

</div>

</div>
