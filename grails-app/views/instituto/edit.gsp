<%@ page import="mx.amib.sistemas.cursoseventos.institutos.model.Instituto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instituto.label', default: 'Instituto')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		
	<script type="text/javascript">

	cpoti = (${institutoInstance?.domicilioOficialIdSepomex})
	var subi = cpoti.toString();
	var subCPI = subi.substring(4,9);
	
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
						$('#selAsentamiento').val('${institutoInstance?.domicilioOficialIdSepomex}');
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
		$('#txtCP').val(subCPI);
		$('#txtCP').trigger('change');

		
		/* Trimeo de campos al perder el focus */
		//$( "form" ).focusout(function() {
		//	trimAllFields();
		//});
  
	});

	function limpiaDomicilio()
	{
		$('#txtEntidad').val('');
		$('#txtDelegacion').val('');
		$('#txtCiudad').val('');
		$('#selAsentamiento').html('<option value="">-Seleccione-</option>');
	}
	</script>
	
	<script type="text/javascript">

	cpotf = (${institutoInstance?.domicilioFiscalIdSepomex})
	var subf = cpotf.toString();
	var subCPF = subf.substring(4,9);
	
	$(function() {
		/* Obtencion de datos desde el código postal */
		$('#txtCPF').change( function(){
			
			if( $('#txtCPF').val().length == 5 )
			{
				$.ajax({
					dataType: 'json',
					url: '<g:createLink controller="evento" action="findSepomex" />' + '/' + $('#txtCPF').val(),
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
						
						$('#txtEntidadF').val(data[0].asentamiento.municipio.entidadFederativa.nombre);
						$('#txtDelegacionF').val(data[0].asentamiento.municipio.nombre);
						$('#txtCiudadF').val(data[0].ciudad.municipio.entidadFederativa.nombre);
						//$("#selAsentamiento").removeAttr('disabled');
						$('#selAsentamientoF').html(asentamientos);
						/* Carga el valor si es que ya lo trae del modelo*/
						$('#selAsentamientoF').val('${institutoInstance?.domicilioFiscalIdSepomex}');
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
		$('#txtCPF').val(subCPF);
		$('#txtCPF').trigger('change');

		
		/* Trimeo de campos al perder el focus */
		$( "form" ).focusout(function() {
			trimAllFields();
		});
  
	});

	function limpiaDomicilio()
	{
		$('#txtEntidadF').val('');
		$('#txtDelegacionF').val('');
		$('#txtCiudadF').val('');
		$('#selAsentamientoF').html('<option value="">-Seleccione-</option>');
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
				<li><g:link class="list btn btn-primary colortitle colorblack" action="index">Gestión de Institutos</g:link></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><g:link class="create btn btn-primary colortitle colorblack" action="create">Crear institutos</g:link></li>
			</ul><br>
		</div>
		</fieldset>

	<fieldset>
		<div class="panel panel-default col-lg-12">
			<div class="panel-heading">
				<div class="widgetTitle">
					<div id="edit-instituto" class="content scaffold-edit" role="main">
						<h1>
							Editar Institutos
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

			<g:hasErrors bean="${institutoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${institutoInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form url="[resource:institutoInstance, action:'update']"
				method="PUT">
				<g:hiddenField name="version" value="${institutoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
					<table class="table">
	<thead>
		<tr>
			<th>Número de teléfono</th>
			<th>Tipo</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody id="tbdyTelefonos">
		<tr>
			<td><input id="txtNewNumTelefono" class="form-control" type="text" /> </td>
			<td>

					<g:select id="selNewTipoTelefono" name="selNewTipoTelefono" from="${mx.amib.sistemas.cursoseventos.institutos.model.TipoTelefono.list()}" optionKey="id" optionValue="descripcion" class ="form-control"/>
				
			</td>
			<td>
				<button id="btnAddNewTelefono" class="add btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span> Agregar</button>
				
			</td>
		</tr>
		
	</tbody>
</table>

	<script type="text/template" id="telefonoTemplate">
			<td>{{=telefono}}</td>
			<td>{{=tipoTelefono}}</td>
			<td>
				<button class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Borrar</button>
				<button class="edit btn btn-warning  btn-sm"><span class="glyphicon glyphicon-trash"></span> Editar</button>
				<input type="hidden" name="telefono" value="{ 'id':{{=grailsId}}, 'telefono' : {{=telefono}}, 'idTipoTelefono' : {{=idTipoTelefono}} } " />
			</td>
	</script>

		<script type="text/javascript">

//definimos un "contexto"
var telWidget = telWidget || {}

//ahi va el modelo
telWidget.Telefono = Backbone.Model.extend({
	defaults: {
		idx: -1, //el indice de la lista
		grailsId: -1, //para cuando son nuevos
		idTipoTelefono: 0, //la id no va
		tipoTelefono: '',
		telefono: '',
	}
});

//se define la "coleccion" correspondiente
telWidget.Telefonos = Backbone.Collection.extend({
	model: telWidget.Telefono
});

//hasta ahi ya definimos el modelo;
//ahora hay que hacer un prototipo rapido de la vista para ver
//como iría quedado; me imagino una parecida a lo de los apoderados no???? si... va
//mmm deja pienso...

//definiendo vista para el modelo de telefono
telWidget.TelefonoView = Backbone.View.extend({
	tagName: 'tr', //el tag con el que estaría representado cada elemento del modelo
	className: 'telefonoRow',
	template: _.template( $('#telefonoTemplate').html() ), //para no estar escribiendo "html" en el javascript, definimos templates

	render: function(){
		this.$el.html( this.template( this.model.toJSON() ) ); //$el se podría decir que es como la refería al "dom" de este elemento de vista...
															   //lo que hariamos aqui es que el html de ese elemento lo rellamos con lo que definimos
		   													   //como template que a su vez se va a rellenar con los datos del modelo
		return this; //faltaba esto...
	},

	events:{
		//aqui se podria decir que es donde conecta los callback a lo que en MVC se suele ver como "metodos de controlador"
		'click .delete':'quitarTelefono' //aqui conectaria al boton de borrar para pueda hacer la accion de quitar telefono
	},

	quitarTelefono: function(){
		//Destruye el modelo
		this.model.destroy(); //el this.model sería el modelo al que esta referenciado la vista; aunque no lo declaramos, se "asigna dinamicamente"
		//Destruye la vista
		this.remove(); //con esta accion es que practicamente "desapareceria" del DOM este elemento
	}
});

//defininedo la vista para la colección
telWidget.TelefonosView = Backbone.View.extend({
	el: '#tbdyTelefonos', //aqui si estamos definiendo a que elemento del DOM corresponde esta vista

	initialize: function( initialTelefonos ){
		this.collection = new telWidget.Telefonos(initialTelefonos); //initial telefonos puede ser un arreglo de modelos "precargado"
		this.render();
		this.listenTo( this.collection, 'add', this.renderTelefono ); //este metodo hace que se "escuche" a los cambios de la colección
																      //cada que alla un cambio manda a llamar a esa funcion, que se va a
	      																//encargar de crear una vista de "telefono" y agregarla a la vista
																		//de la colección
	},

	render: function(){
		this.collection.each ( function(item){
			this.renderTelefono(item)
		}, this );
	},

	//aqui manda a "llamar" a que se rendere cada "modelo"
	renderTelefono: function(item){
		var telefonoView = new telWidget.TelefonoView({model:item});
		this.$el.append( telefonoView.render().el );
	},

	events:{
		'click #btnAddNewTelefono': 'agregarTelefono'
	},

	agregarTelefono: function(e) {
		e.preventDefault(); //para que no haga submit... creo...

		//aqui saca los datos del formulario al modelo que vayamos a crear		
		var _idTipoTelefono = $('#selNewTipoTelefono').val();
		var _tipoTelefono = $('#selNewTipoTelefono option:selected').text();
		var _numtelefono = $('#txtNewNumTelefono').val();
		var _idx = _.size(this.collection) 
		var telefono = new telWidget.Telefono( { idTipoTelefono: _idTipoTelefono , tipoTelefono: _tipoTelefono , telefono:_numtelefono, idx: _idx } );
		
		this.collection.add(telefono);
	}
});

//$(function(){
	//new telWidget.TelefonosView();
//});

</script>
		
	<!-- script para sacar la lista de telefonos -->
<script type="text/javascript">
		//Carga datos del modelo
		$(function(){
			var telefonos = [
				<g:each in="${institutoInstance.telefonos}">
					{ telefono: ${it.telefono} },
				</g:each>
			];
			new telWidget.TelefonosView(telefonos);
		});			
	</script>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save btn btn-primary colortitle colorblack" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					&nbsp;
					<g:link class="list btn btn-primary colortitle colorblack" action="index">Regresar</g:link></li>
				</fieldset><br>
			</g:form>
		</div>
		</fieldset>
</body>
</html>
