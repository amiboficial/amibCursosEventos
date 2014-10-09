
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.HorarioEvento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'horarioEvento.label', default: 'HorarioEvento')}" />
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
			
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Horarios de Eventos</g:link></li>
				
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-horarioEvento" class="content scaffold-show"
						role="main">
						<h1>
							Mostrar Horarios de Evento
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

			<ul class="property-list horarioEvento">

				<g:if test="${horarioEventoInstance?.fechaDia}">
					<li class="fieldcontain"><span id="fechaDia-label"
						class="property-label"><g:message
								code="horarioEvento.fechaDia.label" default="Fecha Dia" /></span> <span
						class="property-value" aria-labelledby="fechaDia-label"><g:formatDate
								date="${horarioEventoInstance?.fechaDia}" /></span></li>
				</g:if>

				<g:if test="${horarioEventoInstance?.horaInicio}">
					<li class="fieldcontain"><span id="horaInicio-label"
						class="property-label"><g:message
								code="horarioEvento.horaInicio.label" default="Hora Inicio" /></span>

						<span class="property-value" aria-labelledby="horaInicio-label"><g:fieldValue
								bean="${horarioEventoInstance}" field="horaInicio" /></span></li>
				</g:if>

				<g:if test="${horarioEventoInstance?.horafin}">
					<li class="fieldcontain"><span id="horafin-label"
						class="property-label"><g:message
								code="horarioEvento.horafin.label" default="Horafin" /></span> <span
						class="property-value" aria-labelledby="horafin-label"><g:fieldValue
								bean="${horarioEventoInstance}" field="horafin" /></span></li>
				</g:if>

				<g:if test="${horarioEventoInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="horarioEvento.fechaCreacion.label"
								default="Fecha Creacion" /></span> <span class="property-value"
						aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${horarioEventoInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${horarioEventoInstance?.evento}">
					<li class="fieldcontain"><span id="evento-label"
						class="property-label"><g:message
								code="horarioEvento.evento.label" default="Evento" /></span> <span
						class="property-value" aria-labelledby="evento-label"><g:link
								controller="evento" action="show"
								id="${horarioEventoInstance?.evento?.id}">
								${horarioEventoInstance?.evento?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:horarioEventoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack"
						action="edit" resource="${horarioEventoInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					&nbsp;
					<g:actionSubmit
						class="delete btn btn-primary colortitle colorblack"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack"
						action="index">Regresar</g:link>
					</li>
				</fieldset>
			</g:form>
		</div>
</body>
</html>
