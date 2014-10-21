
<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoCurso.label', default: 'TipoCurso')}" />
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestion de Tipos de Curso</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-tipoCurso" class="content scaffold-show" role="main">
						<h1>
							Mostrar Tipo de Curso
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


			<ol class="property-list tipoCurso">

				<g:if test="${tipoCursoInstance?.vigente}">
					<li class="fieldcontain"><span id="vigente-label"
						class="property-label"><g:message
								code="tipoCurso.vigente.label" default="Vigente" /></span> <span
						class="property-value" aria-labelledby="vigente-label"><g:formatBoolean
								boolean="${tipoCursoInstance?.vigente}" /></span></li>
				</g:if>

				<g:if test="${tipoCursoInstance?.descripcion}">
					<li class="fieldcontain"><span id="descripcion-label"
						class="property-label"><g:message
								code="tipoCurso.descripcion.label" default="Descripcion" /></span> <span
						class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
								bean="${tipoCursoInstance}" field="descripcion" /></span></li>
				</g:if>

			</ol>
			<g:form url="[resource:tipoCursoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack" action="edit" resource="${tipoCursoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					&nbsp;
					<g:actionSubmit class="delete btn btn-primary colortitle colorblack" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link>	
				</fieldset><br>
			</g:form>
		</div>
	</fieldset>
</body>
</html>
