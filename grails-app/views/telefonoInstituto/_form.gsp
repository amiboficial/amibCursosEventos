<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.TelefonoInstituto" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'telefono', 'error')} ">
	<label for="telefono" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="50" value="${telefonoInstitutoInstance?.telefono}" class ="form-control"/>

</div>
<br>

<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${telefonoInstitutoInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'instituto', 'error')} required">
	<label for="instituto" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.instituto.label" default="Instituto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instituto" name="instituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.Instituto.list()}" optionKey="id" required="" value="${telefonoInstitutoInstance?.instituto?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'tipotelefono', 'error')} required">
	<label for="tipotelefono" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.tipotelefono.label" default="Tipotelefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipotelefono" name="tipotelefono.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono.list()}" optionKey="id" required="" value="${telefonoInstitutoInstance?.tipotelefono?.id}" class="many-to-one" class ="form-control"/>

</div>
</div>
