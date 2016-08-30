var map_rt;
var map_pe;

//JAVASCRIPT PARA PINTAR LOS MAPAS PARA EL CASO DE EVENTOS, NO LA DEBE MODIFICAR POR NADA, CUALQUIER MODIFICACION Y EL CODIGO QUE HAGA 
//ESTA MAL YA ESTA PROBADA Y FUNCIONANDO 
//
//PARA USARLA DEBE LLAMAR LAS FUNCIONES iniciarMapaCE() y iniciarMapaRuta(ruta) LOS DIVS DEBEN TENER EL NOMBRE APROPIADO mapa-pe y mapa-rt
//PARA VER EJEMPLOS DE COMO USARLAS VER LAS VISTAS nuevoEvento y _listaEventos 

function iniciarMapaPE(lat,lng){
   var myLatlng = new google.maps.LatLng(lat,lng);
   var options = {
      center: myLatlng,
      zoom: 15,
      disableDoubleClickZoom: true,
   }
   map_pe = new google.maps.Map(document.getElementById('mapa-pe'),options);
}

//SE ENCARGA DE INICIAR EL MAPA CON LOS PUNTOS DE RUTA 
function iniciarMapaRuta(puntosRutaJSON){
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
   map_rt = new google.maps.Map(document.getElementById('mapa-rt'),options);
   
   for(var i=0;i<puntosRutaJSON.length;++i){
      var latlng = new google.maps.LatLng(puntosRutaJSON[i].lat,puntosRutaJSON[i].lng);
      new google.maps.Marker({
         position:latlng,     
         map: map_rt,
         draggable: false,
         animation: google.maps.Animation.DROP
      });
   }
   refrescarMapa(map_rt);
}

function callback(puntosRutaJSON,puntoEncuentro){
   var lat = puntoEncuentro.lat;
   var lng = puntoEncuentro.lng;
   iniciarMapaPE(lat,lng);
   iniciarMapaRuta(puntosRutaJSON);
   var myLatlng = new google.maps.LatLng(lat,lng);
   new google.maps.Marker({
      position:myLatlng,     
      map: map_pe,
      draggable: true,
      animation: google.maps.Animation.DROP
   });
}

function obtenerEventos(e){
   $.ajax({
      type:"POST",
      url:url_obtEventos,
      data:{
         tp:e
      },
      success: function(data){
         //alert(data);
         $("#lista-eventos").html(data)
      },
      error: function(){
         alert(url_obtMisEventos);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

function obtenerMisEventos(e){
   $.ajax({
      type:"POST",
      url:url_obtMisEventos,
      data:{
         tp:e
      },
      success: function(data){
         //alert(data);
         $("#lista-eventos").html(data)
      },
      error: function(){
         alert(url_obtMisEventos);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

$(document).ready(function(){

   $("#modal-open").click( function(){

      $( this ).blur() ;   
      if( $( "#modal-overlay" )[0] ) return false ;      
      $( "body" ).append( '<div id="modal-overlay"></div>' ) ;
      $( "#modal-overlay" ).fadeIn( "slow" ) ;
      centeringModalSyncer() ;
      $( "#modal-content" ).fadeIn( "slow" ) ;
      $( "#modal-overlay,#modal-close" ).unbind().click( function(){
         $( "#modal-content,#modal-overlay" ).fadeOut( "slow" , function(){
            $('#modal-overlay').remove() ;
         });
      });
   });


   $( window ).resize( centeringModalSyncer ) ;

   function centeringModalSyncer() {

      var w = $( window ).width() ;
      var h = $( window ).height() ;

      var cw = $("#modal-content" ).outerWidth({margin:true});
      var ch = $("#modal-content").outerHeight();

      $( "#modal-content" ).css( {"left": ((w - cw)/2) + "px","top": ((h - ch)/2) + "px"} ) ;

   }
   $("#to_map2").hover(function(){
      refrescarMapa(map_rt);
      //google.maps.event.trigger(map_rt,'resize');
   });
   $("#mapa-pe").hover(function(){
      refrescarMapa(map_pe);
   });

   $("#mapa-rt").hover(function(){
      refrescarMapa(map_rt);
   });
   
   $("#to_map2").mousemove(function(){
      refrescarMapa(map_rt);
      //google.maps.event.trigger(map_rt,'resize');
   });

   $("#to_map2").click(function(){
      refrescarMapa(map_rt);
   });

});

function refrescarMapa(mapa){
   google.maps.event.trigger(mapa,'resize');
}

