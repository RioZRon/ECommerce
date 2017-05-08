$(function(){
		  	
		    //关闭所有
		    $("#m-closeall").click(function(){
		        $(".tabs li").each(function(i, n){
		            var title = $(n).text();
		            $('#tt').tabs('close',title);    
		        });
		    });
		    
		    //除当前之外关闭所有
		    $("#m-closeother").click(function(){
		        var currTab = $('#tt').tabs('getSelected');
		        currTitle = currTab.panel('options').title;    
		        
		        $(".tabs li").each(function(i, n){
		            var title = $(n).text();
		            
		            if(currTitle != title){
		                $('#tt').tabs('close',title);            
		            }
		        });
		    });
		    
		    //关闭当前
		    $("#m-close").click(function(){
		        var currTab = $('#tt').tabs('getSelected');
		        currTitle = currTab.panel('options').title;    
		        $('#tt').tabs('close', currTitle);
		    });
			
			 /*为选项卡绑定右键*/
		    $(".tabs li").live('contextmenu',function(e){
		        
		        /* 选中当前触发事件的选项卡 */
		        var subtitle =$(this).text();
		        $('#tt').tabs('select',subtitle);
		        
		        //显示快捷菜单
		        $('#menu').menu('show', {
		            left: e.pageX,
		            top: e.pageY
		        });
		        
		        return false;
		    });
			
			var sessionadmin=$("#sessionadmin").val();
			if(sessionadmin=="老师"){
				$("#btna").attr('disabled',true);//设置disabled属性为true，按钮不可用 
			}
		
			$('a[ target="iframe"]').click(function(){
				var self=$(this);
				//判断是否存在tab，已经打开了，那么我们就选中这个打开的tab，否则新增tab
				if($("#tt").tabs("exists",self.text())){
					$("#tt").tabs("select",self.text());
					var tab=$("#tt").tabs('getSelected');
					$("#tt").tabs('update',{
						tab:tab
					});
				}else{
				var contents = "<iframe scrolling='no' frameborder='0'  src='"+self.attr("lang")+"' style='width:100%;height:100%;'></iframe>";  
					$("#tt").tabs('add',{
						title:self.text(),
						fit:true,
						closable:true,
						content:contents,  
						cache:false
					});
				}
			});
			
			
			$('button').click(function(){
				var self=$(this);
				if(sessionadmin=="老师"&&self.attr("id")=="btn_4"){
					alert("管理员才可使用用户管理功能！");
					return false;
				}
				//判断是否存在tab，已经打开了，那么我们就选中这个打开的tab，否则新增tab
				if($("#tt").tabs("exists",self.text())){
					$("#tt").tabs("select",self.text());
					var tab=$("#tt").tabs('getSelected');
					$("#tt").tabs('update',{
						tab:tab
					});
				}else{
				var contents = "<iframe scrolling='auto' frameborder='0'  src='"+self.attr("lang")+"' style='width:100%;height:100%;'></iframe>";  
					$("#tt").tabs('add',{
						title:self.text(),
						fit:true,
						closable:true,
						content:contents,  
						cache:false
					});
				}
			});
		});
		
			
		
		//弹出上传窗口
		function dias(lang,title){
		var contents = "<iframe id='sdsd' scrolling='no' frameborder='0'  src='mg/mgupload.jsp?id="+lang+"&title="+title+"' style='width:100%;height:100%;'></iframe>";  
			$('#dd').dialog({
			    title: '佐证材料上传',
			    width: 500,
			    height: 500,
			    cache: false,
			    maximizable:true,
			    modal: true,
			    content:contents
			});
			
		}
		
		//关闭上传窗口
		function closedias(){
			$('#dd').dialog('close');
			var contents = "<iframe scrolling='no' frameborder='0'  src='mg/trees.jsp' style='width:100%;height:100%;'></iframe>";  
			var tab=$("#tt").tabs('getSelected');
					$("#tt").tabs('update',{
						tab:tab,
						options : {
					       content : contents
					      }
					});
		}
		
		//弹出修改窗口
		function updatesz(e,num){
			var contents = "<iframe name='childs' id='childs' scrolling='no' frameborder='0'  src='mg/mgupword.jsp?ids="+e.id+"&num="+num+"' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists",e.type)){
				closetabs();
			}
			$("#tt").tabs('add',{
				title:e.type,
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
		}
		
		//新增数据窗口
		function insert(type){
			var contents = "<iframe name='childs' id='childs' scrolling='no' frameborder='0'  src='mg/mgword.jsp?type="+type+"' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists",type+"内容新增")){
				closetab();
			}
			$("#tt").tabs('add',{
				title:type+"内容新增",
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
		}
		
		function tables(e){
			var type=e.innerHTML;
			var contents = "<iframe name='childs' id='childs' scrolling='no' frameborder='0'  src='mg/mgtable.jsp?type="+type+"' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists","编辑"+type)){
				$("#tt").tabs("select","编辑"+type);
				var tab=$("#tt").tabs('getSelected');
				$("#tt").tabs('update',{
					tab:tab
				});
			}else{
				$("#tt").tabs('add',{
					title:"编辑"+type,
					iconCls: 'icon-edit',
					fit:true,
					closable:true,
					content:contents,  
					cache:false
				});
				
			}
		}
		
		function closetabs(type){
			$('#tt').tabs('close',type);
		}