function obtenerGrupo(e){
   $.ajax({
      type:"POST",
      url:url_obtGrupo,
      data:{
         id:e
      },
      success: function(data){
         //alert(data);
         $("#contenido-grupo").html(data)
      },
      error: function(){
         alert(url_obtGrupo);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

function unirme(e){
   $.ajax({
      type:"POST",
      url:url,
      data:{
         id:$("#grupoId").val()
      },
      success: function(data){
         $("#rutinas").html(data)
      },
      error: function(){
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });

}

function aportar(e){
   $.ajax({
      type:"POST",
      url:url2,
      data:{
         id: $("#grupoId").val(),
         contenido: $("#contenido").val()
      },
      success: function(data){
         $("#comments").html(data),
         limpiar()
      },
      error: function(){
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });

}

function buscarGrupos(){
   console.log("OK");
   $.ajax({
      type:"POST",
      url:url_busGrupo,
      data:{
         tg:$("#gp-tags").val()
      },
      success: function(data){
         //alert(data);
         $("#listaGrupos").html(data)
      },
      error: function(){
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

function buscarTag(tag){
   $("#gp-tags").val(tag);
   $("#buscar").trigger('click');
}

function limpiar(){
   $("#contenido").val('');
   //$('#comment').animate({'margin-top': '50px'}, 1000);
   //$("#comments").animate({ scrollTop: $("#comments").prop("scrollHeight") }, 1000);
}

$("document").ready(function(){
   //$("#comments").animate({ scrollTop: $("#comments").prop("scrollHeight") }, 3000);
});
