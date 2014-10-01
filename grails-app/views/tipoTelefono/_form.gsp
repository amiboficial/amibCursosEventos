<%@ page
	import="mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono"%>

<div class="form-inline" role="form">

	<div
		class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'vigente', 'error')} ">
		<label for="vigente"
			class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
				code="tipoTelefono.vigente.label" default="Vigente" />

		</label>
		<g:checkBox name="vigente" value="${tipoTelefonoInstance?.vigente}"
			class="form-control" />

	</div>

	<div
		class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'descripcion', 'error')} ">
		<label for="descripcion"
			class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
				code="tipoTelefono.descripcion.label" default="Descripcion" />

		</label>
		<g:textField name="descripcion" maxlength="100"
			value="${tipoTelefonoInstance?.descripcion}" class="form-control" />

	</div>

	<div
		class="fieldcontain ${hasErrors(bean: tipoTelefonoInstance, field: 'telefonos', 'error')} ">
		<label for="telefonos"
			class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
				code="tipoTelefono.telefonos.label" default="Telefonos" />

		</label>

		<ul class="one-to-many">
			<g:each in="${tipoTelefonoInstance?.telefonos?}" var="t">
				<li><g:link controller="telefonoInstituto" action="show"
						id="${t.id}">
						${t?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="telefonoInstituto"
					action="create"
					params="['tipoTelefono.id': tipoTelefonoInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto')])}
				</g:link></li>
		</ul>


	</div>
</div>

