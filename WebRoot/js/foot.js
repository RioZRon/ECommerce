$(function(){
	$('.goTop').click(function(e){
		e.stopPropagation();
		$('html, body').animate({scrollTop: 0},300);
		backTop();
		return false;
	});
});
window.onscroll=backTop;
function backTop(){
	var scrollTop = $(document).scrollTop(),backtop=$('#backtop'),winh = $(window).height();
	if(scrollTop==0){
		backtop.hide();
	}else{
		backtop.show();
		if (!window.XMLHttpRequest)
		{
			backtop.css("top", scrollTop + winh - 50);
		}
	}
}

function setBanner(){
	var ww = $(window).width();	
	var h = ww*0.208;
	$('#slide_pic').css({'width':ww+'px','height':h+'px'});
	$('#slide_pic li').css({'width':ww+'px','height':h+'px'});
}
$(function(){
	setBanner();
	backTop();
});