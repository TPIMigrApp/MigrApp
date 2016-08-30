
var convSel = null;		//Variable para controlar la conversacion actual.


//AJAX PARA CARGAR LOS MENSAJES DE UNA CONVERSACION Y MOSTRARLOS.
$(document).on('click','.contacto',function(){
	convSel = $(this).text();		//Obtengo UserName
	$.ajax({
		url: 'mensaje/buscarMensajes',			//Llamo a buscarUsuario
		type: 'POST',
		dataType: 'json',					//Que el controlador me devuelva el objeto de tipo JSON.
		data: {
			userName: convSel			//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {
			console.log(data);
			$('#mensajes').empty();
			console.log(nomUsuario);
			console.log(convSel);
			for(obj in data){
				if(data[obj].dueño.username == nomUsuario){
					console.log(1);
					$('#mensajes').append("<div class='mensaje-propio'>"+data[obj].contenido+"\t - <p>"+nomUsuario+"</p></div>");	//En caso de ser exitoso el request, iterar por cada objeto(mensaje) y mostrar.
				}
				else if (data[obj].dueño.username == convSel){
					console.log(2);
					$('#mensajes').append("<div class='mensaje-otro'>"+data[obj].contenido+"\t - <p>"+convSel+"</p></div>");
				}
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
});


//AJAX PARA CREAR UN NUEVO MENSAJE Y MOSTRARLO EN LA CONVERSACION.
$(document).on('click','#cm',function(event){
	event.preventDefault();
	console.log("ConvSel: " + convSel);
	var a = $('#contenido').val();
	console.log("Contenido: " + a);
	if (convSel == null){

	}
	else{
		$.ajax({
			url: 'mensaje/crearMensaje',			//Llamo a crearMensaje
			type: 'POST',
			dataType: 'text',					//Que el controlador me devuelva el objeto de tipo texto.
			data: {
				userName: convSel,			//Envio el nombre de usuario que tengo seleccionado.
				contenido: $('#contenido').val(),
			},
			success: function(data) {
				$('#mensajes').append("<div class='mensaje-propio'>"+data+"\t - <p>"+nomUsuario+"</p></div>");		//Agrega el nuevo mensaje al gsp
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}
		});
	}
});

//AJAX PARA CREAR UNA CONVERSACION Y MOSTRARLO EN LA PAGINA.
function crearConversacion(){
	var user = $(".amigoSel").html();		//Obtengo el nombre de usuario del destinatario en la conversacion desde el select
	$.ajax({
		url: 'mensaje/crearConversacion',			//Llamo a crearConversacion
		type: 'POST',
		data: {
			userName: user,			//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {		//Si creo la conversacion exitosamente.
			//Verifica el nombre de usuario  en sesion para identificar el otro usuario de la conversacion e imprimir en pantalla ese nombre.
			console.log("Mi Usuario: " + nomUsuario);
			console.log("El Destinatario: " + convSel);
			console.log("El u1 de la conv: " + data.u1.username);
			if (data.u1.username == nomUsuario){
				console.log(1);
				convSel = $(".contacto:contains("+data.u2.username+")").html();
				if (convSel == undefined){
					console.log(3);
					$('#amigos').append("<div class='media'><div class='media-body'><div class='contacto'><h4>"+data.u2.username+"</h4></div></div></div>");
				}
				convSel = $('.contacto:contains('+data.u2.username+')').html();		//dejar la conversacion seleccionada de una vez. Al escribir un mensaje queda asociado a esta conversacion
				console.log(5);
			}
			else{
				console.log(2);
				convSel = $(".contacto:contains("+data.u1.username+")").html();
				if (convSel == undefined){
					console.log(4);
					var test = $('#amigos').html();
					console.log(test);
					$('#amigos').append("<div class='media'><div class='media-body'><div class='contacto'><h4>"+data.u1.username+"</h4></div></div></div>");	//Mostrar el nombre del destinatario en pantalla.
				}
				convSel = $('.contacto:contains('+data.u1.username+')').html();		//dejar la conversacion seleccionada de una vez.Al escribir un mensaje queda asociado a esta conversacion
				console.log(6);
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		}
	});
	$('.amigoSel').attr('class','amigo');
}

//Cambio de div entre seleccionado y no seleccionado para el modal
$(document).on('click','.amigo',function(event){
	$('.amigoSel').attr('class','amigo');
	$(this).attr('class', 'amigoSel');
});

//Activador para abrir el modal
$(document).on('click','#opener',function() { theDialog.dialog("open"); });


