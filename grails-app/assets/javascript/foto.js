/*
 * CODIGO JAVASCRIPT PARA LAS VISTAS QUE MANEJAN LAS FOTOS
 */

/*
 * Se encarga de pintar la imagen en el componente de previsualización
 */
var map;
var marker = null;

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#vistaimagen').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

//la idea es mejorar esto, pero pues para la entrega creo que mola
function initMap(tipo){
   var myLatlng = new google.maps.LatLng(4.5,-74);
   var options = {
      center: myLatlng,
      zoom: 15,
      disableDoubleClickZoom: true,
   }
   map = new google.maps.Map(document.getElementById("mapa"),options);
   map.addListener('click',function(e){
      addMarker(e.latLng)
   });
}

function addMarker(location){
   if( marker != null){
      marker.setMap(null);
   }
   marker = new google.maps.Marker({
      position:location,
      map: map,
      draggable: true,
      animation: google.maps.Animation.DROP
   });
   marker.addListener('dragend', function(e){
      actualizarPosicion(e.latLng)
   });
   actualizarPosicion(location);
}

function actualizarPosicion(location){
   $("#lat").val(location.lat);
   $("#lng").val(location.lng);
   //alert( $("#lat").val() + ", "+ $("#lng").val() );
}


/*
 * En esta parte el código se registra el evento "cambio de estado" para el seleccionador de archivos
 */
$("#selector").change(function(){
    readURL(this);
});

/*
 * Funcion que valida si hay un archivo seleccionado, si no se genera un mensaje
 */


/*
 * ESTA FUNCION SE ENCARGA DE LIMPIAR EL AREA DE TEXTO DE LOS COMENTARIOS ASI MISMO COMO DESPLAZAR LSO COMENTARIOS HACIA ABAJO
 * SIN EMBARGO NO FUNCIONA LO DEL DESPLAZAMIENTO
 */
function limpiar(){
   $("#contenido").val('');
   //$('#comment').animate({'margin-top': '50px'}, 1000);
   $("#dialogbox").animate({ scrollTop: $("#dialogbox").prop("scrollHeight") }, 3000);
}

$("document").ready(function(){
   $("#dialogbox").animate({ scrollTop: $("#dialogbox").prop("scrollHeight") }, 3000);

   $("#subir-foto").click(function(){
      var selec = $("#selector")
         if( selec.val() == ''){
            alert("Por favor selecione una imagen");
            $("#vistaimagen").css("background-color","#ffe6e6");
            return false;
         }
      if( $("#ubicacion").is(":checked") && ( $("#lat").val() == "NONE" || $("#lng").val() == "NONE" ) ){
         alert("Por favor seleccione la ubicación de la foto");
         return false;
      }
      return true;

      return false;
   });

});

/*
   $("#ubicacion").change(function(){
   if( this.checked ){
   $("#mapa").show();
   }else{
   $("#mapa").hide();
   }
   });
*/

//AJAX para los comentarios
//AJAJAJAJAJAJAJAJAX una función es menos que tres, verdad?
function save(e){
   $.ajax({
      type: "POST",
      url: url,
      data:{
         contenido: $("#contenido").val(),
         id: $("#fotoId").val()
      },
      success: function(data){
         $("#dialogbox").html(data),
         limpiar()
      },
      error: function(request,sttus,error){
         alert("algo salio mal");
      },
      complete: function(){
      }

   });
}
