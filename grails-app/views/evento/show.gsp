
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
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index">Gestión evento</g:link></li>
			</ul>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-evento" class="content scaffold-show" role="main">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>


			<ul class="property-list evento">

				<g:if test="${eventoInstance?.fechaInicio}">
					<li class="fieldcontain"><span id="fechaInicio-label"
						class="property-label"><g:message
								code="evento.fechaInicio.label" default="Fecha Inicio" /></span> <span
						class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
								date="${eventoInstance?.fechaInicio}" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.fechaTermino}">
					<li class="fieldcontain"><span id="fechaTermino-label"
						class="property-label"><g:message
								code="evento.fechaTermino.label" default="Fecha Termino" /></span> <span
						class="property-value" aria-labelledby="fechaTermino-label"><g:formatDate
								date="${eventoInstance?.fechaTermino}" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.nombreCordinador}">
					<li class="fieldcontain"><span id="nombreCordinador-label"
						class="property-label"><g:message
								code="evento.nombreCordinador.label" default="Nombre Cordinador" /></span>

						<span class="property-value"
						aria-labelledby="nombreCordinador-label"><g:fieldValue
								bean="${eventoInstance}" field="nombreCordinador" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.primerApellidoCoordinador}">
					<li class="fieldcontain"><span
						id="primerApellidoCoordinador-label" class="property-label"><g:message
								code="evento.primerApellidoCoordinador.label"
								default="Primer Apellido Coordinador" /></span> <span
						class="property-value"
						aria-labelledby="primerApellidoCoordinador-label"><g:fieldValue
								bean="${eventoInstance}" field="primerApellidoCoordinador" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.segundoApellidoCoordinador}">
					<li class="fieldcontain"><span
						id="segundoApellidoCoordinador-label" class="property-label"><g:message
								code="evento.segundoApellidoCoordinador.label"
								default="Segundo Apellido Coordinador" /></span> <span
						class="property-value"
						aria-labelledby="segundoApellidoCoordinador-label"><g:fieldValue
								bean="${eventoInstance}" field="segundoApellidoCoordinador" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.telefonoFijoCoordinador}">
					<li class="fieldcontain"><span
						id="telefonoFijoCoordinador-label" class="property-label"><g:message
								code="evento.telefonoFijoCoordinador.label"
								default="Telefono Fijo Coordinador" /></span> <span
						class="property-value"
						aria-labelledby="telefonoFijoCoordinador-label"><g:fieldValue
								bean="${eventoInstance}" field="telefonoFijoCoordinador" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.faxCoordinador}">
					<li class="fieldcontain"><span id="faxCoordinador-label"
						class="property-label"><g:message
								code="evento.faxCoordinador.label" default="Fax Coordinador" /></span>

						<span class="property-value"
						aria-labelledby="faxCoordinador-label"><g:fieldValue
								bean="${eventoInstance}" field="faxCoordinador" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.email}">
					<li class="fieldcontain"><span id="email-label"
						class="property-label"><g:message code="evento.email.label"
								default="Email" /></span> <span class="property-value"
						aria-labelledby="email-label"><g:fieldValue
								bean="${eventoInstance}" field="email" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.estatus}">
					<li class="fieldcontain"><span id="estatus-label"
						class="property-label"><g:message
								code="evento.estatus.label" default="Estatus" /></span> <span
						class="property-value" aria-labelledby="estatus-label"><g:formatBoolean
								boolean="${eventoInstance?.estatus}" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.domicilioSEDECalle}">
					<li class="fieldcontain"><span id="domicilioSEDECalle-label"
						class="property-label"><g:message
								code="evento.domicilioSEDECalle.label"
								default="Domicilio SEDEC alle" /></span> <span class="property-value"
						aria-labelledby="domicilioSEDECalle-label"><g:fieldValue
								bean="${eventoInstance}" field="domicilioSEDECalle" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.domicilioSEDENumero}">
					<li class="fieldcontain"><span id="domicilioSEDENumero-label"
						class="property-label"><g:message
								code="evento.domicilioSEDENumero.label"
								default="Domicilio SEDEN umero" /></span> <span class="property-value"
						aria-labelledby="domicilioSEDENumero-label"><g:fieldValue
								bean="${eventoInstance}" field="domicilioSEDENumero" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.domicilioSEDESepomex}">
					<li class="fieldcontain"><span id="domicilioSEDESepomex-label"
						class="property-label"><g:message
								code="evento.domicilioSEDESepomex.label"
								default="Domicilio SEDES epomex" /></span> <span
						class="property-value"
						aria-labelledby="domicilioSEDESepomex-label"><g:fieldValue
								bean="${eventoInstance}" field="domicilioSEDESepomex" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="evento.fechaCreacion.label" default="Fecha Creacion" /></span> <span
						class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${eventoInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${eventoInstance?.expositores}">
					<li class="fieldcontain"><span id="expositores-label"
						class="property-label"><g:message
								code="evento.expositores.label" default="Expositores" /></span> <g:each
							in="${eventoInstance.expositores}" var="e">
							<span class="property-value" aria-labelledby="expositores-label"><g:link
									controller="expositor" action="show" id="${e.id}">
									${e?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${eventoInstance?.participantes}">
					<li class="fieldcontain"><span id="participantes-label"
						class="property-label"><g:message
								code="evento.participantes.label" default="Participantes" /></span> <g:each
							in="${eventoInstance.participantes}" var="p">
							<span class="property-value"
								aria-labelledby="participantes-label"><g:link
									controller="participante" action="show" id="${p.id}">
									${p?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

			</ul>
			<g:form url="[resource:eventoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn-primary colortitle colorblack" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
</body>
</html>
