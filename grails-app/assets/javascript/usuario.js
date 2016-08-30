var mod_map_pe;
var mod_map_rt;
var marker = null;

$("document").ready(function () {
   //Handler for .ready() called.
   window.setTimeout(function () {
      location.href = link
   }, 5000);
});

function enviarSugerencia(e){
   $.ajax({
      type:"POST",
      url:url_enviarSugerencia,
      data:{
         mensaje:$("#mensaje").val(),
         nombre:$("#nombre").val(),
         email:$("#email").val()
      },
      success: function(data){
         $("#mensaje").val("");
         $("#nombre").val("");
         $("#email").val("");
         alert("Sugerencia enviada");
      },
      error: function(){
         alert(url_enviarSugerencia);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}


function iniciarMapaCE(){
   iniciarMapaPEMod(-4.5,-74);
   mod_map_pe.addListener('click',function(e){
      addMarker(e.latLng)
   });
}


function iniciarMapaPEMod(lat,lng){
   var myLatlng = new google.maps.LatLng(lat,lng);
   var options = {
      center: myLatlng,
      zoom: 15,
      disableDoubleClickZoom: true,
   }
   mod_map_pe = new google.maps.Map(document.getElementById('mod-map-pe'),options);
   mod_map_rt = new google.maps.Map(document.getElementById('mod-map-rt'),options);
}

//FUNCIONES QUE MANEJAN EL AGREGAR EL PUNTO DE ENCUENTRO AL MAPA, SE ENCARGAN QUE SOLO PUEDA EXISTIR UN PUNTO DE ENCUENTRO

function addMarker(location){
   if( marker != null){
      marker.setMap(null);
   }
   marker = new google.maps.Marker({
      position:location,
      map: mod_map_pe,
      draggable: true,
      animation: google.maps.Animation.DROP
   });
   marker.addListener('dragend', function(e){
      actualizarPosicion(e.latLng)
   });
   actualizarPosicion(location);
}

function actualizarPosicion(location){
   $("#mod-lat").val(location.lat);
   $("#mod-lng").val(location.lng);
   //alert( $("#lat").val() + ", "+ $("#lng").val() );
}



$(document).ready(function(){

   $("#abrirModalCrearEvento").click( function(){
      //google.maps.event.trigger(mod_map_pe,'resize');
      iniciarMapaCE();
      cargarRutas();
   });

   $("#codigo-ruta").change(function(){
      //alert($("#codigo-ruta").val());
      $.ajax({
         type:"POST",
         url:url_obtenerPuntosRutaModal,
         data:{
            ruta:$("#codigo-ruta").val()
         },
         success: function(data){
            //alert(data);
            iniciarMapaRutaModal(data);
            //$("#codigo-ruta").html(data);
            $("#ruta").val($("#codigo-ruta").val());
         },
         error: function(){
            alert("Algo ha salido mal, por favor intentelo de nuevo!!");
         },
         complete: function(){}
      });
   });



   $("#modalCrearEvento").hover(function(){
      google.maps.event.trigger(mod_map_pe,'resize');
      google.maps.event.trigger(mod_map_rt,'resize');
   });

   $("#mod-map-rt").hover(function(){
      google.maps.event.trigger(mod_map_rt,'resize');
   });
});


function iniciarMapaRutaModal(puntosRutaJSON){
   var myLatlng;
   if( puntosRutaJSON.length > 0){
      myLatlng = new google.maps.LatLng(puntosRutaJSON[0].lat,puntosRutaJSON[0].lng);
   }else{
      myLatlng = new google.maps.LatLng(-4.63,-74.103);
   }
   options = {
      center: myLatlng,
      zoom: 13,
      disableDoubleClickZoom: true,
   }
  // $("#mod-map-rt").html();
   mod_map_rt = new google.maps.Map(document.getElementById('mod-map-rt'),options);
   //alert(puntosRutaJSON.length);
   for(var i=0;i<puntosRutaJSON.length;++i){
      var latlng = new google.maps.LatLng(puntosRutaJSON[i].lat,puntosRutaJSON[i].lng);
      new google.maps.Marker({
         position:latlng,     
         map: mod_map_rt,
         draggable: false,
         animation: google.maps.Animation.DROP
      });
   }
   //refrescarMapaMod(mod_map_rt);
}


function cargarRutas(e){
   $.ajax({
      type:"POST",
      url:url_obtenerRutasModal,
      data:{
      },
      success: function(data){
         //alert(data);
         $("#codigo-ruta").html(data);
      },
      error: function(){
         alert(url_enviarSugerencia);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

