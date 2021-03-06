<%@ page import="mx.amib.sistemas.cursoseventos.cursos.model.Cursos" %>

<div class="form-inline" role="form">
	<table class="table">

		<thead>
			<tr>
				<h4>Datos del curso</h4>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'nombreDelCurso', 'error')}  ">
						<label for="nombreDelCurso"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.nombreDelCurso.label"
								default="Nombre Del Curso" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'siglas', 'error')} ">
						<label for="siglas"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.siglas.label" default="Siglas" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'objetivoDelCurso', 'error')} ">
						<label for="objetivoDelCurso"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.objetivoDelCurso.label"
								default="Objetivo Del Curso" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'duracionEnHoras', 'error')} ">
						<label for="duracionEnHoras"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.duracionEnHoras.label"
								default="Duracion En Horas" />
						</label>
				</th>
			</tr>
		</thead>
		<tbody id="tb">
			<tr>
				<td><g:textField name="nombreDelCurso" cols="40" rows="5"
						maxlength="254" value="${cursosInstance?.nombreDelCurso}"
						class="form-control" /></td>
				<td><g:textField name="siglas" maxlength="4"
						value="${cursosInstance?.siglas}" class="form-control" /></td>
				<td><g:textField name="objetivoDelCurso" cols="100" rows="5"
						maxlength="254" value="${cursosInstance?.objetivoDelCurso}"
						class="form-control" /></td>
				<td><g:field name="duracionEnHoras" type="number"
						value="${cursosInstance.duracionEnHoras}" class="form-control" />
				</td>
			</tr>
		</tbody>
	</table>

	
	<table class="table">

		<thead>
			<tr>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'fechaCreacion', 'error')} ">
						<label for="fechaCreacion"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.fechaCreacion.label"
								default="Fecha Creacion" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'fechaModificacion', 'error')} ">
						<label for="fechaModificacion"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.fechaModificacion.label"
								default="Fecha Modificacion" />
						</label>
					</div>
				</th>
				<th>
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'tipoCurso', 'error')} required">
						<label for="tipoCurso"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="curso.tipoCurso.label" default="Tipo Curso" />
							<span class="required-indicator">*</span>
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'instituto', 'error')} ">
						<label for="Instituto"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.institutos.label" default="Instituto" />
						</label>
					</div>
				</th>
			</tr>
		</thead>
		<tbody id="tb">
			<tr>
				<td><g:datePicker name="fechaCreacion" precision="day"
						value="${cursosInstance?.fechaCreacion}" /></td>
				<td><g:datePicker name="fechaModificacion" precision="day"
						value="${cursosInstance?.fechaModificacion}" /></td>
				<td><g:select id="tipoCurso" name="tipoCurso.id"
						from="${mx.amib.sistemas.cursoseventos.cursos.model.catalogo.TipoCurso.list()}"
						optionKey="id" optionValue="descripcion" required=""
						value="${cursosInstance?.tipoCurso?.id}" class="many-to-one"
						class="form-control" /></td>
				<td>
					<!-- <g:link controller="instituto" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'instituto.label', default: 'Instituto')])}</g:link> -->
					<g:select id="instituto" name="instituto.id"
						from="${mx.amib.sistemas.cursoseventos.institutos.model.Instituto.list()}"
						optionKey="id" optionValue="razonSocial" required=""
						value="${cursosInstance?.instituto?.id}" class="many-to-one"
						class="form-control" />
				</td>
			</tr>
		</tbody>
	</table>
	

	<table class="table">

		<thead>
			<tr>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'observaciones', 'error')} ">
						<label for="observaciones"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.observaciones.label"
								default="Observaciones" />
						</label>
					</div>
				</th>
			</tr>
		</thead>
		
	<tbody id="tb">
			<tr>
				<td><g:textField name="observaciones" cols="40" rows="5"
						maxlength="254" value="${cursosInstance?.observaciones}"
						class="form-control" /></td>
			</tr>
	</tbody>
</table>
	

	<table class="table">

		<thead>
			<tr>
			<h4>Datos del Coordinador</h4>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'nombreCoordinador', 'error')} ">
						<label for="nombreCoordinador"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.nombreCoordinador.label"
								default="Nombre" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'primerApellidoCoordinador', 'error')} ">
						<label for="primerApellidoCoordinador"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.primerApellidoCoordinador.label"
								default="Apellido Paterno" />
						</label>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'segundoApellidoCordinador', 'error')} ">
						<label for="segundoApellidoCordinador"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.segundoApellidoCordinador.label"
								default="Apellido Materno" />
						</label>
					</div>
				</th>
			</tr>
		</thead>
		<tbody id="tb">
			<tr>
				<td><g:textField name="nombreCoordinador" cols="40" rows="5"
						maxlength="254" value="${cursosInstance?.nombreCoordinador}"
						class="form-control" /></td>
				<td><g:textField name="primerApellidoCoordinador"
						maxlength="254"
						value="${cursosInstance?.primerApellidoCoordinador}"
						class="form-control" /></td>
				<td><g:textField name="segundoApellidoCordinador" cols="40"
						rows="5" maxlength="254"
						value="${cursosInstance?.segundoApellidoCordinador}"
						class="form-control" /></td>
			</tr>
		</tbody>
	</table>

	<table class="table">

		<thead>
			<tr>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'telefonoFijoCoordinador', 'error')} ">
						<label for="telefonoFijoCoordinador"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.telefonoFijoCoordinador.label"
								default="Telefono" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'faxCoordinador', 'error')} ">
						<label for="faxCoordinador"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.faxCoordinador.label"
								default="Fax" />
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'email', 'error')} required">
						<label for="email"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.email.label" default="Email" /> <span
							class="required-indicator">*</span>
						</label>
					</div>
				</th>
				<th>
					<div
						class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'status', 'error')} ">
						<label for="status"
							class="col-lg-8 col-sm-6 col-md-6 col-xs-6 control-label">
							<g:message code="cursos.status.label" default="Status" />
						</label>
					</div>
				</th>
			</tr>
		</thead>
		<tbody id="tb">
			<tr>
				<td><g:textField name="telefonoFijoCoordinador" cols="40"
						rows="5" maxlength="254"
						value="${cursosInstance?.telefonoFijoCoordinador}"
						class="form-control" /></td>
				<td><g:textField name="faxCoordinador" cols="40" rows="5"
						maxlength="254" value="${cursosInstance?.faxCoordinador}"
						class="form-control" /></td>
				<td><g:field type="email" name="email" required=""
						value="${cursosInstance?.email}" class="form-control" /></td>
				<td><g:textField name="status"
						value="${cursosInstance?.status}" class="form-control" /></td>
			</tr>
		</tbody>
	</table>
	
	
	
	<fieldset>
		<legend>Documentos del curso</legend>

		<%--<div id="divDocsCompletos" class="alert alert-danger">
					<span class="glyphicon glyphicon-ban-circle"></span> Debes incluir un documento de respaldo
				</div> --%>

		<div id="divMultiplesDocumentos">

			<div class="msgProcesando alert alert-info">
				<asset:image src="spinner_alert_info.gif" />
				<strong>Procesando datos, espere un momento</strong>.
			</div>
			<div class="msgErrorPeticion alert alert-danger">
				<span class="glyphicon glyphicon-ban-circle"></span> Ha habído un
				error al procesar la petición.
			</div>
			<div class="msgErrorTipoNoSel alert alert-danger">
				<span class="glyphicon glyphicon-ban-circle"></span> Debes
				seleccionar el tipo de documento a cargar.
			</div>
			<div class="msgErrorTipoNoArc alert alert-danger">
				<span class="glyphicon glyphicon-ban-circle"></span> Debes
				seleccionar un archivo a cargar.
			</div>
			<div class="msgErrorValidadorExt alert alert-danger"></div>

			<div class="newFileRow row">
				<div class="archivoInputDiv col-md-5">
					<label class="control-label col-md-4">Seleccione un
						archivo:</label>
					<div class="col-md-8">
						<input type="file" class="file" id="ZmlsZURvY3VtZW50bw" />
					</div>
				</div>
				<div class="tipoDiv col-md-4">
					<label class="control-label col-md-4">Tipo:</label>
					<div class="col-md-8">
						<select class="tipoDocumento form-control col-md-8">
							<option value="null">-Seleccione-</option>
							<g:each in="${viewModelInstance.tipoDocumentoList}">
										validador.addDocType(${it.id});
										<option value="${it.id}">
									${it.tipoDoumentoCurso}
								</option>
							</g:each>
						</select>
					</div>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<button type="button" class="add btn btn-sm btn-success">
						<span class="glyphicon glyphicon-plus-sign"></span> Agregar
					</button>
				</div>
			</div>
			<br />

			<div class="listaDocs list-group"></div>

		</div>
		<input type="hidden" id="hdnDocsDeleted" name="idsDocumentosBorrados"
			value="" /> <input type="hidden" id="hdnDocsIsBusy" value="false" />

		<g:if test="${viewModelInstance.validDocumentosCargados == true}">
			<input type="hidden" id="hdnDocsModelValidatedLoaded" value="true" />
		</g:if>
		<g:else>
			<input type="hidden" id="hdnDocsModelValidatedLoaded" value="false" />
		</g:else>


		<input type="hidden" id="hdnDocsModelValidated" value="false" /> <input
			type="hidden" id="hdnDocsModelValidatedMsg" value="" />
	</fieldset>


	<!-- 
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'cambioStatus', 'error')} ">
	<label for="cambioStatus" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.cambioStatus.label" default="Cambio Status" />
	</label>
<ul class="one-to-many">
<g:each in="${cursosInstance?.cambioStatus?}" var="c">
    <li><g:link controller="cambioStatus" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cambioStatus" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cambioStatus.label', default: 'CambioStatus')])}</g:link>
</li>
</ul>
</div>
 -->
	<!--  
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'documentoCurso', 'error')} ">
	<label for="documentoCurso" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.documentoCurso.label" default="Documento Curso" />
		
	</label>
<ul class="one-to-many">
<g:each in="${cursosInstance?.documentoCurso?}" var="d">
    <li><g:link controller="documentoCursos" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoCursos" action="create" params="['cursos.id': cursosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoCursos.label', default: 'DocumentoCursos')])}</g:link>
</li>
</ul>
</div>-->
<!-- 
<div class="fieldcontain ${hasErrors(bean: cursosInstance, field: 'eventos', 'error')} ">
	<label for="eventos" class="col-lg-4 col-sm-6 col-md-6 col-xs-6 control-label">
		<g:message code="cursos.eventos.label" default="Eventos" />
	</label>
	<g:select name="eventos" from="${mx.amib.sistemas.cursoseventos.eventos.model.Evento.list()}" multiple="multiple" optionKey="id" size="5" value="${cursosInstance?.eventos*.id}" class="many-to-many"/>
</div>
<br>
 -->
</div>
