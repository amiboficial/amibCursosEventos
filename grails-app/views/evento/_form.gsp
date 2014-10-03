<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaInicio', 'error')} ">
	<label for="fechaInicio" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaInicio.label" default="Fecha Inicio" />
		
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${eventoInstance?.fechaInicio}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaTermino', 'error')} ">
	<label for="fechaTermino" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaTermino.label" default="Fecha Termino" />
		
	</label>
	<g:datePicker name="fechaTermino" precision="day"  value="${eventoInstance?.fechaTermino}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nombreCordinador', 'error')} ">
	<label for="nombreCordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.nombreCordinador.label" default="Nombre Cordinador" />
		
	</label>
	<g:textField name="nombreCordinador" maxlength="100" value="${eventoInstance?.nombreCordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'primerApellidoCoordinador', 'error')} ">
	<label for="primerApellidoCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.primerApellidoCoordinador.label" default="Primer Apellido Coordinador" />
		
	</label>
	<g:textField name="primerApellidoCoordinador" maxlength="100" value="${eventoInstance?.primerApellidoCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'segundoApellidoCoordinador', 'error')} ">
	<label for="segundoApellidoCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.segundoApellidoCoordinador.label" default="Segundo Apellido Coordinador" />
		
	</label>
	<g:textField name="segundoApellidoCoordinador" maxlength="100" value="${eventoInstance?.segundoApellidoCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'telefonoFijoCoordinador', 'error')} ">
	<label for="telefonoFijoCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.telefonoFijoCoordinador.label" default="Telefono Fijo Coordinador" />
		
	</label>
	<g:textField name="telefonoFijoCoordinador" maxlength="20" value="${eventoInstance?.telefonoFijoCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'faxCoordinador', 'error')} ">
	<label for="faxCoordinador" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.faxCoordinador.label" default="Fax Coordinador" />
		
	</label>
	<g:textField name="faxCoordinador" maxlength="20" value="${eventoInstance?.faxCoordinador}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'email', 'error')} required">
	<label for="email" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${eventoInstance?.email}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'estatus', 'error')} ">
	<label for="estatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.estatus.label" default="Estatus" />
		
	</label>
	<g:checkBox name="estatus" value="${eventoInstance?.estatus}" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'domicilioSEDECalle', 'error')} ">
	<label for="domicilioSEDECalle" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.domicilioSEDECalle.label" default="Domicilio SEDEC alle" />
		
	</label>
	<g:textField name="domicilioSEDECalle" maxlength="100" value="${eventoInstance?.domicilioSEDECalle}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'domicilioSEDENumero', 'error')} ">
	<label for="domicilioSEDENumero" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.domicilioSEDENumero.label" default="Domicilio SEDEN umero" />
		
	</label>
	<g:textField name="domicilioSEDENumero" maxlength="20" value="${eventoInstance?.domicilioSEDENumero}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'domicilioSEDESepomex', 'error')} ">
	<label for="domicilioSEDESepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.domicilioSEDESepomex.label" default="Domicilio SEDES epomex" />
		
	</label>
	<g:field name="domicilioSEDESepomex" type="number" value="${eventoInstance.domicilioSEDESepomex}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${eventoInstance?.fechaCreacion}" default="none" noSelection="['': '']" />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'expositores', 'error')} ">
	<label for="expositores" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.expositores.label" default="Expositores" />
		
	</label>
	<g:select name="expositores" from="${mx.amib.sistemas.cursoseventos.cursos.model.Expositor.list()}" multiple="multiple" optionKey="id" size="5" value="${eventoInstance?.expositores*.id}" class="many-to-many" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'participantes', 'error')} ">
	<label for="participantes" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.participantes.label" default="Participantes" />
		
	</label>
	

<g:select id="participante" name="participante.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.Participante.list()}" optionKey="id" required="" value="${eventoInstance?.participantes?.id}" class="many-to-one"/>

</div>
</div>

