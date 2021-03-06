
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoTelefono.label', default: 'TipoTelefono')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
			<ul class="nav navbar-nav" role="navigation">
				<!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>  -->
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear Tipos de Teléfonos</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-tipoTelefono" class="content scaffold-list"
					role="main">
					<h1>
						Gestión de Tipos de Teléfonos
					</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
				</div>
			</div>
		</div>
	</fieldset>

	<fieldset>
			<div class="panel panel-default">
            	<div class="panel-heading">
                	<h3 class="panel-title">Lista de tipos de teléfono</h3>
				</div>
				
			<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoTelefono.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="vigente" title="${message(code: 'tipoTelefono.vigente.label', default: 'Vigente')}" />
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoTelefonoInstanceList}" status="i" var="tipoTelefonoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoTelefonoInstance.id}">${fieldValue(bean: tipoTelefonoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoTelefonoInstance, field: "vigente")}</td>
							
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			</fieldset>
			<div class="pagination">
				<g:paginate total="${tipoTelefonoInstanceCount ?: 0}" />
			</div>
	</body>
</html>
