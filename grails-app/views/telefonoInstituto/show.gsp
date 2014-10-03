
<%@ page
	import="mx.amib.sistemas.cursoseventos.institutos.model.TelefonoInstituto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>

<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

<g:javascript src="dataTableFormat.js" />
</head>
<body>
	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav navbar-center">

				<!-- <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li> -->
				<li><g:link
						class="create btn btn-primary colortitle colorblack"
						action="create">Gestión teléfono instituto</g:link></li>
			</ul>
		</div>
	</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-telefonoInstituto" class="content scaffold-show"
						role="main">
						<h1>Mostrar teléfono instituto</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
					</div>
				</div>
			</div>
			<br>

			<ul class="property-list telefonoInstituto">

				<g:if test="${telefonoInstitutoInstance?.telefono}">
					<li class="fieldcontain"><span id="telefono-label"
						class="property-label"><g:message
								code="telefonoInstituto.telefono.label" default="Telefono" /></span> <span
						class="property-value" aria-labelledby="telefono-label"><g:fieldValue
								bean="${telefonoInstitutoInstance}" field="telefono" /></span></li>
				</g:if>

				<g:if test="${telefonoInstitutoInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="telefonoInstituto.fechaCreacion.label"
								default="Fecha Creacion" /></span> <span class="property-value"
						aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${telefonoInstitutoInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${telefonoInstitutoInstance?.instituto}">
					<li class="fieldcontain"><span id="instituto-label"
						class="property-label"><g:message
								code="telefonoInstituto.instituto.label" default="Instituto" /></span>

						<span class="property-value" aria-labelledby="instituto-label"><g:link
								controller="instituto" action="show"
								id="${telefonoInstitutoInstance?.instituto?.id}">
								${telefonoInstitutoInstance?.instituto?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${telefonoInstitutoInstance?.tipotelefono}">
					<li class="fieldcontain"><span id="tipotelefono-label"
						class="property-label"><g:message
								code="telefonoInstituto.tipotelefono.label"
								default="Tipotelefono" /></span> <span class="property-value"
						aria-labelledby="tipotelefono-label"><g:link
								controller="tipoTelefono" action="show"
								id="${telefonoInstitutoInstance?.tipotelefono?.id}">
								${telefonoInstitutoInstance?.tipotelefono?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:telefonoInstitutoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${telefonoInstitutoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
			</g:form>
		</div>
</body>
</fieldset>
</html>
