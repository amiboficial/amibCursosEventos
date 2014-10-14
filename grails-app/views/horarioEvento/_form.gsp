<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.HorarioEvento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: horarioEventoInstance, field: 'fechaDia', 'error')} ">
	<label for="fechaDia" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="horarioEvento.fechaDia.label" default="Fecha Dia" />
		
	</label>
	<g:datePicker name="fechaDia" precision="day"  value="${horarioEventoInstance?.fechaDia}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: horarioEventoInstance, field: 'horaInicio', 'error')} ">
	<label for="horaInicio" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="horarioEvento.horaInicio.label" default="Hora Inicio" />
		
	</label>
	<g:textField name="horaInicio" value="${fieldValue(bean: horarioEventoInstance, field: 'horaInicio')}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: horarioEventoInstance, field: 'horafin', 'error')} ">
	<label for="horafin" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="horarioEvento.horafin.label" default="Horafin" />
		
	</label>
	<g:textField name="horafin" value="${fieldValue(bean: horarioEventoInstance, field: 'horafin')}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: horarioEventoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="horarioEvento.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${horarioEventoInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: horarioEventoInstance, field: 'evento', 'error')} required">
	<label for="evento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="horarioEvento.evento.label" default="Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evento" name="evento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" optionKey="id" required="" value="${horarioEventoInstance?.evento?.id}" class="many-to-one" class ="form-control"/>

</div> -->
</div>
