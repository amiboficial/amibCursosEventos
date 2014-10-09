<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Participante" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'matricula', 'error')} ">
	<label for="matricula" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="participante.matricula.label" default="Matricula" />
		
	</label>
	<g:field name="matricula" type="number" value="${participanteInstance.matricula}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'nombreParticipante', 'error')} ">
	<label for="nombreParticipante" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="participante.nombreParticipante.label" default="Nombre Participante" />
		
	</label>
	<g:textField name="nombreParticipante" maxlength="100" value="${participanteInstance?.nombreParticipante}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="participante.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${participanteInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'fechaModificacion', 'error')} ">
	<label for="fechaModificacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="participante.fechaModificacion.label" default="Fecha Modificacion" />
		
	</label>
	<g:datePicker name="fechaModificacion" precision="day"  value="${participanteInstance?.fechaModificacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: participanteInstance, field: 'evento', 'error')} required">
	<label for="evento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="participante.evento.label" default="Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evento" name="evento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" optionKey="id" required="" value="${participanteInstance?.evento?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
</div>