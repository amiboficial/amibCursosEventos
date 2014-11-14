<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.Instituto" %>

<div class="form-inline" role="form">

<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'razonSocial', 'error')} ">
	<label for="razonSocial" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.razonSocial.label" default="Razon Social" />
		
	</label>
	<g:textField name="razonSocial" cols="40" rows="5" maxlength="254" value="${institutoInstance?.razonSocial}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'siglas', 'error')} ">
	<label for="siglas" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.siglas.label" default="Siglas" />
		
	</label>
	<g:textField name="siglas" maxlength="4" value="${institutoInstance?.siglas}" class ="form-control"/><!-- revisar maxlenght -->

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'rfc', 'error')} ">
	<label for="rfc" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" maxlength="13" value="${institutoInstance?.rfc}" class ="form-control"/><!-- revisar maxlenght -->

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'correo', 'error')} ">
	<label for="correo" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.correo.label" default="Correo" />
		
	</label>
	<g:textField name="correo" cols="40" rows="5" maxlength="254" value="${institutoInstance?.correo}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'numeroEscritura', 'error')} ">
	<label for="numeroEscritura" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.numeroEscritura.label" default="Numero Escritura" />
		
	</label>
	<g:field name="numeroEscritura" type="number" value="${institutoInstance.numeroEscritura}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'aniosExperiencia', 'error')} ">
	<label for="aniosExperiencia" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.aniosExperiencia.label" default="Anios Experiencia" />
		
	</label>
	<g:field name="aniosExperiencia" type="number" value="${institutoInstance.aniosExperiencia}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'urlSitioWeb', 'error')} ">
	<label for="urlSitioWeb" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.urlSitioWeb.label" default="Url Sitio Web" />
		
	</label>
	<g:textField name="urlSitioWeb" cols="40" rows="5" maxlength="1000" value="${institutoInstance?.urlSitioWeb}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'aplicaCobroIva', 'error')} ">
	<label for="aplicaCobroIva" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.aplicaCobroIva.label" default="Aplica Cobro Iva" />
		
	</label>
	<g:checkBox name="aplicaCobroIva" value="${institutoInstance?.aplicaCobroIva}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalNombre', 'error')} ">
	<label for="repLegalNombre" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.repLegalNombre.label" default="Rep Legal Nombre" />
		
	</label>
	<g:textField name="repLegalNombre" value="${institutoInstance?.repLegalNombre}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalPrimerApellido', 'error')} ">
	<label for="repLegalPrimerApellido" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.repLegalPrimerApellido.label" default="Rep Legal Primer Apellido" />
		
	</label>
	<g:textField name="repLegalPrimerApellido" value="${institutoInstance?.repLegalPrimerApellido}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'repLegalSegundoApellido', 'error')} ">
	<label for="repLegalSegundoApellido" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.repLegalSegundoApellido.label" default="Rep Legal Segundo Apellido" />
		
	</label>
	<g:textField name="repLegalSegundoApellido" value="${institutoInstance?.repLegalSegundoApellido}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain">
	<label for="Domicilio oficial">
		<g:message code="instituto.DomOficial" default="Domicilio oficial de la institutcion" />
</label>
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.cp" default="Codigo Postal" />
	</label>
	<input type="text" id="txtCP" style="float: left;" class ="form-control"></input><button onclick="return window.open('http://www.correosdemexico.gob.mx/ServiciosLinea/Paginas/ccpostales.aspx');" id="btnIconoBuscarCP" style="font-size:small;">&nbsp;Buscar ...</button>
		<g:hasErrors bean="${institutoInstance}" field="sepomex">
			<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
		</g:hasErrors>&nbsp;
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.ed" default="Entidad Federativa" />
	</label>
	<input type="text" id="txtEntidad" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.dm" default="Delegación ó Municipio" />
	</label>
	<input type="text" id="txtDelegacion" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain" >	
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.cd" default="Ciudad" />
	</label>
	<input type="text" id="txtCiudad" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, select: 'domicilioOficialIdSepomex', 'error')}" >
	<label for="codigoPostal" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.as" default="Asentamiento" />
	</label>
	<select id="selAsentamiento" name="domicilioOficialIdSepomex" style="float: left;" required>
		<option value=" ">-Seleccione-</option>
	</select>
	<g:hasErrors bean="${institutoInstance.domicilioOficialIdSepomex}" field="domicilioOficialIdSepomex">
		<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
	</g:hasErrors>
</div>
<br>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialIdSepomex', 'error')} ">
	<label for="domicilioOficialIdSepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioOficialIdSepomex.label" default="Domicilio Oficial Id Sepomex" />
		
	</label>
	<g:field name="domicilioOficialIdSepomex" type="number" value="${institutoInstance.domicilioOficialIdSepomex}" class ="form-control"/>

</div>  -->
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialCalle', 'error')} ">
	<label for="domicilioOficialCalle" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioOficialCalle.label" default="Domicilio Oficial Calle" />
		
	</label>
	<g:textField name="domicilioOficialCalle" cols="40" rows="5" maxlength="254" value="${institutoInstance?.domicilioOficialCalle}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioOficialNumext', 'error')} ">
	<label for="domicilioOficialNumext" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioOficialNumext.label" default="Domicilio Oficial Numext" />
		
	</label>
	<g:textField name="domicilioOficialNumext" maxlength="36" value="${institutoInstance?.domicilioOficialNumext}" class ="form-control"/>

</div>
<br>


<div class="fieldcontain">
	<label for="Domicilio fiscal">
		<g:message code="instituto.DomOficial" default="Domicilio fiscal de la institutcion" />
</label>
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostalF" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.cpf" default="Codigo Postal" />
	</label>
	<input type="text" id="txtCPF" style="float: left;" class ="form-control"></input><button onclick="return window.open('http://www.correosdemexico.gob.mx/ServiciosLinea/Paginas/ccpostales.aspx');" id="btnIconoBuscarCP" style="font-size:small;">&nbsp;Buscar ...</button>
		<g:hasErrors bean="${institutoInstance}" field="sepomex">
			<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
		</g:hasErrors>&nbsp;
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostalF" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.edf" default="Entidad Federativa" />
	</label>
	<input type="text" id="txtEntidadF" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain">
	<label for="codigoPostalF" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.dmf" default="Delegación ó Municipio" />
	</label>
	<input type="text" id="txtDelegacionF" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain" >	
	<label for="codigoPostalF" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.cdf" default="Ciudad" />
	</label>
	<input type="text" id="txtCiudadF" disabled="disabled" value="" class ="form-control"></input>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, select: 'domicilioFiscalIdSepomex', 'error')}" >
	<label for="codigoPostalF" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.asf" default="Asentamiento" />
	</label>
	<select id="selAsentamientoF" name="domicilioFiscalIdSepomex" style="float: left;" required>
		<option value=" ">-Seleccione-</option>
	</select>
	<g:hasErrors bean="${institutoInstance.domicilioFiscalIdSepomex}" field="domicilioFiscalIdSepomex">
		<span class="ui-icon-red ui-icon-circle-close" style="float: left; margin-top: .3em"></span>
	</g:hasErrors>
</div>
<br>
<br>
<!-- 
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalIdSepomex', 'error')} ">
	<label for="domicilioFiscalIdSepomex" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioFiscalIdSepomex.label" default="Domicilio Fiscal Id Sepomex" />
		
	</label>
	<g:field name="domicilioFiscalIdSepomex" type="number" value="${institutoInstance.domicilioFiscalIdSepomex}" class ="form-control"/>

</div>
<br> -->
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalCalle', 'error')} ">
	<label for="domicilioFiscalCalle" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioFiscalCalle.label" default="Domicilio Fiscal Calle" />
		
	</label>
	<g:textField name="domicilioFiscalCalle" cols="40" rows="5" maxlength="254" value="${institutoInstance?.domicilioFiscalCalle}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'domicilioFiscalNumext', 'error')} ">
	<label for="domicilioFiscalNumext" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.domicilioFiscalNumext.label" default="Domicilio Fiscal Numext" />
		
	</label>
	<g:textField name="domicilioFiscalNumext" maxlength="36" value="${institutoInstance?.domicilioFiscalNumext}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'statusAutorizacion', 'error')} ">
	<label for="statusAutorizacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.statusAutorizacion.label" default="Status Autorizacion" />
		
	</label>
	<g:textField name="statusAutorizacion" maxlength="1" value="${institutoInstance?.statusAutorizacion}" class ="form-control"/>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaAlta', 'error')} ">
	<label for="fechaAlta" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.fechaAlta.label" default="Fecha Alta" />
		
	</label>
	<g:datePicker name="fechaAlta" precision="day"  value="${institutoInstance?.fechaAlta}"  />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaFinVigencia', 'error')} ">
	<label for="fechaFinVigencia" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.fechaFinVigencia.label" default="Fecha Fin Vigencia" />
		
	</label>
	<g:datePicker name="fechaFinVigencia" precision="day"  value="${institutoInstance?.fechaFinVigencia}"  />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${institutoInstance?.fechaCreacion}"  />

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'fechaModificacion', 'error')} ">
	<label for="fechaModificacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.fechaModificacion.label" default="Fecha Modificacion" />
		
	</label>
	<g:datePicker name="fechaModificacion" precision="day"  value="${institutoInstance?.fechaModificacion}" />

</div>
<br>



<!--  
<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'telefono', 'error')} ">
	<label for="telefono" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="50" value="${telefonoInstitutoInstance?.telefono}" class ="form-control"/>

</div>
<br>

<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'fechaCreacion', 'error')} ">
	<label for="fechaCreacion" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.fechaCreacion.label" default="Fecha Creacion" />
		
	</label>
	<g:datePicker name="instituto.fechaCreacion" precision="day"  value="${telefonoInstitutoInstance?.fechaCreacion}"  />

</div>

<br>
<div class="fieldcontain ${hasErrors(bean: telefonoInstitutoInstance, field: 'tipotelefono', 'error')} required">
	<label for="tipotelefono" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="telefonoInstituto.tipotelefono.label" default="Tipotelefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipotelefono" name="instituto.tipotelefono.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono.list()}" optionKey="id" optionValue="descripcion" required="" value="${telefonoInstitutoInstance?.tipotelefono?.id}" class="many-to-one" class ="form-control"/>

</div>-->



<br>
<div class="fieldcontain ${hasErrors(bean: institutoInstance, field: 'tipoInstituto', 'error')} required">
	<label for="tipoInstituto" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="instituto.tipoInstituto.label" default="Tipo Instituto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoInstituto" name="tipoInstituto.id" from="${mx.amib.sistemas.cursoseventos.institutos.model.catalogo.TipoInstituto.list()}" optionKey="id" optionValue="descripcion" required="" value="${institutoInstance?.tipoInstituto?.id}" class="many-to-one" class ="form-control"/>

</div>
<br>
</div>

