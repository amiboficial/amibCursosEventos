<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono" %>



<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'vigente', 'error')} ">
	<label for="vigente" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoTelefono.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${tipoTelefonoInstance?.vigente}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoTelefono.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${tipoTelefonoInstance?.descripcion}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="tipoTelefono.telefonos.label" default="Telefonos" />
		<span class="required-indicator">*</span>
	</label>
<g:select id="telefonoInstituto" name="telefonoInstituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.TelefonoInstituto.list()}" optionKey="id" required="" value="${tipoTelefonoInstance?.telefonos?.id}" class="many-to-one"/>
</div>
</div>

