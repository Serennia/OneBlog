<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../baseold.jsp" %>
    <link rel="stylesheet" href="<%=basePath %>resource/kindeditor/themes/default/default.css" />
    <script charset="utf-8" src="<%=basePath %>resource/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript">
var tree;
var jquerytree=LG.getSelectData(basepath+"jquery/getTree?view=jquery&idfield=id&pidfield=parentid&textfield=jname");
var jqueryData=null,jquerywin=null,jqueryAddNew;
$(document).ready(function(){
    //添加发表博文的大文本
    editor = KindEditor.create('input[id="content"]',
            {
    	resizeMode : 1,
		shadowMode : false,
		allowPreviewEmoticons : false,
		urlType : 'absolute',
		allowUpload : true, //允许上传图片
		height : "400px",
        uploadJson : basepath+'manager/KindUpload',
        afterCreate : function() {
            this.sync();
           }, 
        afterBlur:function(){
        	this.sync();}
            });
          //	editor.html(data.content);
      		  editor.focus();

});
$(function (){

	var menu = $.ligerMenu({ top: 100, left: 100, width: 120, items:
         [
         { text: '增加', click: f_add, icon: 'add' },
         { line: true },
         { text: '修改', click: f_modify , icon: 'modify'},
         { line: true },
         { text: '删除', click: f_delete , icon: 'delete'}
         ]
         });

      tree=   $(".l-tree").ligerTree({ onContextmenu: function (node, e) { 
            var  actionNodeID = node.data.text;
             menu.show({ top: e.pageY, left: e.pageX });
             return false;
         },
         data:jquerytree,
         checkbox: false,
  			onClick:function(node){
  				getcontent(node.data.id)
//         	 		alert(node.data.id);
       		  }
         
         
         }
      );
          var parm = function (jquerytree)
          {
              return jquerytree.id== '1';
          };
          tree.selectNode(parm);
          getcontent(1);
      function f_add(item, i)
      {
      	  var node = tree.getSelected();
      	  if(node==null){
          	  $.ligerDialog.warn("请选择节点","提示信息");
          	  return; 
      	  }
      	   showDetail({
      		   id:node.data.id,
      		   parentid:node.data.parentid,
      		   jname:''
      		   }, true);
//             var nodes = [];
//             nodes.push({ text: '节点名' });
//             if (node)
//                 tree.append(node.target, nodes); 
//             else
//                 tree.append(null, nodes);
//           alert(i + " | " + item.text);
      }
      function f_modify(item, i)
      {
    	  var node = tree.getSelected();
      	  if(node==null){
          	  $.ligerDialog.warn("请选择节点","提示信息");
          	  return; 
      	  }
      	  showDetail({
      		  id:node.data.id,
      		 parentid:node.data.parentid,
    		   jname:node.data.text
      				  }, false);
      }
      function f_delete(item, i)
      {
          alert(i + " | " + item.text);
      }
      var jqueryform = $("#form");
      function showDetail(data,isAddNew){
      	jqueryData=data;
      	jqueryAddNew = isAddNew;
      	if(jquerywin){
      		jquerywin.show();
      	}else{
      		jqueryform.ligerForm({
      			inputWidth : 150,
      			fields : [
      			          {
      				name : "id",
      				type : "hidden"
      			}	, 
      			{
      				name : "parentid",
      				type : "hidden"
      			},
      			{
      			    display : "节点名称",
      			    name : "jname",
      			    newline : true,
      			    labelWidth : 100,
      			    space : 30,
      			    type : "text",
      			    validate : {
      			        required : true
      			    }
      			}
      			
      			
      		],
      			toJSON : JSON2.stringify
      		}); 
      		jquerywin=$.ligerDialog.open({
      			target : $("#detail"),
      			width : 350,
      			title:"树维护",
      			height : 150,
      			buttons : [ {
      				text : '确定',
      				onclick : function() {
      					tree_save();
      				}
      			}, {
      				text : '取消',
      				onclick : function() {
      					jqueryData={};
      					jquerywin.hide();
      				
      				}
      			} ]
      		});
      	}
      	if (jqueryData) {
      		LG.loadDataForm(jqueryform,jqueryData);
      	}
      	
      	function tree_save(){
      		 jQuery.metadata.setType("attr", "validate"); 
			 LG.validate(jqueryform, { debug: true });
			 if(jqueryform.valid()){
					var jqueryData =  {};
					 jqueryData.id=$("#id").val();
					 jqueryData.parentid=$("#parentid").val();
					 jqueryData.jname=$("#jname").val();
						LG.ajax({
							loading : '正在保存数据中...',
							url: basepath+"jquery/"+(jqueryAddNew ? "insert"
									: "update"),
							data : jqueryData,
							success : function() {
								jquerywin.hide();
								LG.tip('保存成功!');
								tree.clear();
								tree.loadData(null, basepath+"jquery/getTree?view=jquery&idfield=id&pidfield=parentid&textfield=jname");
							},
							error : function(message) {
								LG.tip(message);
							}
						});
			 }
		
			}
      	
      }
      
      
	  $("#save_but").bind("click",function(){
		  var content=$("#content").val(); 
		  var id=$("#jid").val();
	      $.post(basepath+"jquery/updatecontent",{id:id,content:content},function(data){
	    	  alert(data.Message);
	    	  var parm = function (jquerytree)
	          {
	              return jquerytree.id== '1';
	          };
	          tree.selectNode(parm);
	          $("#jid").val(1);
	        }, 'json');
	  });
      
	  
	  
	  function getcontent(id){
		  var editorData=LG.getSelectData(basepath+"jquery/querycontent?id="+id);
		 	 editor.html(editorData.content==null?"":editorData.content);
	        $("#jid").val(id);
	  }
      
});

</script>
</head>
<body>
<div>
    <div style="width:200px; height:300px; border:1px solid #ccc; overflow:auto; clear:both;float: left;">
    <ul class="l-tree">
    </ul>
    </div>
    <div style="width: 800px;height: 800px;border:1px solid #ccc;float: left;margin-left: 10px;" id="contentdiv">
    	 <input name="content" id="content" type="text" size="50" maxlength="100"/>
    	 <input name="jid" id="jid" type="text" />
    	 <input  type="button" value="保存" class="l-button con_button1" id="save_but">
    </div>
</div>
   <div id="detail" style="display: none;">
 		<form id="form" method="post"> </form>
   </div>
</body>

</html>