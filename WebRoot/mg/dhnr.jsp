<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
var setting = {
			async: {
				enable: true,
				url:"dhtree!select.action",
				autoParam:["id"],
				otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filter
			},
			callback: {
				//单击左键
				onClick: zTreeOnClick,
			}
		};
		
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		
		//单击事件
		function zTreeOnClick(event, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			treeObj.expandNode(treeNode);
			if(treeNode.isParent==false){
				var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='dnrup.action?id="+treeNode.id+"&dan="+treeNode.dan+"' style='width:100%;height:100%;'></iframe>";  
				if($("#tt").tabs("exists",treeNode.name)){
					closetabs(treeNode.name);
				}
				$("#tt").tabs('add',{
					title:treeNode.name,
					iconCls: 'icon-edit',
					fit:true,
					closable:true,
					content:contents,  
					cache:false
				});
			}
			
		};
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
</script>
<ul id="treeDemo" class="ztree"></ul>