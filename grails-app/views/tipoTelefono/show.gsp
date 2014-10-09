
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoTelefono.label', default: 'TipoTelefono')}" />
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión tipo teléfono</g:link></li>
			</ul>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-tipoTelefono" class="content scaffold-show"
						role="main">
						<h1>
							Mostrar Tipos de Teléfonos
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
			<ul class="property-list tipoTelefono">

				<g:if test="${tipoTelefonoInstance?.vigente}">
					<li class="fieldcontain"><span id="vigente-label"
						class="property-label"><g:message
								code="tipoTelefono.vigente.label" default="Vigente" /></span> <span
						class="property-value" aria-labelledby="vigente-label"><g:formatBoolean
								boolean="${tipoTelefonoInstance?.vigente}" /></span></li>
				</g:if>

				<g:if test="${tipoTelefonoInstance?.descripcion}">
					<li class="fieldcontain"><span id="descripcion-label"
						class="property-label"><g:message
								code="tipoTelefono.descripcion.label" default="Descripcion" /></span>

						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
								bean="${tipoTelefonoInstance}" field="descripcion" /></span></li>
				</g:if>

				<g:if test="${tipoTelefonoInstance?.telefonos}">
					<li class="fieldcontain"><span id="telefonos-label"
						class="property-label"><g:message
								code="tipoTelefono.telefonos.label" default="Telefonos" /></span> <g:each
							in="${tipoTelefonoInstance.telefonos}" var="t">
							<span class="property-value" aria-labelledby="telefonos-label"><g:link
									controller="telefonoInstituto" action="show" id="${t.id}">
									${t?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

			</ul>
			<g:form url="[resource:tipoTelefonoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack"
						action="edit" resource="${tipoTelefonoInstance}">
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
	</fieldset>
</body>
</html>
