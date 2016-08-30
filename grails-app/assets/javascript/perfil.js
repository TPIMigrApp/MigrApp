function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#vistaimagen').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

/*
 * En esta parte el código se registra el evento "cambio de estado" para el seleccionador de archivos
 */
$("#fileload").change(function(){
    readURL(this);
});

$(document).ready(function(){
   $("#username").prop("disable",true);
   $("#email").prop("disable",true);
});





