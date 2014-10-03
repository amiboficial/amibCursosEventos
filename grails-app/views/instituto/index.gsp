
<%@ page
	import="mx.amib.sistemas.cursoseventos.institutos.model.Instituto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'instituto.label', default: 'Instituto')}" />
<title>Instituto</title>

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
				<!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Nuevo Instituto</g:link></li>
			</ul><br>
			<br>
		</div>
	</fieldset>

	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-instituto" class="content scaffold-list" role="main">
					<h1>Geston instituto</h1>
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
                	<h3 class="panel-title">Lista de institutos</h3>
				</div>

	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
				<tr>

					<g:sortableColumn property="razonSocial"
						title="${message(code: 'instituto.razonSocial.label', default: 'Razon Social')}" />

					<g:sortableColumn property="siglas"
						title="${message(code: 'instituto.siglas.label', default: 'Siglas')}" />

					<g:sortableColumn property="rfc"
						title="${message(code: 'instituto.rfc.label', default: 'Rfc')}" />

					<g:sortableColumn property="correo"
						title="${message(code: 'instituto.correo.label', default: 'Correo')}" />

					<g:sortableColumn property="numeroEscritura"
						title="${message(code: 'instituto.numeroEscritura.label', default: 'Numero Escritura')}" />

					<g:sortableColumn property="aniosExperiencia"
						title="${message(code: 'instituto.aniosExperiencia.label', default: 'Anios Experiencia')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${institutoInstanceList}" status="i"
					var="institutoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${institutoInstance.id}">
								${fieldValue(bean: institutoInstance, field: "razonSocial")}
							</g:link></td>

						<td>
							${fieldValue(bean: institutoInstance, field: "siglas")}
						</td>

						<td>
							${fieldValue(bean: institutoInstance, field: "rfc")}
						</td>

						<td>
							${fieldValue(bean: institutoInstance, field: "correo")}
						</td>

						<td>
							${fieldValue(bean: institutoInstance, field: "numeroEscritura")}
						</td>

						<td>
							${fieldValue(bean: institutoInstance, field: "aniosExperiencia")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		</div>
		</fieldset>
		<div class="pagination">
			<g:paginate total="${institutoInstanceCount ?: 0}" />
		</div>

</body>
</html>
