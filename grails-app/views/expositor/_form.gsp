<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Expositor" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'nombreExpositor', 'error')} ">
	<label for="nombreExpositor" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.nombreExpositor.label" default="Nombre Expositor" />
		
	</label>
	<g:textField name="nombreExpositor" maxlength="100" value="${expositorInstance?.nombreExpositor}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'primerApellidoExpositor', 'error')} ">
	<label for="primerApellidoExpositor" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.primerApellidoExpositor.label" default="Primer Apellido Expositor" />
		
	</label>
	<g:textField name="primerApellidoExpositor" maxlength="100" value="${expositorInstance?.primerApellidoExpositor}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'segundoApellidoExpositor', 'error')} ">
	<label for="segundoApellidoExpositor" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.segundoApellidoExpositor.label" default="Segundo Apellido Expositor" />
		
	</label>
	<g:textField name="segundoApellidoExpositor" maxlength="100" value="${expositorInstance?.segundoApellidoExpositor}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'horas', 'error')} ">
	<label for="horas" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.horas.label" default="Horas" />
		
	</label>
	<g:textField name="horas" maxlength="20" value="${expositorInstance?.horas}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${expositorInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'curso', 'error')} required">
	<label for="curso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" optionKey="id" required="" value="${expositorInstance?.curso?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: expositorInstance, field: 'duracionHoras', 'error')} required">
	<label for="duracionHoras" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="expositor.duracionHoras.label" default="Duracion Horas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracionHoras" type="number" value="${expositorInstance.duracionHoras}" required="" class ="form-control"/>

</div>

</div>

