
<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.Instituto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instituto.label', default: 'Instituto')}" />
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Institutos</g:link></li>
				
			</ul>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="show-instituto" class="content scaffold-show" role="main">
						<h1>
							Muestra Institutos
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


			<ul class="property-list instituto">

				<g:if test="${institutoInstance?.razonSocial}">
					<li class="fieldcontain"><span id="razonSocial-label"
						class="property-label"><g:message
								code="instituto.razonSocial.label" default="Razon Social" /></span> <span
						class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue
								bean="${institutoInstance}" field="razonSocial" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.siglas}">
					<li class="fieldcontain"><span id="siglas-label"
						class="property-label"><g:message
								code="instituto.siglas.label" default="Siglas" /></span> <span
						class="property-value" aria-labelledby="siglas-label"><g:fieldValue
								bean="${institutoInstance}" field="siglas" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.rfc}">
					<li class="fieldcontain"><span id="rfc-label"
						class="property-label"><g:message
								code="instituto.rfc.label" default="Rfc" /></span> <span
						class="property-value" aria-labelledby="rfc-label"><g:fieldValue
								bean="${institutoInstance}" field="rfc" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.correo}">
					<li class="fieldcontain"><span id="correo-label"
						class="property-label"><g:message
								code="instituto.correo.label" default="Correo" /></span> <span
						class="property-value" aria-labelledby="correo-label"><g:fieldValue
								bean="${institutoInstance}" field="correo" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.numeroEscritura}">
					<li class="fieldcontain"><span id="numeroEscritura-label"
						class="property-label"><g:message
								code="instituto.numeroEscritura.label"
								default="Numero Escritura" /></span> <span class="property-value"
						aria-labelledby="numeroEscritura-label"><g:fieldValue
								bean="${institutoInstance}" field="numeroEscritura" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.aniosExperiencia}">
					<li class="fieldcontain"><span id="aniosExperiencia-label"
						class="property-label"><g:message
								code="instituto.aniosExperiencia.label"
								default="Anios Experiencia" /></span> <span class="property-value"
						aria-labelledby="aniosExperiencia-label"><g:fieldValue
								bean="${institutoInstance}" field="aniosExperiencia" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.urlSitioWeb}">
					<li class="fieldcontain"><span id="urlSitioWeb-label"
						class="property-label"><g:message
								code="instituto.urlSitioWeb.label" default="Url Sitio Web" /></span> <span
						class="property-value" aria-labelledby="urlSitioWeb-label"><g:fieldValue
								bean="${institutoInstance}" field="urlSitioWeb" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.aplicaCobroIva}">
					<li class="fieldcontain"><span id="aplicaCobroIva-label"
						class="property-label"><g:message
								code="instituto.aplicaCobroIva.label" default="Aplica Cobro Iva" /></span>

						<span class="property-value"
						aria-labelledby="aplicaCobroIva-label"><g:formatBoolean
								boolean="${institutoInstance?.aplicaCobroIva}" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.repLegalNombre}">
					<li class="fieldcontain"><span id="repLegalNombre-label"
						class="property-label"><g:message
								code="instituto.repLegalNombre.label" default="Rep Legal Nombre" /></span>

						<span class="property-value"
						aria-labelledby="repLegalNombre-label"><g:fieldValue
								bean="${institutoInstance}" field="repLegalNombre" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.repLegalPrimerApellido}">
					<li class="fieldcontain"><span
						id="repLegalPrimerApellido-label" class="property-label"><g:message
								code="instituto.repLegalPrimerApellido.label"
								default="Rep Legal Primer Apellido" /></span> <span
						class="property-value"
						aria-labelledby="repLegalPrimerApellido-label"><g:fieldValue
								bean="${institutoInstance}" field="repLegalPrimerApellido" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.repLegalSegundoApellido}">
					<li class="fieldcontain"><span
						id="repLegalSegundoApellido-label" class="property-label"><g:message
								code="instituto.repLegalSegundoApellido.label"
								default="Rep Legal Segundo Apellido" /></span> <span
						class="property-value"
						aria-labelledby="repLegalSegundoApellido-label"><g:fieldValue
								bean="${institutoInstance}" field="repLegalSegundoApellido" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioOficialIdSepomex}">
					<li class="fieldcontain"><span
						id="domicilioOficialIdSepomex-label" class="property-label"><g:message
								code="instituto.domicilioOficialIdSepomex.label"
								default="Domicilio Oficial Id Sepomex" /></span> <span
						class="property-value"
						aria-labelledby="domicilioOficialIdSepomex-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioOficialIdSepomex" /></span>

					</li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioOficialCalle}">
					<li class="fieldcontain"><span
						id="domicilioOficialCalle-label" class="property-label"><g:message
								code="instituto.domicilioOficialCalle.label"
								default="Domicilio Oficial Calle" /></span> <span
						class="property-value"
						aria-labelledby="domicilioOficialCalle-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioOficialCalle" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioOficialNumext}">
					<li class="fieldcontain"><span
						id="domicilioOficialNumext-label" class="property-label"><g:message
								code="instituto.domicilioOficialNumext.label"
								default="Domicilio Oficial Numext" /></span> <span
						class="property-value"
						aria-labelledby="domicilioOficialNumext-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioOficialNumext" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioFiscalIdSepomex}">
					<li class="fieldcontain"><span
						id="domicilioFiscalIdSepomex-label" class="property-label"><g:message
								code="instituto.domicilioFiscalIdSepomex.label"
								default="Domicilio Fiscal Id Sepomex" /></span> <span
						class="property-value"
						aria-labelledby="domicilioFiscalIdSepomex-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioFiscalIdSepomex" /></span>

					</li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioFiscalCalle}">
					<li class="fieldcontain"><span id="domicilioFiscalCalle-label"
						class="property-label"><g:message
								code="instituto.domicilioFiscalCalle.label"
								default="Domicilio Fiscal Calle" /></span> <span
						class="property-value"
						aria-labelledby="domicilioFiscalCalle-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioFiscalCalle" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.domicilioFiscalNumext}">
					<li class="fieldcontain"><span
						id="domicilioFiscalNumext-label" class="property-label"><g:message
								code="instituto.domicilioFiscalNumext.label"
								default="Domicilio Fiscal Numext" /></span> <span
						class="property-value"
						aria-labelledby="domicilioFiscalNumext-label"><g:fieldValue
								bean="${institutoInstance}" field="domicilioFiscalNumext" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.statusAutorizacion}">
					<li class="fieldcontain"><span id="statusAutorizacion-label"
						class="property-label"><g:message
								code="instituto.statusAutorizacion.label"
								default="Status Autorizacion" /></span> <span class="property-value"
						aria-labelledby="statusAutorizacion-label"><g:fieldValue
								bean="${institutoInstance}" field="statusAutorizacion" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.fechaAlta}">
					<li class="fieldcontain"><span id="fechaAlta-label"
						class="property-label"><g:message
								code="instituto.fechaAlta.label" default="Fecha Alta" /></span> <span
						class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate
								date="${institutoInstance?.fechaAlta}" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.fechaFinVigencia}">
					<li class="fieldcontain"><span id="fechaFinVigencia-label"
						class="property-label"><g:message
								code="instituto.fechaFinVigencia.label"
								default="Fecha Fin Vigencia" /></span> <span class="property-value"
						aria-labelledby="fechaFinVigencia-label"><g:formatDate
								date="${institutoInstance?.fechaFinVigencia}" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.fechaCreacion}">
					<li class="fieldcontain"><span id="fechaCreacion-label"
						class="property-label"><g:message
								code="instituto.fechaCreacion.label" default="Fecha Creacion" /></span>

						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate
								date="${institutoInstance?.fechaCreacion}" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.fechaModificacion}">
					<li class="fieldcontain"><span id="fechaModificacion-label"
						class="property-label"><g:message
								code="instituto.fechaModificacion.label"
								default="Fecha Modificacion" /></span> <span class="property-value"
						aria-labelledby="fechaModificacion-label"><g:formatDate
								date="${institutoInstance?.fechaModificacion}" /></span></li>
				</g:if>

				<g:if test="${institutoInstance?.cambiosAutorizacion}">
					<li class="fieldcontain"><span id="cambiosAutorizacion-label"
						class="property-label"><g:message
								code="instituto.cambiosAutorizacion.label"
								default="Cambios Autorizacion" /></span> <g:each
							in="${institutoInstance.cambiosAutorizacion}" var="c">
							<span class="property-value"
								aria-labelledby="cambiosAutorizacion-label"><g:link
									controller="cambioAutorizacion" action="show" id="${c.id}">
									${c?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${institutoInstance?.cursos}">
					<li class="fieldcontain"><span id="cursos-label"
						class="property-label"><g:message
								code="instituto.cursos.label" default="Cursos" /></span> <g:each
							in="${institutoInstance.cursos}" var="c">
							<span class="property-value" aria-labelledby="cursos-label"><g:link
									controller="cursos" action="show" id="${c.id}">
									${c?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${institutoInstance?.telefonos}">
					<li class="fieldcontain"><span id="telefonos-label"
						class="property-label"><g:message
								code="instituto.telefonos.label" default="Telefonos" /></span> <g:each
							in="${institutoInstance.telefonos}" var="t">
							<span class="property-value" aria-labelledby="telefonos-label"><g:link
									controller="telefonoInstituto" action="show" id="${t.id}">
									${t?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${institutoInstance?.tipoInstituto}">
					<li class="fieldcontain"><span id="tipoInstituto-label"
						class="property-label"><g:message
								code="instituto.tipoInstituto.label" default="Tipo Instituto" /></span>

						<span class="property-value" aria-labelledby="tipoInstituto-label"><g:link
								controller="tipoInstituto" action="show"
								id="${institutoInstance?.tipoInstituto?.id}">
								${institutoInstance?.tipoInstituto?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ul>
			<g:form url="[resource:institutoInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary colortitle colorblack"
						action="edit" resource="${institutoInstance}">
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
				<br>
			</g:form>
		</div>
	</fieldset>
</body>
</html>
