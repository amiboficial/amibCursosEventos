<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.log.CambioStatus" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: cambioStatusInstance, field: 'estatusStatus', 'error')} ">
	<label for="estatusStatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatus.estatusStatus.label" default="Estatus Status" />
		
	</label>
	<g:checkBox name="estatusStatus" value="${cambioStatusInstance?.estatusStatus}" class ="form-control" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatus.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="1000" value="${cambioStatusInstance?.comentarios}" class ="form-control" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatus.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${cambioStatusInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cambioStatusInstance, field: 'curso', 'error')} required">
	<label for="curso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cambioStatus.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" optionKey="id" required="" value="${cambioStatusInstance?.curso?.id}" class="many-to-one" class ="form-control" />

</div>
</div>
