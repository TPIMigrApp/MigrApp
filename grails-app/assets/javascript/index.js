$('input[type="submit"]').mousedown(function(){
  $(this).css('background', '#2ecc71');
});
$('input[type="submit"]').mouseup(function(){
  $(this).css('background', '#1abc9c');
});

$('#loginform').click(function(){
  $('.login').fadeToggle('slow');
  $(this).toggleClass('green');
});

$('#logoutform').click(function(){
  $('.logout').fadeToggle('slow');
  $(this).toggleClass('green');
});

$(document).mouseup(function (e)
{
    var container = $(".login");
	var container2 = $(".logout");
	//var contenedores = [$(".login"), $(".logout")]
	
    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $('#loginform').removeClass('green');
    }
	
	if (!container2.is(e.target) // if the target of the click isn't the container...
        && container2.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container2.hide();
        $('#logoutform').removeClass('green');
    }
});