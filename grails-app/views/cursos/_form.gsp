<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>

<div class="form-inline" role="form">


<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'nombreDelCurso', 'error')} ">
	<label for="nombreDelCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.nombreDelCurso.label" default="Nombre Del Curso" />
		
	</label>
	<g:textField name="nombreDelCurso" cols="40" rows="5" maxlength="254" value="${cursosInstance?.nombreDelCurso}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'siglas', 'error')} ">
	<label for="siglas" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.siglas.label" default="Siglas" />
		
	</label>
	<g:textField name="siglas" maxlength="4" value="${cursosInstance?.siglas}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'objetivoDelCurso', 'error')} ">
	<label for="objetivoDelCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.objetivoDelCurso.label" default="Objetivo Del Curso" />
		
	</label>
	<g:textField name="objetivoDelCurso" cols="40" rows="5" maxlength="254" value="${cursosInstance?.objetivoDelCurso}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'duracionEnHoras', 'error')} ">
	<label for="duracionEnHoras" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.duracionEnHoras.label" default="Duracion En Horas" />
		
	</label>
	<g:field name="duracionEnHoras" type="number" value="${cursosInstance.duracionEnHoras}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" cols="40" rows="5" maxlength="254" value="${cursosInstance?.observaciones}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'nombreCoordinador', 'error')} ">
	<label for="nombreCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.nombreCoordinador.label" default="Nombre Coordinador" />
		
	</label>
	<g:textField name="nombreCoordinador" cols="40" rows="5" maxlength="254" value="${cursosInstance?.nombreCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'primerApellidoCoordinador', 'error')} ">
	<label for="primerApellidoCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.primerApellidoCoordinador.label" default="Primer Apellido Coordinador" />
		
	</label>
	<g:textField name="primerApellidoCoordinador" maxlength="254" value="${cursosInstance?.primerApellidoCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'segundoApellidoCordinador', 'error')} ">
	<label for="segundoApellidoCordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.segundoApellidoCordinador.label" default="Segundo Apellido Cordinador" />
		
	</label>
	<g:textField name="segundoApellidoCordinador" cols="40" rows="5" maxlength="254" value="${cursosInstance?.segundoApellidoCordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'telefonoFijoCoordinador', 'error')} ">
	<label for="telefonoFijoCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.telefonoFijoCoordinador.label" default="Telefono Fijo Coordinador" />
		
	</label>
	<g:textField name="telefonoFijoCoordinador" cols="40" rows="5" maxlength="254" value="${cursosInstance?.telefonoFijoCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'faxCoordinador', 'error')} ">
	<label for="faxCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.faxCoordinador.label" default="Fax Coordinador" />
		
	</label>
	<g:textField name="faxCoordinador" cols="40" rows="5" maxlength="254" value="${cursosInstance?.faxCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'email', 'error')} required">
	<label for="email" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${cursosInstance?.email}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'status', 'error')} ">
	<label for="status" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${cursosInstance?.status}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${cursosInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'fechaModificacion', 'error')} ">
	<label for="fechaModificacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.fechaModificacion.label" default="Fecha Modificacion" />
		
	</label>
	<g:datePicker name="fechaModificacion" precision="day"  value="${cursosInstance?.fechaModificacion}" default="none" noSelection="['': '']" />

</div>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'cambioStatus', 'error')} ">
	<label for="cambioStatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.cambioStatus.label" default="Cambio Status" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursosInstance?.cambioStatus?}" var="c">
    <li><g:link controller="cambioStatus" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cambioStatus" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cambioStatus.label', default: 'CambioStatus')])}</g:link>
</li>
</ul>


</div>
 -->
<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'documentoCurso', 'error')} ">
	<label for="documentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.documentoCurso.label" default="Documento Curso" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursosInstance?.documentoCurso?}" var="d">
    <li><g:link controller="documentoCursos" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoCursos" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoCursos.label', default: 'DocumentoCursos')])}</g:link>
</li>
</ul>


</div>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'eventos', 'error')} ">
	<label for="eventos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.eventos.label" default="Eventos" />
		
	</label>
	<g:select name="eventos" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" multiple="multiple" optionKey="id" size="5" value="${cursosInstance?.eventos*.id}" class="many-to-many"/>

</div>
<br>
 -->

<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'tipoCurso', 'error')} required">
	<label for="tipoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="curso.tipoCurso.label" default="Tipo Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoCurso" name="tipoCurso.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso.list()}" optionKey="id" optionValue="descripcion" required="" value="${cursosInstance?.tipoCurso?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>


<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'instituto', 'error')} ">
	<label for="Instituto" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.institutos.label" default="Instituto" />
		
	</label>
	
<!-- <g:link controller="instituto" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'instituto.label', default: 'Instituto')])}</g:link> -->
<g:select id="instituto" name="instituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.Instituto.list()}" optionKey="id" optionValue="razonSocial" required="" value="${cursosInstance?.instituto?.id}" class="many-to-one" class ="form-control"/>


</div>






</div>

