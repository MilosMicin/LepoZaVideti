$(document).ready(function()
{
	slideShow1();
	slideShow2();
	slideShow3();	
	slajder();
});
function slideShow1()
{
    var current = $(".slajd .prvi");
	var next = current.next().length ? current.next() : current.parent().children(':first');
	
	current.hide().removeClass('prvi');
	next.fadeIn().addClass('prvi');
  
	setTimeout(slideShow1, 5000);
}
function slideShow2()
{
    var current = $(".slajd .drugi");
	var next = current.next().length ? current.next() : current.parent().children(':first');
	
	current.hide().removeClass('drugi');
	next.fadeIn().addClass('drugi');
  
	setTimeout(slideShow2, 5000);
}
function slideShow3()
{
    var current = $(".slajd .treci");
	var next = current.next().length ? current.next() : current.parent().children(':first');
	
	current.hide().removeClass('treci');
	next.fadeIn().addClass('treci');
  
	setTimeout(slideShow3, 5000);
}
