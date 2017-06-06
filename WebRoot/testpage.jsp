<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="css/examination_cs.css" />
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'qaction!showQuestionsList.action',
			type:'post',
			data:{"did" : '${did}',
				  "hnid" : '${id}'},
			dataType:'json',
			success:function(data){
				$(".q_table").html("");
				var countscore=0;
				var countquestion=0;
				$.each(data,function(index,value){
					countscore =parseInt(countscore) + parseInt(value.score);
					var html="<tr><td><li class='q_li'><div>";
					html+="<div id='alert_"+(index+1)+"' class='alert alert-info' style='margin:20px 20px 10px 20px;font-size:17px;padding:5px 5px 5px 5px' role='alert'>"+(index+1)+"、"+value.title+"（"+value.score+"分"+value.type+"）</div>";
					html+="<button type='button' class='tips btn btn-default' data-trigger='focus' data-toggle='popover' data-placement='top' data-content='答案："+value.answer+"' style='display:none;width:80px;height:30px;margin-right:60px;'>查看答案</button>";
					if(value.type=="选择题"||value.type=="多选题"){
						html+="<ul>";
						var s=value.choise.split("|");
						if(value.type=="选择题"){
							html+="<div>";
							for(var i=1;i<=s.length;i++){
								html+="<li><input type='radio' name='q_"+(index+1)+"' value='"+String.fromCharCode((64+i))+"' >"+String.fromCharCode((64+i))+"、"+s[i-1]+"</input></li>";
							}
							html+="</div>";
						}else if(value.type=="多选题"){
							html+="<div>";
							for(var i=1;i<=s.length;i++){
								html+="<li><input type='checkbox' name='q_"+(index+1)+"' value='"+String.fromCharCode((64+i))+"' >"+String.fromCharCode((64+i))+"、"+s[i-1]+"</input></li>";
							}
							html+="<div>";
						}
						html+="</ul>";
					}else{
						html+="<div style='padding:0px 30px 0px 12px;'>";
						html+="<textarea id='input_"+(index+1)+"' name='q_"+(index+1)+"' style='width:100%;height:100px;margin:10px;border-radius:10px;'></textarea>";
						html+="<div>";
					}
					html+="<input type='hidden' id='qanswer_"+(index+1)+"' value='"+value.answer+"' /><input type='hidden' id='answer_"+(index+1)+"' /><input type='hidden' id='score_"+(index+1)+"' value="+value.score+" />";
					html+="</div></li></td></tr>";
					$(".q_table").append(html);
					countquestion +=1;
				});
				$("#score").html("共有"+countquestion+"道题，总分："+countscore);
				$("[data-toggle='popover']").popover();
			}
		});
	});
	
	
	//提交评分
	function sub(){
		var countscore =0;//得分计数器
		var q=$(".q_li");
		for(var i=1;i<=q.length;i++){
			var r=$("[name='q_"+i+"']");
			if(r.length==1){		//如果是textarea元素
				$("#answer_"+i).val(r[0].value);
				countscore =parseInt(countscore) + parseInt(getscore(i,r[0].value));
			}else{					//如果是radio或者checkbox元素
				var value="";
				for(var j=0;j<r.length;j++){
					if(r[j].checked){
						value +=r[j].value;
					}
 				}
				$("#answer_"+(i)).val(value);
				countscore =parseInt(countscore) + parseInt(getscore(i,value));
			}
		}
		alert("你的得分："+countscore+"！");
	}
	
	
	//检测答案对错并计算得分
	function getscore(index,answer){
		var score=$("#score_"+index).val();
		var qanswer=$("#qanswer_"+index).val();
		if(answer==qanswer){
			$('.tips').eq(index-1).css("display","none");
			$("#alert_"+index).removeClass("alert-info");
			$("#alert_"+index).removeClass("alert-danger");
			$("#alert_"+index).addClass("alert-success");
			return score;
		}else{
			$('.tips').eq(index-1).css("display","block");
			$("#alert_"+index).removeClass("alert-info");
			$("#alert_"+index).removeClass("alert-success");
			$("#alert_"+index).addClass("alert-danger");
		}
		return 0;
		
	}
	
	//查看答案
	function showaswer(index){
		var s=$("#qanswer_"+index).val();
		alert("第"+index+"题答案："+s);
	}
</script>
</head>
<body>
	<div id="test_page" class="white_content panel panel-default" data-toggle="panel" >
		<div class="panel-heading" style="width:50%;margin:0 auto; padding:10px; position:fixed; top:15%; z-index: 9999;">随堂测试  &nbsp;&nbsp;<span id="score" style="font-size:10px;line-height: 5px;"></span><button type="button" class="close" data-dismiss="panel" onclick="$('.black_overlay,.white_content').fadeToggle(1000)" style="margin-right:20px" ><strong>&times;</strong></button></div>
		<div class="panel-body" style=" margin-top: 30px;">
			<form  id="examination_form" method="get">
				<ul>
					<table class="q_table">
					</table>
				</ul>
				<div style="width:100%;text-align: center;">
				<div  class="btn-group" style="width:150px;margin:10px;">
					 <input type="button" class="btn btn-default" value="提交" style="width:50%;height:100%;" onclick="sub()">
					 <input type="reset"  class="btn btn-default" value="重新测试" style="width:50%;height:100%;"onclick="$('.alert-danger').addClass('alert-info').removeClass('alert-danger');$('.tips').css('display','none');">
				</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
