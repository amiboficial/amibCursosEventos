
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav navbar-center">
				<li><g:link class="list btn btn-default btn-primary" action="index">Gestión evento</g:link></li>
			</ul><br>
		</div>
		</fieldset>
		<fieldset>
			<div class="panel panel-default col-lg-12">
				<div class="panel-heading">
					<div class="widgetTitle">
						<div id="show-evento" class="content scaffold-show" role="main">
							<h1>
							Mostrar Eventos
							</h1>
							<g:if test="${flash.message}">
								<div class="message" role="status">
									${flash.message}
								</div>
							</g:if>
						</div>
					</div>
				</div>
				<br>
				<ul class="property-list evento list-group">
				
				<g:if test="${eventoInstance?.nombreEvento}">
						<li class="fieldcontain list-group-item"><span id="nombreEvento-label"
							class="property-label"><g:message
									code="evento.nombreEvento.label"
									default="Nombre del Evento: " /></span> <span class="property-value"
							aria-labelledby="nombreEvento-label"><g:fieldValue
									bean="${eventoInstance}" field="nombreEvento" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.fechaInicio}">
						<li class="fieldcontain list-group-item"><span id="fechaInicio-label"
							class="property-label"><g:message
									code="evento.fechaInicio.label" default="Fecha de Inicio: " /></span> <span
							class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
									date="${eventoInstance?.fechaInicio}" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.fechaTermino}">
						<li class="fieldcontain list-group-item"><span id="fechaTermino-label"
							class="property-label"><g:message
									code="evento.fechaTermino.label" default="Fecha de Termino:" /></span> <span
							class="property-value" aria-labelledby="fechaTermino-label"><g:formatDate
									date="${eventoInstance?.fechaTermino}" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.nombreCordinador}">
						<li class="fieldcontain list-group-item"><span id="nombreCordinador-label"
							class="property-label"><g:message
									code="evento.nombreCordinador.label"
									default="Nombre del Coordinador: " /></span> <span class="property-value"
							aria-labelledby="nombreCordinador-label"><g:fieldValue
									bean="${eventoInstance}" field="nombreCordinador" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.primerApellidoCoordinador}">
						<li class="fieldcontain list-group-item"><span
							id="primerApellidoCoordinador-label" class="property-label"><g:message
									code="evento.primerApellidoCoordinador.label"
									default="Apellido Paterno: " /></span> <span
							class="property-value"
							aria-labelledby="primerApellidoCoordinador-label"><g:fieldValue
									bean="${eventoInstance}" field="primerApellidoCoordinador" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.segundoApellidoCoordinador}">
						<li class="fieldcontain list-group-item"><span
							id="segundoApellidoCoordinador-label" class="property-label"><g:message
									code="evento.segundoApellidoCoordinador.label"
									default="Apellido Materno: " /></span> <span
							class="property-value"
							aria-labelledby="segundoApellidoCoordinador-label"><g:fieldValue
									bean="${eventoInstance}" field="segundoApellidoCoordinador" /></span>

						</li>
					</g:if>

					<g:if test="${eventoInstance?.telefonoFijoCoordinador}">
						<li class="fieldcontain list-group-item"><span
							id="telefonoFijoCoordinador-label" class="property-label"><g:message
									code="evento.telefonoFijoCoordinador.label"
									default="Telefono: " /></span> <span
							class="property-value"
							aria-labelledby="telefonoFijoCoordinador-label"><g:fieldValue
									bean="${eventoInstance}" field="telefonoFijoCoordinador" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.faxCoordinador}">
						<li class="fieldcontain list-group-item"><span id="faxCoordinador-label"
							class="property-label"><g:message
									code="evento.faxCoordinador.label" default="Fax: " /></span>

							<span class="property-value"
							aria-labelledby="faxCoordinador-label"><g:fieldValue
									bean="${eventoInstance}" field="faxCoordinador" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.email}">
						<li class="fieldcontain list-group-item"><span id="email-label"
							class="property-label"><g:message
									code="evento.email.label" default="Email: " /></span> <span
							class="property-value" aria-labelledby="email-label"><g:fieldValue
									bean="${eventoInstance}" field="email" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.estatus}">
						<li class="fieldcontain list-group-item"><span id="estatus-label"
							class="property-label"><g:message
									code="evento.estatus.label" default="Estatus: " /></span> <span
							class="property-value" aria-labelledby="estatus-label"><g:fieldValue
									bean="${eventoInstance}" field="estatus" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.domicilioSEDECalle}">
						<li class="fieldcontain list-group-item"><span id="domicilioSEDECalle-label"
							class="property-label"><g:message
									code="evento.domicilioSEDECalle.label"
									default="Sede: Calle " /></span> <span class="property-value"
							aria-labelledby="domicilioSEDECalle-label"><g:fieldValue
									bean="${eventoInstance}" field="domicilioSEDECalle" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.domicilioSEDENumero}">
						<li class="fieldcontain list-group-item"><span id="domicilioSEDENumero-label"
							class="property-label"><g:message
									code="evento.domicilioSEDENumero.label"
									default="Sede Numero: " /></span> <span
							class="property-value"
							aria-labelledby="domicilioSEDENumero-label"><g:fieldValue
									bean="${eventoInstance}" field="domicilioSEDENumero" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.domicilioSEDESepomex}">
						<li class="fieldcontain list-group-item"><span
							id="domicilioSEDESepomex-label" class="property-label"><g:message
									code="evento.domicilioSEDESepomex.label"
									default="Domicilio Sede: " /></span> <span
							class="property-value"
							aria-labelledby="domicilioSEDESepomex-label"><g:fieldValue
									bean="${eventoInstance}" field="domicilioSEDESepomex" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.fechaCreacion}">
						<li class="fieldcontain list-group-item"><span id="fechaCreacion-label"
							class="property-label"><g:message
									code="evento.fechaCreacion.label" default="Fecha de Creacion: " /></span>

							<span class="property-value"
							aria-labelledby="fechaCreacion-label"><g:formatDate
									date="${eventoInstance?.fechaCreacion}" /></span></li>
					</g:if>

					<g:if test="${eventoInstance?.cambioEstatusEvento}">
						<li class="fieldcontain list-group-item"><span id="cambioEstatusEvento-label"
							class="property-label"><g:message
									code="evento.cambioEstatusEvento.label"
									default="Cambio de Estatus de Evento" /></span> <g:each
								in="${eventoInstance.cambioEstatusEvento}" var="c">
								<span class="property-value"
									aria-labelledby="cambioEstatusEvento-label"><g:link
										controller="cambioStatusEvento" action="show" id="${c.id}">
										${c?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<%--<g:if test="${eventoInstance?.documentoEvento}">
						<li class="fieldcontain list-group-item"><span id="documentoEvento-label"
							class="property-label"><g:message
									code="evento.documentoEvento.label" default="Documentos del Evento: " /></span>

							<g:each in="${eventoInstance.documentoEvento}" var="d">
								<span class="property-value"
									aria-labelledby="documentoEvento-label"><g:link
										controller="documentoEvento" action="show" id="${d.id}">
										${d?.tipoDocumentoEvento.tipoDocumentoEvento.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if> --%>

					<g:if test="${eventoInstance?.horarioEvento}">
						<li class="fieldcontain list-group-item"><span id="horarioEvento-label"
							class="property-label"><g:message
									code="evento.horarioEvento.label" default="Horario del Evento" /></span>

							<g:each in="${eventoInstance.horarioEvento}" var="h">
								<span class="property-value"
									aria-labelledby="horarioEvento-label"><g:link
										controller="horarioEvento" action="show" id="${h.id}">
										${h?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>

					<%--<g:if test="${eventoInstance?.expositores}">
						<li class="fieldcontain list-group-item"><span id="expositores-label"
							class="property-label"><g:message
									code="evento.expositores.label" default="Expositores: " /></span> <g:each
								in="${eventoInstance.expositores}" var="e">
								<span class="property-value"
									aria-labelledby="expositores-label"><g:link
										controller="expositor" action="show" id="${e.id}">
										${e?.nombreExpositor.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if><br> --%>
					<br>
					<fieldset>
					
					<legend><i>Datos de Documentos</i></legend>
			
			<table class="table">
				<thead>
					<tr>
						<th style='width:20%;'>Nombre</th>
						<th style='width:20%;'>Tipo</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${eventoInstance?.documentoEvento}">
						<tr>
							<td>${it.nombreDeArchivo}</td>
							<td>${it.tipoDocumentoEvento?.tipoDocumentoEvento}</td>

						</tr>
					</g:each>
				</tbody>
			</table>
						</fieldset>
						
			<br>
					
					<fieldset>
			<legend><i>Datos de Participantes</i></legend>
			
			<table class="table">
				<thead>
					<tr>
						<th style='width:20%;'>Matrícula</th>
						<th>Nombre completo</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${eventoInstance?.participantes}">
						<tr>
							<td>${it.numeroMatricula}</td>
							<td>${it.nombreCompleto}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			
		</fieldset>
		<br><br>
		<fieldset>			
			<legend><i>Datos de Expositores</i></legend>
			
			<table class="table">
				<thead>
					<tr>
						<th style='width:20%;'>Nombre</th>
						<th style='width:20%;'>Apellido Paterno</th>
						<th style='width:20%;'>Apellido Materno</th>
						<th style='width:20%;'>horas</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${eventoInstance?.expositores}">
						<tr>
							<td>${it.nombreExpositor}</td>
							<td>${it.primerApellidoExpositor}</td>
							<td>${it.segundoApellidoExpositor}</td>
							<td>${it.horas}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			
	</fieldset>
				<%-- 	<g:if test="${eventoInstance?.participantes}">
						<li class="fieldcontain list-group-item"><span id="participantes-label"
							class="property-label"><g:message
									code="evento.participantes.label" default="Participantes: " /></span> <g:each
								in="${eventoInstance.participantes}" var="p">
								<span class="property-value"
									aria-labelledby="participantes-label"><g:link
										controller="participante" action="show" id="${p.id}">
										${p?.nombreCompleto.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>--%>

				</ul><br>
				<g:form url="[resource:eventoInstance, action:'delete']"
					method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit btn btn-default btn-primary" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							&nbsp;
						<g:actionSubmit class="delete btn btn-default btn-primary" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							&nbsp;
						<g:link class="list btn btn-default btn-primary" action="index">Regresar</g:link></li>
					</fieldset><br>
				</g:form>
			</div>
			
			<script>
	function btnNuevaRevoc_click(){
		window.location.href = "<g:createLink controller="evento" action="create" />";
	}
	function btnRevisarRevoc_click(id){
		window.location.href = "<g:createLink controller="evento" action="editVerify" />/"+id;
	}
	function btnEditarRevoc_click(id){
		window.location.href = "<g:createLink controller="evento" action="edit" />/"+id;
	}
	function btnEliminarRevoc_click(id){
		var url = '<g:createLink controller="cursos" action="delete" />/'+id
		var r = confirm("¿Desea eliminar el elemento seleccionado?");
		if(r == true)
			window.location.href = url;
	}
	function btnDescargar_click(uuid){
		window.open("<g:createLink controller="documentoEvento" action="download" />/"+uuid);
	}
	</script>
	<!-- FIN: SCRIPTS ESPECIFICOS DE VISTA -->
			</body>
</html>
