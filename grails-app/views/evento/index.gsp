
<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
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
				<li><g:link class="create btn btn-default btn-primary" action="create">Crear evento</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel-heading">
			<div class="widgetTitle">
				<div id="list-evento" class="content scaffold-list" role="main">
					<h1>
					Gestión de Eventos
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
                	<h3 class="panel-title">Lista de eventos</h3>
				</div>
	<table class="table table-bordered table-striped table-hover"
			style="width: 100%; margin: auto;" border="0" id="tblFormat">
			<thead>
					<tr>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'evento.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="fechaTermino" title="${message(code: 'evento.fechaTermino.label', default: 'Fecha Termino')}" />
					
						<g:sortableColumn property="nombreCordinador" title="${message(code: 'evento.nombreCordinador.label', default: 'Nombre Cordinador')}" />
					
						<g:sortableColumn property="primerApellidoCoordinador" title="${message(code: 'evento.primerApellidoCoordinador.label', default: 'Primer Apellido Coordinador')}" />
					
						<g:sortableColumn property="segundoApellidoCoordinador" title="${message(code: 'evento.segundoApellidoCoordinador.label', default: 'Segundo Apellido Coordinador')}" />
					
						<g:sortableColumn property="telefonoFijoCoordinador" title="${message(code: 'evento.telefonoFijoCoordinador.label', default: 'Telefono Fijo Coordinador')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "fechaInicio")}</g:link></td>
					
						<td><g:formatDate date="${eventoInstance.fechaTermino}" /></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "nombreCordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "primerApellidoCoordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "segundoApellidoCoordinador")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "telefonoFijoCoordinador")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			<div id="divPorAutorizados">
			
				<div id="divAMatricula" class="form-group">
					<label class="col-md-2 col-sm-3 control-label">
						<g:message code="evento.participantes.matricula.label" default="Matricula" />
					</label>
					<div class="col-md-9 col-sm-9">
						<div class="input-group">
							<span class="input-group-addon">
								<input type="radio" id="rbtAOpMat" name="fltAOp" value="MAT" checked>
							</span>
							<g:textField name="fltAMat" id="txtMatricula" class="form-control" value=""/>
						</div>
					</div>
				</div>
				<div id="divANombre" class="form-group">
					<label class="col-md-2 col-sm-3 control-label">
						<g:message code="evento.participantes.nombreParticipante.label" default="Nombre" />
					</label>
					<div class="col-md-9 col-sm-9">
						<div class="input-group">
							<span class="input-group-addon">
								<input type="radio" id="rbtAOpNom" name="fltAOp" value="NOM">
							</span>
							<g:textField name="fltANom" id="txtNombre" class="form-control" value=""/>
						</div>
					</div>
				</div>
			
			</fieldset>
			<div class="pagination">
				<g:paginate total="${eventoInstanceCount ?: 0}" />
			</div>

<!-- INICIA: SCRIPT PARA FUNCIONAMIENTO DE VISTA -->
	<script>
	//callbacks para botones en lista
	function btnVer_click(id){
		window.location.href = '<g:createLink controller="evento" action="show" />/'+id;
	}
	function btnEditar_click(id){
		window.location.href = '<g:createLink controller="evento" action="edit" />/'+id;
	}
	function btnEliminar_click(id){
		var url = '<g:createLink controller="evento" action="delete" />/'+id
		var r = confirm("¿Desea eliminar el elemento seleccionado?");
		if(r == true)
			window.location.href = url;
	}
	//callbacks para barra de acciones
	$( "#btnNuevo" ).click(function() {
		window.location.href = '<g:createLink controller="evento" action="create" />'
	});
	//callbacks para cambiar los radiobutton cada que se focusea el input correspondiente
	$( "#txtMatricula" ).focus(function() {
		document.getElementById('rbtAOpMat').checked = true;
	});	
	$( "#txtNombre" ).focus(function() {
		document.getElementById('rbtAOpNom').checked = true;
	});	
	//callbacks para botones de opciones de búsqueda
	$( "#btnPorDatosOficio" ).click(function() {
		$("#divPorDatosOficio").show();
		$("#divPorAutorizados").hide();

		//limpia validaciones
		limpiaValidacionDO();
		limpiaValidacionA();
		limpiarCamposDO();
		limpiarCamposA();
	});
	$( "#btnPorAutorizados" ).click(function() {
		$("#divPorDatosOficio").hide();
		$("#divPorAutorizados").show();

		//limpia validaciones
		limpiaValidacionDO();
		limpiaValidacionA();
		limpiarCamposDO();
		limpiarCamposA();
	});
	//callback al boton para limpiar - Busqueda por Datos Oficio
	$( "#btnDOLimpiar" ).click(function() {
		limpiarCamposDO();
	});
	//callback al boton para limpiar - Busqueda por Autorizado
	$( "#btnALimpiar" ).click(function() {
		limpiarCamposA();
	});
	//funcioens de limpieza de campos
	function limpiarCamposA(){
		document.getElementById('rbtAOpMat').checked = true;
		$("#txtMatricula").val('');
		$("#txtNombre").val('');
	}
	function limpiarCamposDO(){
		$( "#txtClaveDga" ).val('');
		$( "#fltDOFhDel_day" ).val('null');
		$( "#fltDOFhDel_month" ).val('null');
		$( "#fltDOFhDel_year" ).val('null');
		$( "#fltDOFhAl_day" ).val('null');
		$( "#fltDOFhAl_month" ).val('null');
		$( "#fltDOFhAl_year" ).val('null');
	}
	//callback al boton para submitear - Busqueda por Datos Oficio
	$( "#btnDOBuscar" ).click(function() {
		limpiaValidacionDO();
		var valid = validaCamposDO();
		//setea el tipo de filtro de búsqueda
		$("#hdnFltType").val("DO");
		
		if(valid)
			$( "#frmApp" ).submit();
	});
	//callback al boton para submitear - Busqueda por Autorizado
	$( "#btnABuscar" ).click(function() {
		limpiaValidacionA();
		var valid = validaCamposA();
		var checkedVal = $('input:radio[name=fltAOp]:checked').val(); //MAT O NOM
		//setea el tipo de filtro de búsqueda
		if(checkedVal == "MAT"){
			$("#hdnFltType").val("AMAT");
		}
		else if(checkedVal == "NOM"){
			$("#hdnFltType").val("ANOM");
		}
		
		if(valid)
			$( "#frmApp" ).submit();
	});
	//validaciones
	function validaCamposDO(){
		var valid = true;

		var fechaDelDia = $( "#fltDOFhDel_day" ).val();
		var fechaDelMes = $( "#fltDOFhDel_month" ).val();
		var fechaDelAnio = $( "#fltDOFhDel_year" ).val();
		var fechaAlDia = $( "#fltDOFhAl_day" ).val();
		var fechaAlMes = $( "#fltDOFhAl_month" ).val();
		var fechaAlAnio = $( "#fltDOFhAl_year" ).val();

		//valida que las fechas esten "completas"
		if( fechaDelDia!="null" && fechaDelMes=="null" && fechaDelAnio=="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}
		if( fechaDelDia=="null" && fechaDelMes!="null" && fechaDelAnio=="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}
		if( fechaDelDia=="null" && fechaDelMes=="null" && fechaDelAnio!="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}
		if( fechaDelDia!="null" && fechaDelMes!="null" && fechaDelAnio=="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}
		if( fechaDelDia!="null" && fechaDelMes=="null" && fechaDelAnio!="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}
		if( fechaDelDia=="null" && fechaDelMes!="null" && fechaDelAnio!="null" ){
			$('#divDOFhVigInicio').addClass( 'has-error' );
			valid = false;
		}

		if( fechaAlDia!="null" && fechaAlMes=="null" && fechaAlAnio=="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		if( fechaAlDia=="null" && fechaAlMes!="null" && fechaAlAnio=="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		if( fechaAlDia=="null" && fechaAlMes=="null" && fechaAlAnio!="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		if( fechaAlDia!="null" && fechaAlMes!="null" && fechaAlAnio=="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		if( fechaAlDia!="null" && fechaAlMes=="null" && fechaAlAnio!="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		if( fechaAlDia=="null" && fechaAlMes!="null" && fechaAlAnio!="null" ){
			$('#divDOFhVigFin').addClass( 'has-error' );
			valid = false;
		}
		
		return valid;
	}
	function validaCamposA(){
		var valid = true;
		var checkedVal = $('input:radio[name=fltAOp]:checked').val(); //MAT O NOM

		var matricula = $.trim($("#txtMatricula").val());
		var nombre = $.trim($("#txtNombre").val());
		
		// fltType (filtro de búsqueda)
		if(checkedVal == "MAT"){
			if(matricula == ""){
				$('#divAMatricula').addClass( 'has-error' );
				valid = false;
			}
			else if(isNaN(matricula)){
				$('#divAMatricula').addClass( 'has-error' );
				valid = false;
			}
		}
		else if(checkedVal == "NOM"){
			if(nombre == ""){
				$('#divANombre').addClass( 'has-error' );
				valid = false;
			}
		}
		
		return valid
	}
	//limpia rastro de validaciones
	function limpiaValidacionDO(){
		$('#divDOFhVigInicio').removeClass( 'has-error' );
		$('#divDOFhVigFin').removeClass( 'has-error' );
	}
	function limpiaValidacionA(){
		$('#divAMatricula').removeClass( 'has-error' );
		$('#divANombre').removeClass( 'has-error' );
	}
	
	//fixes a ejecutarse al inicio
	$(function(){

		//carga de datos de inicio en variables
		var fltType = "${viewModelInstance?.fltType}";
		var fltDODga = "${viewModelInstance?.fltDODga}";
		var fltDOFhDelDay = "${viewModelInstance?.fltDOFhDelDay}";
		var fltDOFhDelMonth = "${viewModelInstance?.fltDOFhDelMonth}";
		var fltDOFhDelYear = "${viewModelInstance?.fltDOFhDelYear}";
		var fltDOFhAlDay = "${viewModelInstance?.fltDOFhAlDay}";
		var fltDOFhAlMonth = "${viewModelInstance?.fltDOFhAlMonth}";
		var fltDOFhAlYear = "${viewModelInstance?.fltDOFhAlYear}";
		var fltAMat = "${viewModelInstance?.fltAMat}";
		var fltANom = "${viewModelInstance?.fltANom}";
		if(fltDOFhDelDay=="-1"||fltDOFhDelDay=="") fltDOFhDelDay="null";
		if(fltDOFhDelMonth=="-1"||fltDOFhDelMonth=="") fltDOFhDelMonth="null";
		if(fltDOFhDelYear=="-1"||fltDOFhDelYear=="") fltDOFhDelYear="null";
		if(fltDOFhAlDay=="-1"||fltDOFhAlDay=="") fltDOFhAlDay="null";
		if(fltDOFhAlMonth=="-1"||fltDOFhAlMonth=="") fltDOFhAlMonth="null";
		if(fltDOFhAlYear=="-1"||fltDOFhAlYear=="") fltDOFhAlYear="null";
		//carga de variables en DOM
		if(fltType=="DO"){
			$('#divPorDatosOficio').show();
			$('#divPorAutorizados').hide();
			$('#fltDOFhDel_day').val(fltDOFhDelDay);
			$('#fltDOFhDel_month').val(fltDOFhDelMonth);
			$('#fltDOFhDel_year').val(fltDOFhDelYear);
			$('#fltDOFhAl_day').val(fltDOFhAlDay);
			$('#fltDOFhAl_month').val(fltDOFhAlMonth);
			$('#fltDOFhAl_year').val(fltDOFhAlYear);
		}
		else if(fltType=="AMAT"){
			$('#divPorDatosOficio').hide();
			$('#divPorAutorizados').show();
			$('#txtMatricula').val(fltAMat);
			$('#txtNombre').val("");
			document.getElementById('rbtAOpMat').checked = true;
		}
		else if(fltType=="ANOM"){
			$('#divPorDatosOficio').hide();
			$('#divPorAutorizados').show();
			$('#txtMatricula').val("");
			$('#txtNombre').val(fltANom);
			document.getElementById('rbtAOpNom').checked = true;
		}
		else{
			$('#divPorDatosOficio').hide();
			$('#divPorAutorizados').hide();
		}
		//fixes CSS
		$('#fltDOFhDel_day').addClass( 'form-control' );
		$('#fltDOFhDel_month').addClass( 'form-control' );
		$('#fltDOFhDel_year').addClass( 'form-control' );
		$('#fltDOFhDel_day').addClass( 'col-md-4' );
		$('#fltDOFhDel_month').addClass( 'col-md-4' );
		$('#fltDOFhDel_year').addClass( 'col-md-4' );
		$('#fltDOFhDel_day').css( 'width', '28%' );
		$('#fltDOFhDel_month').css( 'width', '38%' );
		$('#fltDOFhDel_year').css( 'width', '34%' );
		$('#fltDOFhAl_day').addClass( 'form-control' );
		$('#fltDOFhAl_month').addClass( 'form-control' );
		$('#fltDOFhAl_year').addClass( 'form-control' );
		$('#fltDOFhAl_day').addClass( 'col-md-4' );
		$('#fltDOFhAl_month').addClass( 'col-md-4' );
		$('#fltDOFhAl_year').addClass( 'col-md-4' );
		$('#fltDOFhAl_day').css( 'width', '28%' );
		$('#fltDOFhAl_month').css( 'width', '38%' );
		$('#fltDOFhAl_year').css( 'width', '34%' );

	});
	</script>
	<!-- FIN: SCRIPT PARA FUNCIONAMIENTO DE VISTA -->



	</body>
</html>
