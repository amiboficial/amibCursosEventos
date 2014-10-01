<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.Instituto" %>


<div class="form-inline" role="form">

		<div
			class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'razonSocial', 'error')} ">
			<label for="razonSocial" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.razonSocial.label" default="Razon Social" />

			</label>
			<g:textField name="razonSocial" cols="40" rows="5" maxlength="254"
				value="${institutoInstance?.razonSocial}" class ="form-control" />

		</div>
<br>
		<div
			class="  fieldcontain ${hasErrors(bean: institutoInstance, field: 'siglas', 'error')} ">
			<label for="siglas" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message code="instituto.siglas.label"
					default="Siglas" />

			</label>
			<g:textField name="siglas" maxlength="4"
				value="${institutoInstance?.siglas}" class ="form-control" />

		</div>

<br>
		<div
			class="  fieldcontain ${hasErrors(bean: institutoInstance, field: 'rfc', 'error')} ">
			<label for="rfc" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message code="instituto.rfc.label"
					default="R.F.C." />

			</label>
			<g:textField name="rfc" maxlength="13"
				value="${institutoInstance?.rfc}" class ="form-control"/>

		</div>
<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'correo', 'error')} ">
			<label for="correo" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.correo.label" default="Correo electronico" />

			</label>
			<g:textField name="correo" cols="40" rows="5" maxlength="254"
				value="${institutoInstance?.correo}" class ="form-control"/>

		</div>
<br>
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'numeroEscritura', 'error')} ">
			<label for="numeroEscritura" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.numeroEscritura.label"
					default="Numero Escritura" />

			</label>
			<g:field name="numeroEscritura" type="number"
				value="${institutoInstance.numeroEscritura}" class ="form-control" />
		</div>
<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'aniosExperiencia', 'error')} ">
			<label for="aniosExperiencia" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.aniosExperiencia.label"
					default="Experiencia en años" />

			</label>
			<g:field name="aniosExperiencia" type="number"
				value="${institutoInstance.aniosExperiencia}" class ="form-control"/>
		
		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'urlSitioWeb', 'error')} ">
			<label for="urlSitioWeb" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.urlSitioWeb.label"
					default="Direccion electronica" />

			</label>
			<g:textField name="urlSitioWeb" cols="40" rows="5" maxlength="1000"
				value="${institutoInstance?.urlSitioWeb}" class ="form-control"/>

		</div>

<br>
		
			<div
				class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'aplicaCobroIva', 'error')} " >
				<label for="aplicaCobroIva" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
					<g:message code="instituto.aplicaCobroIva.label"
						default="Aplica cobro de I.V.A." />

				</label>
				<g:checkBox name="aplicaCobroIva"
					value="${institutoInstance?.aplicaCobroIva}" class ="form-control"/>

			</div>
	
<br>	
	
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalNombre', 'error')} ">
			<label for="repLegalNombre" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.repLegalNombre.label"
					default="Nombre del representante legal" />

			</label>
			<g:field name="repLegalNombre" type="text"
				value="${institutoInstance.repLegalNombre}" class ="form-control"/>

		</div>


<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalPrimerApellido', 'error')} ">
			<label for="repLegalPrimerApellido" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.repLegalPrimerApellido.label"
					default="Apellido paterno del representante legal" />

			</label>
			<g:field name="repLegalPrimerApellido" type="text"
				value="${institutoInstance.repLegalPrimerApellido}" class ="form-control"/>

		</div>
<br>


		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalSegundoApellido', 'error')} ">
			<label for="repLegalSegundoApellido" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.repLegalSegundoApellido.label"
					default="Apellido materno del representanete legal" />

			</label>
			<g:field name="repLegalSegundoApellido" type="text"
				value="${institutoInstance.repLegalSegundoApellido}" class ="form-control"/>

		</div>

<br>
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialIdSepomex', 'error')} ">
			<label for="domicilioOficialIdSepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioOficialIdSepomex.label"
					default="Domicilio oficial del instituto" />

			</label>
			<g:field name="domicilioOficialIdSepomex" type="number"
				value="${institutoInstance.domicilioOficialIdSepomex}" class ="form-control"/>

		</div>

<br>
	
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialCalle', 'error')} ">
			<label for="domicilioOficialCalle" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioOficialCalle.label"
					default="Calle del domicilio oficial del instituto" class ="form-control"/>

			</label>
			<g:textField name="domicilioOficialCalle" cols="40" rows="5"
				maxlength="254" value="${institutoInstance?.domicilioOficialCalle}" class ="form-control"/>

		</div>

<br>
	
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialNumext', 'error')} ">
			<label for="domicilioOficialNumext" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioOficialNumext.label"
					default="Numero exteriro del domicilio oficial" class ="form-control"/>

			</label>
			<g:textField name="domicilioOficialNumext" maxlength="36"
				value="${institutoInstance?.domicilioOficialNumext}" class ="form-control"/>

		</div>
<br>	

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalIdSepomex', 'error')} ">
			<label for="domicilioFiscalIdSepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioFiscalIdSepomex.label"
					default="Domicilio fiscal del insitituto" />

			</label>
			<g:field name="domicilioFiscalIdSepomex" type="number"
				value="${institutoInstance.domicilioFiscalIdSepomex}" class ="form-control"/>

		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalCalle', 'error')} ">
			<label for="domicilioFiscalCalle" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioFiscalCalle.label"
					default="Calle del domicilio fiscal del insitituto" />

			</label>
			<g:textField name="domicilioFiscalCalle" cols="40" rows="5"
				maxlength="254" value="${institutoInstance?.domicilioFiscalCalle}" class ="form-control"/>

		</div>

<br>
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalNumext', 'error')} ">
			<label for="domicilioFiscalNumext" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.domicilioFiscalNumext.label"
					default="Numero exterior del domicilio fiscal" />

			</label>
			<g:textField name="domicilioFiscalNumext" maxlength="36"
				value="${institutoInstance?.domicilioFiscalNumext}" class ="form-control"/>

		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'statusAutorizacion', 'error')} ">
			<label for="statusAutorizacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.statusAutorizacion.label"
					default="Estatus de la autorización" class ="form-control"/>

			</label>
			<g:textField name="statusAutorizacion" maxlength="1"
				value="${institutoInstance?.statusAutorizacion}" class ="form-control"/>

		</div>

<br>
	
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaAlta', 'error')} ">
			<label for="fechaAlta" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.fechaAlta.label" default="Fecha de alta" />

			</label>
			<g:datePicker name="fechaAlta" precision="day"
				value="${institutoInstance?.fechaAlta}" default="none"
				noSelection="['': '']" />

		</div>

<br>
	
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaFinVigencia', 'error')} ">
			<label for="fechaFinVigencia" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.fechaFinVigencia.label"
					default="Fecha de termino de vigencia" />

			</label>
			<g:datePicker name="fechaFinVigencia" precision="day"
				value="${institutoInstance?.fechaFinVigencia}" default="none"
				noSelection="['': '']" />

		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaCreacion', 'error')} ">
			<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.fechaCreacion.label" default="Fecha de creacion" />

			</label>
			<g:datePicker name="fechaCreacion" precision="day"
				value="${institutoInstance?.fechaCreacion}" default="none"
				noSelection="['': '']" />

		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaModificacion', 'error')} ">
			<label for="fechaModificacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.fechaModificacion.label"
					default="Fecha de modificacion" />

			</label>
			<g:datePicker name="fechaModificacion" precision="day"
				value="${institutoInstance?.fechaModificacion}" default="none"
				noSelection="['': '']" />

		</div>
<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'cambiosAutorizacion', 'error')} ">
			<label for="cambiosAutorizacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
				<g:message code="instituto.cambiosAutorizacion.label"
					default="Cambios de autorizacion" />

			</label>

			<ul class="one-to-many">
				<g:each in="${institutoInstance?.cambiosAutorizacion?}" var="c">
					<li><g:link controller="cambioAutorizacion" action="show"
							id="${c.id}">
							${c?.encodeAsHTML()}
						</g:link></li>
				</g:each>
				<li class="add"><g:link controller="cambioAutorizacion"
						action="create" params="['instituto.id': institutoInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'cambioAutorizacion.label', default: 'CambioAutorizacion')])}
					</g:link></li>
			</ul>


		</div>

<br>
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'curso', 'error')} required">
			<label for="curso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.curso.label" default="Curso" /> <span
				class="required-indicator">*</span>
			</label>
			<g:select id="curso" name="curso.id"
				from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}"
				optionKey="id" required="" value="${institutoInstance?.curso?.id}"
				class="many-to-one" />

		</div>

<br>

		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'cursos', 'error')} ">
			<label for="cursos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.cursos.label" default="Cursos" />

			</label>
			<g:select name="cursos"
				from="${mx.amib.sistemas.cursoseventos.cursos.model.Cursos.list()}"
				multiple="multiple" optionKey="id" size="5"
				value="${institutoInstance?.cursos*.id}" class="many-to-many" />

		</div>
<br>
		<div
			class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'telefonos', 'error')} ">
			<label for="telefonos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label"> <g:message
					code="instituto.telefonos.label" default="Telefonos" />

			</label>

			<ul class="one-to-many">
				<g:each in="${institutoInstance?.telefonos?}" var="t">
					<li><g:link controller="telefonoInstituto" action="show"
							id="${t.id}">
							${t?.encodeAsHTML()}
						</g:link></li>
				</g:each>
				<li class="add"><g:link controller="telefonoInstituto"
						action="create" params="['instituto.id': institutoInstance?.id]">
						${message(code: 'default.add.label', args: [message(code: 'telefonoInstituto.label', default: 'TelefonoInstituto')])}
					</g:link></li>
			</ul>


		</div>

<br>

<div class=" fieldcontain ${hasErrors(bean: institutoInstance, field: 'tipoInstituto', 'error')} required">
	<label for="tipoInstituto" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.tipoInstituto.label" default="Tipo Instituto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoInstituto" name="tipoInstituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.catalogo.TipoInstituto.list()}" optionKey="id" required="" value="${institutoInstance?.tipoInstituto?.id}" class="many-to-one"/>

</div>

</div>
