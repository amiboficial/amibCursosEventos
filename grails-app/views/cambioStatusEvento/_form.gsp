<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.log.CambioStatusEvento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: cambioStatusEventoInstance, field: 'estatusStatus', 'error')} ">
	<label for="estatusStatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatusEvento.estatusStatus.label" default="Estatus Status" />
		
	</label>
	<g:textField name="estatusStatus" maxlength="1" value="${cambioStatusEventoInstance?.estatusStatus}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusEventoInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatusEvento.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="1000" value="${cambioStatusEventoInstance?.comentarios}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusEventoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatusEvento.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${cambioStatusEventoInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusEventoInstance, field: 'evento', 'error')} required">
	<label for="evento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> 
		<g:message code="cambioStatusEvento.evento.label" default="Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evento" name="evento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" optionKey="id" required="" value="${cambioStatusEventoInstance?.evento?.id}" class="many-to-one" class ="form-control"/>

</div>
</div>
