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
 
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.cp" default="Codigo Postal" />
	</label>
	<input type="text" id="txtCP" style="float: left;" class ="form-control"></input><button onclick="return window.open('http://www.correosdemexico.gob.mx/ServiciosLinea/Paginas/ccpostales.aspx');" id="btnIconoBuscarCP" style="font-size:small;">&nbsp;Buscar ...</button>
		<g:hasErrors bean="${eventoInstance}" field="sepomex">
			<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
		</g:hasErrors>&nbsp;
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.ed" default="Entidad Federativa" />
	</label>
	<input type="text" id="txtEntidad" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.dm" default="Delegación ó Municipio" />
	</label>
	<input type="text" id="txtDelegacion" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain" >	
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.cd" default="Ciudad" />
	</label>
	<input type="text" id="txtCiudad" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: eventoInstance, select: 'domicilioSEDESepomex', 'error')}" >
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.as" default="Asentamiento" />
	</label>
	<select id="selAsentamiento" name="domicilioSEDESepomex" style="float: left;" required>
		<option value=" ">-Seleccione-</option>
	</select>
	<g:hasErrors bean="${eventoInstance.domicilioSEDESepomex}" field="domicilioSEDESepomex">
		<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
	</g:hasErrors>
</div>
<br>
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

<!-- 
<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'domicilioSEDESepomex', 'error')} ">
	<label for="domicilioSEDESepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="evento.domicilioSEDESepomex.label" default="Domicilio SEDES epomex" />
	</label>
	<g:field name="domicilioSEDESepomex" type="number" value="${eventoInstance.domicilioSEDESepomex}" class ="form-control"/>

</div>
<br> 
 -->

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
	  <%-- <fieldset>
				<legend>Documentos de respaldo</legend>
				
				<div id="divDocsCompletos" class="alert alert-danger">
					<span class="glyphicon glyphicon-ban-circle"></span> Debes incluir un documento de respaldo
				</div>
				
				<div id="divMultiplesDocumentos">
					
					<div class="msgProcesando alert alert-info">
						<asset:image src="spinner_alert_info.gif"/> <strong>Procesando datos, espere un momento</strong>.
					</div>
					<div class="msgErrorPeticion alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Ha habído un error al procesar la petición.
					</div>
					<div class="msgErrorTipoNoSel alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Debes seleccionar el tipo de documento a cargar.
					</div>
					<div class="msgErrorTipoNoArc alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Debes seleccionar un archivo a cargar.
					</div>
					<div class="msgErrorValidadorExt alert alert-danger">
					</div>
					
					<div class="newFileRow row">
						<div class="archivoInputDiv col-md-5">
							<label class="control-label col-md-4">Seleccione un archivo:</label>
							<div class="col-md-8"><input type="file" class="file" id="ZmlsZURvY3VtZW50bw"/></div>
						</div>
						<div class="tipoDiv col-md-4">
							<label class="control-label col-md-4">Tipo:</label>
							<div class="col-md-8">
								<select class="tipoDocumento form-control col-md-8">
									<option value="null">-Seleccione-</option>
									 <g:each in="${viewModelInstance.tipoDocumentoList}">
										validador.addDocType(${it.id});
										<option value="${it.id}">${it.tipoDoumentoEvento}</option>
									</g:each> 
								</select>
							</div> 
						</div>
						<div class="col-md-3" style="text-align:center;">
							<button type="button" class="add btn btn-sm btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Agregar</button>
						</div>
					</div>
					<br/>
					
					<div class="listaDocs list-group">						
					</div>
					
				</div>
				<input type="hidden" id="hdnDocsDeleted" name="idsDocumentosBorrados" value=""/>
				<input type="hidden" id="hdnDocsIsBusy" value="false"/>
				
				<g:if test="${viewModelInstance.validDocumentosCargados == true}">
					<input type="hidden" id="hdnDocsModelValidatedLoaded" value="true"/>  
				</g:if> 
				<g:else>
					<input type="hidden" id="hdnDocsModelValidatedLoaded" value="false"/>
				</g:else>
				
				
				<input type="hidden" id="hdnDocsModelValidated" value="false"/>
				<input type="hidden" id="hdnDocsModelValidatedMsg" value=""/>
			</fieldset>
--%>
<br>



<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'cursos', 'error')} required">
	<label for="cursos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.tipoInstituto.label" default="Lista de cursos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cursos" name="cursos.id" from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}" optionKey="id" optionValue="nombreDelCurso" required="" value="${cursosInstance?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
<fieldset>
				<legend>Datos de participantes</legend>
				
				<div id="divParticipantes">
				<div id="divMsgMatriculaYaEnLista" class="alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Matrícula <strong>ya agregada</strong>.
					</div>
					<div id="divMsgMatriculaNoEncontrada" class="alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Matrícula <strong>no encontrada</strong>.
					</div>
					<div id="divMsgErrorSolicitud" class="alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Error al procesar la solicitud</strong>.
					</div>
					<div id="divMsgProcesandoAutorizado" class="alert alert-info">
						<asset:image src="spinner_alert_info.gif"/> <strong>Procesando datos, espere un momento</strong>.
					</div>
					<div id="divMsgAlMenosUnAutorizado" class="alert alert-danger">
						<span class="glyphicon glyphicon-ban-circle"></span> Se requiere ingresar <strong>al menos un autorizado</strong>.
					</div>

					<table class="table">
						<thead>
							<tr>
								<th style='width:20%;'>Matrícula</th>
								<th>Nombre completo</th>
								<th style='width:8%'>...</th>
							</tr>
						</thead>
						<tbody id="tbdyParticipantes">
							
							
						</tbody>
					</table>
					
				</div>
				
				<input type="hidden" id="hdnParticipantesWidgetLoadedCount" value="${eventoInstance?.participantes?.size()}"/>
				<input type="hidden" id="hdnParticipantesWidgetCount" />
			</fieldset>

<br>
















<%-- <div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'documentoEvento', 'error')} ">
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

</div>--%>

<!-- 
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
 -->



