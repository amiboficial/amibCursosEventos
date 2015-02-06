<%@ page import="mx.amib.sistemas.cursoseventos.eventos.model.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	
	<script type="text/javascript">

	cpot = (${eventoInstance?.domicilioSEDESepomex})
	var sub = cpot.toString();
	var subCP = sub.substring(4,9);
	
	$(function() {
		/* Obtencion de datos desde el código postal */
		$('#txtCP').change( function(){
			
			if( $('#txtCP').val().length == 5 )
			{
				$.ajax({
					dataType: 'json',
					url: '<g:createLink controller="evento" action="findSepomex" />' + '/' + $('#txtCP').val(),
					data: 'traditional '
				}).done(function(data){

					if(data.length > 0)
					{
						var asentamientos = '<option value="">-Seleccione-</option>';
						
						/* Rellena una cadena de opciones con los asentamientos obtenidos */
				        for(var i = 0; i < data.length;i++)
				        {
			                asentamientos += '<option value="'+data[i].id+'">'+data[i].asentamiento.nombre+'</option>';
				        }		
						
						$('#txtEntidad').val(data[0].asentamiento.municipio.entidadFederativa.nombre);
						$('#txtDelegacion').val(data[0].asentamiento.municipio.nombre);
						$('#txtCiudad').val(data[0].ciudad.municipio.entidadFederativa.nombre);
						//$("#selAsentamiento").removeAttr('disabled');
						$('#selAsentamiento').html(asentamientos);
						/* Carga el valor si es que ya lo trae del modelo*/
						$('#selAsentamiento').val('${eventoInstance?.domicilioSEDESepomex}');
					}
					else
					{
						limpiaDomicilio();
					}
					
				});
			}
			else
			{
				limpiaDomicilio();
			}
			
		});

		/* Carga los valores de sepomex del modelo */
		$('#txtCP').val(subCP);
		$('#txtCP').trigger('change');

		
		/* Trimeo de campos al perder el focus */
		$( "form" ).focusout(function() {
			trimAllFields();
		});
  
	});

	function limpiaDomicilio()
	{
		$('#txtEntidad').val('');
		$('#txtDelegacion').val('');
		$('#txtCiudad').val('');
		$('#selAsentamiento').html('<option value="">-Seleccione-</option>');
	}
	</script>
	
	
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			</br>
			<ul class="nav navbar-nav" role="vavBar">
				<li><g:link class="list btn btn-default btn-primary" action="index">Gestión evento</g:link></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><g:link class="create btn btn-default btn-primary" action="create">Crear evento</g:link></li>
			</ul><br>
		</div>
		</fieldset>


	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="edit-evento" class="content scaffold-edit" role="main">
						<h1>
							Editar Eventos
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


			<%--<g:hasErrors bean="${eventoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${eventoInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors> --%>
			<g:form url="[resource:eventoInstance, action:'update']" method="PUT">
				<g:hiddenField name="version" value="${eventoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
					<g:render template="formJs"/>
						<%--<table class="table">
						<thead>
						<tr>
						Participantes
						</tr>
							<tr>
								<th>Matricula</th>
								<th>Nombre</th>
								
								<th>Acciones</th>
							</tr>
						</thead>
					 <tbody id="tbdyParticipantes">
							<tr>
								<td>
									<input id="txtNewMatricula" class="form-control" type="text" />
								</td>
								<td>
									<input id="txtNewNombreParticipante" class="form-control" type="text" />
								</td>			
								<td>
									<button id="btnAddNewParticipante" class="add btn btn-success btn-sm"> <span class="glyphicon glyphicon-plus"></span> Agregar </button>
								</td>
							</tr>

						</tbody>
					</table>
					
				
					
					<table class="table">
						<thead>
						<tr>
						Horarios
						</tr>
							<tr>
								<th>Dia</th>
								<th>Hora inicio</th>
								<th>Hora fin</th>
								<th>Fecha de creacion</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyHorarios">
							<tr>
								<td>
									<input id="txtNewDia" class="form-control" type="date" date-date-format="yyyy-mm-dd" data-date='{"startView": 2}' />
								</td>
								<td>
									<input id="txtNewHoraInicio" class="form-control" type="date" date-date-format=" HH:mm"/>
								</td>
								<td>
									<input id="txtNewHoraFin" class="form-control" type="date" date-date-format=" HH:mm"/>
								</td>
								 <td>
									<input id="dateNewFechaCreacionhor" class="form-control" type="date" date-date-format="yyyy-mm-dd" data-date='{"startView": 2}'/>
								</td>					
								<td>
									<button id="btnAddNewHorarios" class="add btn btn-success btn-sm"> <span class="glyphicon glyphicon-plus"></span> Agregar </button>
								</td>
							</tr>

						</tbody>
					</table>
					--%>	


<script type="text/template" id="horarioEventoTemplate">
						<td>{{=fechaDia}}</td>
						<td>{{=horaInicio}}</td>
						<td>{{=horafin}}</td>
			
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="horarioEvento" value="{ 'id':{{=grailsId}}, 'fechaDia' : {{=fechaDia}}, 'horaInicio' : {{=horaInicio}}, 'horafin' : {{=horafin}} } " /></td>
					</script>
					<script type="text/javascript">
					var perWidget = perWidget || {}
					perWidget.HorarioEvento = Backbone.Model.extend({
						defaults: {
							idx: -1, 
							grailsId: -1, 
							
							horafin: '',
							horaInicio: '',
							fechaDia: '',
							}
					});
					
					perWidget.HorarioEventos = Backbone.Collection.extend({
					model: perWidget.HorarioEvento
						});
						perWidget.HorarioEventoView = Backbone.View.extend({
						tagName: 'tr', 
						className: 'HorarioEventoRow',
						template: _.template( $('#horarioEventoTemplate').html() ), 
						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); 
						return this; 
						},
					events:{
						'click .delete':'quitarHorarioEvento' 
							},
					quitarHorarioEvento: function(){
					this.model.destroy(); 
					this.remove(); 
					}
					});
						
				perWidget.HorarioEventosView = Backbone.View.extend({
				el: '#tbdyHorarios', 
					initialize: function( initialHorarioEventos ){
						this.collection = new perWidget.HorarioEventos(initialHorarioEventos); 
						this.render();
						this.listenTo( this.collection, 'add', this.renderHorarioEvento ); 
					},
					render: function(){
						this.collection.each ( function(item){
						this.renderHorarioEvento(item)
						}, this );
					},
					renderHorarioEvento: function(item){
					var horarioEventoView = new perWidget.HorarioEventoView({model:item});
					this.$el.append( horarioEventoView.render().el );
					},
					events:{
					'click #btnAddNewHorarios': 'agregarHorarioEvento'
					},
					agregarHorarioEvento: function(e) {
					e.preventDefault();	//aqui se ponen las variables a capturar 

				var _horafin = $('#txtNewHoraFin').val();
				var _horaInicio = $('#txtNewHoraInicio').val();
				var _fechaDia = $('#txtNewDia').val();
				var _idx = _.size(this.collection) 
				var horarioEvento = new perWidget.HorarioEvento( { horafin: _horafin , horaInicio: _horaInicio , fechaDia: _fechaDia , idx: _idx } );
		
				this.collection.add(horarioEvento);
					}
			});
		//$(function(){
		//	new perWidget.HorarioEventosView();
		//});
		
		$(function(){
			var horarioEvento = [
				<g:each in="${eventoInstance.horarioEvento}">
					{ horafin:'${it.horafin}' , horaInicio:${it.horaInicio}, fechaDia:${it.fechaDia} , idx:'${idx}'  },
				</g:each>
			];
			new perWidget.HorarioEventosView(horarioEvento);
		});			
		
</script>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save btn btn-default btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					&nbsp;
					<g:link class="list btn btn-default btn-primary" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
