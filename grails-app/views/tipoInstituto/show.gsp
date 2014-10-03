
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.catalogo.TipoInstituto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoInstituto.label', default: 'TipoInstituto')}" />
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
				
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión tipo intituto</g:link></li>

			</ul><br>
			
		</div>
	</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-tipoInstituto" class="content scaffold-show"
						role="main">
						<h1>
							Mostrar Tipo de instituto
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

			<ul class="property-list tipoInstituto">

				<g:if test="${tipoInstitutoInstance?.vigente}">
					<li class="fieldcontain"><span id="vigente-label"
						class="property-label"><g:message
								code="tipoInstituto.vigente.label" default="Vigente" /></span> <span
						class="property-value" aria-labelledby="vigente-label"><g:formatBoolean
								boolean="${tipoInstitutoInstance?.vigente}" /></span></li>
				</g:if>
				<br>
				<g:if test="${tipoInstitutoInstance?.descripcion}">
					<li class="fieldcontain"><span id="descripcion-label"
						class="property-label"><g:message
								code="tipoInstituto.descripcion.label" default="Descripcion" /></span>

						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
								bean="${tipoInstitutoInstance}" field="descripcion" /></span></li>
				</g:if>
			<br>
			</ul>
			<g:form url="[resource:tipoInstitutoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${tipoInstitutoInstance}">	<g:message code="default.button.edit.label" default="Edit" /></g:link>
						&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset>
				<br>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
