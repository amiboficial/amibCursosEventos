<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaInicio', 'error')} ">
	<label for="fechaInicio" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaInicio.label" default="Fecha Inicio" />
		
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${eventoInstance?.fechaInicio}"  />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaTermino', 'error')} ">
	<label for="fechaTermino" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaTermino.label" default="Fecha Termino" />
		
	</label>
	<g:datePicker name="fechaTermino" precision="day"  value="${eventoInstance?.fechaTermino}"  />

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
	<g:textField name="segundoApellidoCoordinador" maxlength="100" value="${eventoInstance?.segundoApellidoCoordinador}"class ="form-control"/>

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
	<g:textField name="estatus" value="${eventoInstance?.estatus}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain" >
<table style="width: 100%">
					<tr>
						<td class="label" style="text-align: right; width: 40%">Código Postal: <span class="required-indicator">*</span></td>
						<td>
						<input type="text" id="txtCP" style="float: left;" class ="form-control"></input><button onclick="return window.open('http://www.correosdemexico.gob.mx/ServiciosLinea/Paginas/ccpostales.aspx');" id="btnIconoBuscarCP" style="font-size:small;">&nbsp;Buscar ...</button>
						<g:hasErrors bean="${eventoInstance}" field="sepomex">
							<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
						</g:hasErrors>&nbsp;
						</td>
					<tr>
						<td class="label" style="text-align: right">
						Entidad Federativa:
						</td>
						<td>
						<input type="text" id="txtEntidad" disabled="disabled" value="" class ="form-control"></input>
						</td>
					</tr>
					<br>
					<tr>
						<td class="label" style="text-align: right">
						Delegación ó Municipio:
						</td>
						<td>
						<input type="text" id="txtDelegacion" disabled="disabled" value="" class ="form-control"></input>
						</td>
					</tr>
					<br>
					<tr>
						<td class="label" style="text-align: right">
						Ciudad:
						</td>
						<td>
						<input type="text" id="txtCiudad" disabled="disabled" value="" class ="form-control"></input>
						</td>
					</tr>
					<br>
					<tr>
						<td class="label" style="text-align: right">
						Asentamiento:
						</td>
						<td>
						<select id="selAsentamiento" name="evento.sepomex.id" style="float: left;" required>
							<option value="">-Seleccione-</option>
						</select>
							<g:hasErrors bean="${eventoInstance}" field="sepomex">
								<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
							</g:hasErrors>
						</td>
					</tr>

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

<!-- 
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'domicilioSEDESepomex', 'error')} ">
	<label for="domicilioSEDESepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.domicilioSEDESepomex.label" default="Domicilio SEDES epomex" />
		
	</label>
	<g:field name="domicilioSEDESepomex" type="number" value="${eventoInstance.domicilioSEDESepomex}" class ="form-control"/>

</div>
<br> -->
</table>
</div>


<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${eventoInstance?.fechaCreacion}" />

</div>
<br>
<%--<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'cambioEstatusEvento', 'error')} ">
	<label for="cambioEstatusEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.cambioEstatusEvento.label" default="Cambio Estatus Evento" />
		<span class="required-indicator">*</span>
	</label>
<g:select id="cambioStatusEvento" name="cambioStatusEvento.id" from="${mx.amib.sistemas.cursoseventos.eventos.model.log.CambioStatusEvento.list()}" optionKey="id" optionValue="descripcion" required="" value="${eventoInstance?.cambioEstatusEvento?.id}" class="many-to-one" class ="form-control"/>
 --%>


</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'documentoEvento', 'error')} ">
	<label for="documentoEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.documentoEvento.label" default="Documento Evento" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventoInstance?.documentoEvento?}" var="d">
    <li><g:link controller="documentoEvento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoEvento" action="create" params="['evento.id': eventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoEvento.label', default: 'DocumentoEvento')])}</g:link>

</li>
</ul>


</div>


<br>
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'cursos', 'error')} required">
	<label for="cursos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.tipoInstituto.label" default="Lista de cursos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cursos" name="cursos.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" optionKey="id" optionValue="nombreDelCurso" required="" value="${cursosInstance?.id}" class="many-to-one" class ="form-control"/>

</div>



<br>
<%-- 

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'horarioEvento', 'error')} ">
	<label for="horarioEvento" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.horarioEvento.label" default="Horario Evento" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventoInstance?.horarioEvento?}" var="h">
    <li><g:link controller="horarioEvento" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="horarioEvento" action="create" params="['evento.id': eventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'horarioEvento.label', default: 'HorarioEvento')])}</g:link>
</li>
</ul>


</div>
<br>
 -->
<!-- 
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'participantes', 'error')} ">
	<label for="participantes" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.participantes.label" default="Participantes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventoInstance?.participantes?}" var="p">
    <li><g:link controller="participante" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="participante" action="create" params="['evento.id': eventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'participante.label', default: 'Participante')])}</g:link>
</li>
</ul>
<br>
</div>
 --%>



