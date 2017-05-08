$().ready(function(){	
	$('.nav_li').hover(function(){	
		var s = $(this).find('.sub_ul');
		if(s.length>0){
			$(this).find('.nav_li_a').addClass('xl');
			s.fadeIn(300);
		}
	
	},function(){
		$(this).find('.nav_li_a').removeClass('xl');
		$(this).find('.sub_ul').fadeOut(300);
	
	});
	
	var _defautlTop = 125;  
	$(window).scroll(function(){ 
		if($(this).scrollTop() > _defautlTop){
			$('.nav').addClass('nav_g');
			//$('.left').addClass('left_g');
		}else{
			$('.nav').removeClass('nav_g');
			//$('.left').removeClass('left_g');
		}
	});
	
	$('.right').css({'min-height':$('.left').height()});
	
	//左导航
	$('.left_nav h2').click(function(){
		$('.sub2').hide();
		var sln = $(this).next('.sub2');	
		if(sln.is(":hidden")){
			sln.show(300);
			if($(this).hasClass('on')){
				$(this).addClass('showon');
			}else{
				$(this).addClass('show');
			}
		}else{
			sln.hide(300);
			if($(this).hasClass('on')){
				$(this).removeClass('showon');
			}else{
				$(this).removeClass('show');
			}
		}
	});
	
	
	$('.sub2 h3').click(function(){
		var sln = $(this).next('.sub3').length?$(this).next('.sub3'):$(this).next('.gsub');	
		if(sln.is(":hidden")){
			sln.show(300);
			if($(this).hasClass('on')){
				$(this).addClass('showon');
			}else{
				$(this).addClass('show');
			}
		}else{
			sln.hide(300);
			if($(this).hasClass('on')){
				$(this).removeClass('showon');
			}else{
				$(this).removeClass('show');
			}
		}
	});
	
	$('.sub3 h4').click(function(){
		var sln = $(this).next('.gsub');	
		if(sln.is(":hidden")){
			sln.show(300);
			if($(this).hasClass('on')){
				$(this).addClass('showon');
			}else{
				$(this).addClass('show');
			}
		}else{
			sln.hide(300);
			if($(this).hasClass('on')){
				$(this).removeClass('showon');
			}else{
				$(this).removeClass('show');
			}
		}
	});
	//左导航
}); 