<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<h2 class="panel-title">Acciones</h2>
			</div>
			<br>
			<ul class="nav navbar-nav" role="navigation">
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión cursos</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="create-cursos" class="content scaffold-create" role="main">
						<h1>
							Crear Curso 
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

			<g:hasErrors bean="${cursosInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${cursosInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:cursosInstance, action:'save']">
				<fieldset class="form">
					<g:render template="form" />
	<br>

					<table class="table">
						<thead>
						<tr>
						Expositores
						</tr>
							<tr>
								<th>Nombre</th>
								<th>Apellido Paterno</th>
								<th>Apellido Materno</th>
								<th>Fecha</th>
								<th>Horas</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody id="tbdyExpositores">
							<tr>
								<td>
									<input id="txtNewNomExpositor" class="form-control" type="text" />
								</td>
								<td>
									<input id="txtNewPriApeExpositor" class="form-control" type="text" />
								</td>
								<td>
									<input id="txtNewSegApeExpositor" class="form-control" type="text" />
								</td>
								<td>
									<input id="dateNewFecha" class="form-control" type="Date" />
								</td>
								
								<td>
									<input id="NumNewhora" class="form-control" type="time" />
								</td>						
								<td>
									<button id="btnAddNewExpositor" class="add btn btn-success btn-sm"> <span class="glyphicon glyphicon-plus"></span> Agregar </button>
								</td>
							</tr>

						</tbody>
					</table>
					
					<script type="text/template" id="expositorTemplate">
						<td>{{=nombreExpositor}}</td>
						<td>{{=primerApellidoExpositor}}</td>
						<td>{{=segundoApellidoExpositor}}</td>
						<td>{{=fechaCreacion}}</td>
						<td>{{=horas}}</td>
						<td><button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button> 
							<input type="hidden" name="expositor" value="{ 'id':{{=grailsId}}, 'nombreExpositor' : {{=nombreExpositor}}, 'primerApellidoExpositor' : {{=primerApellidoExpositor}}, 
							 'segundoApellidoExpositor' : {{=segundoApellidoExpositor}},  'fechaCreacion' : {{=fechaCreacion}}, 'horas' : {{=horas}} } " />
						</td>
					</script>
					
					
					<script type="text/javascript">

					//definimos un "contexto"
					var exWidget = exWidget || {}

					//ahi va el modelo
					exWidget.Expositor = Backbone.Model.extend({
						defaults: {
							idx: -1, //el indice de la lista
							grailsId: -1, //para cuando son nuevos
							//idTipoTelefono: 0, //la id no va
							horas: '',
							fechaCreacion: '',
							segundoApellidoExpositor: '',
							primerApellidoExpositor: '',
							nombreExpositor: '',
							}
					});

					//se define la "coleccion" correspondiente
					exWidget.Expositores = Backbone.Collection.extend({
					model: exWidget.Expositor
						});

						//hasta ahi ya definimos el modelo;
						//ahora hay que hacer un prototipo rapido de la vista para ver
						//como iría quedado; me imagino una parecida a lo de los apoderados no???? si... va
						//mmm deja pienso...

						//definiendo vista para el modelo de telefono
						exWidget.ExpositorView = Backbone.View.extend({
						tagName: 'tr', //el tag con el que estaría representado cada elemento del modelo
						className: 'expositorRow',
						template: _.template( $('#expositorTemplate').html() ), //para no estar escribiendo "html" en el javascript, definimos templates

						render: function(){
						this.$el.html( this.template( this.model.toJSON() ) ); //$el se podría decir que es como la refería al "dom" de este elemento de vista...
																			   //lo que hariamos aqui es que el html de ese elemento lo rellamos con lo que definimos
		   																	   //como template que a su vez se va a rellenar con los datos del modelo
						return this; //faltaba esto...
						},

					events:{
						//aqui se podria decir que es donde conecta los callback a lo que en MVC se suele ver como "metodos de controlador"
						'click .delete':'quitarExpositor' //aqui conectaria al boton de borrar para pueda hacer la accion de quitar telefono
							},

					quitarExpositor: function(){
					//Destruye el modelo
					this.model.destroy(); //el this.model sería el modelo al que esta referenciado la vista; aunque no lo declaramos, se "asigna dinamicamente"
					//Destruye la vista
					this.remove(); //con esta accion es que practicamente "desapareceria" del DOM este elemento
					}
					});

				//defininedo la vista para la colección
				exWidget.ExpositoresView = Backbone.View.extend({
				el: '#tbdyExpositores', //aqui si estamos definiendo a que elemento del DOM corresponde esta vista

					initialize: function( initialExpositores ){
						this.collection = new exWidget.Expositores(initialExpositores); //initial telefonos puede ser un arreglo de modelos "precargado"
						this.render();
						this.listenTo( this.collection, 'add', this.renderExpositor ); //este metodo hace que se "escuche" a los cambios de la colección
																      //cada que alla un cambio manda a llamar a esa funcion, que se va a
	      																//encargar de crear una vista de "telefono" y agregarla a la vista
																		//de la colección
					},

					render: function(){
						this.collection.each ( function(item){
						this.renderExpositor(item)
						}, this );
					},

					//aqui manda a "llamar" a que se rendere cada "modelo"
					renderExpositor: function(item){
					var expositorView = new exWidget.ExpositorView({model:item});
					this.$el.append( expositorView.render().el );
					},

					events:{
					'click #btnAddNewExpositor': 'agregarExpositor'
					},

					agregarExpositor: function(e) {
					e.preventDefault(); //para que no haga submit... creo...

				//aqui saca los datos del formulario al modelo que vayamos a crear		
				var _horas = $('#NumNewhora').val();
				var _fechaCreacion = $('#dateNewFecha').val();
				var _segundoApellidoExpositor = $('#txtNewSegApeExpositor').val();
				var _primerApellidoExpositor = $('#txtNewPriApeExpositor').val();
				var _nombreExpositor = $('#txtNewNomExpositor').val();
				var _idx = _.size(this.collection) 
				var expositor = new exWidget.Expositor( { horas: _horas , fechaCreacion: _fechaCreacion , segundoApellidoExpositor: _segundoApellidoExpositor , primerApellidoExpositor: _primerApellidoExpositor , nombreExpositor: _nombreExpositor , idx: _idx } );
		
				this.collection.add(expositor);
					}
			});

		$(function(){
			new exWidget.ExpositoresView();
		});

</script>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary colortitle colorblack" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
