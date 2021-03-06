<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.log.CambioAutorizacion" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: cambioAutorizacionInstance, field: 'estatusAutorizacion', 'error')} ">
	<label for="estatusAutorizacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioAutorizacion.estatusAutorizacion.label" default="Estatus Autorizacion" />
		
	</label>
	<g:textField name="estatusAutorizacion" maxlength="1" value="${cambioAutorizacionInstance?.estatusAutorizacion}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioAutorizacionInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioAutorizacion.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="1000" value="${cambioAutorizacionInstance?.comentarios}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioAutorizacionInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioAutorizacion.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${cambioAutorizacionInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: cambioAutorizacionInstance, field: 'instituto', 'error')} required">
	<label for="instituto" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioAutorizacion.instituto.label" default="Instituto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instituto" name="instituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.Instituto.list()}" optionKey="id" required="" value="${cambioAutorizacionInstance?.instituto?.id}" class="many-to-one" class ="form-control"/>

</div> -->

</div>