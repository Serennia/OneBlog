<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../baseold.jsp" %>
   <script language="JavaScript" type="text/javascript"
            src="<%=basePath%>resource/jquery/jquery-1.5.2.min.js"></script>
    <link rel="stylesheet" href="<%=basePath %>resource/kindeditor/themes/default/default.css" />
    <script charset="utf-8" src="<%=basePath %>resource/kindeditor/kindeditor-min.js"></script>
    <style type="text/css">
         .rightDiv{float: left;border:  1px solid #cdcdcd;margin: 2px;width: 750px;min-width: 750px;height: 450px;padding: 50px;}
    </style>
</head>
<body>
<script type="text/javascript">
    var basePath = '<%=basePath%>';
    //覆盖本页面grid的loading效果
    LG.overrideGridLoading();

    //表单底部按钮
    LG.setFormDefaultBtn(f_cancel, f_save);

    function f_save()
    {
    	var content=$("#content").val();
    	if($("#id").val()==""){
  	      $.post(basePath+"weibo/add",{content:content},function(data){
  	    		if(data.weibo){
  		  			$("#contentMsg").html(data.contentMsg);
  		  		}
  	    		else if(data.IsError){
  	                alert(data.Message);
  	            }else{
  	                var win = parent || window;
  	                win.LG.showSuccess(data.Message, function () {
  	                    win.LG.closeAndReloadParent(null, "weibo");
  	                });
  	            }
  	        }, 'json');
  	}else{
  	  $.post(basePath+"weibo/modify",{id:$("#id").val(),content:content},function(data){
  		  	if(data.weibo){
  		  		$("#contentMsg").html(data.contentMsg);
  		  	}
  	  		else if(data.IsError){
                alert(data.Message);
            }else{
                var win = parent || window;
                win.LG.showSuccess(data.Message, function () {
                    win.LG.closeAndReloadParent(null, "weibo");
                });
            }
        }, 'json');
  	}
  
        
    }
    function f_cancel()
    {
        var win = parent || window;
        win.LG.closeCurrentTab(null);
    }
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
            uploadJson : basePath+'manager/KindUpload',
            afterCreate : function() {
                this.sync();
               }, 
            afterBlur:function(){
            	$("form p").html("");
            	this.sync();}
                });
        var id=$("#id").val();
        if(id!=null&&id!=''){
            $.post(basepath + 'weibo/to_modify', {id:id}, function(data){
              	editor.html(data.content);
            }, 'json');
            editor.focus();
        }
  
  
    
    });
</script>
<form enctype="multipart/form-data"  method="post" >
	<input type="hidden" value="<%=request.getParameter("id")==null?"":request.getParameter("id")%>" id="id"/>
	<div class="rightDiv">
	<p id="contentMsg" class="validate_p">${contentMsg}</p>
 		 <input name="weobo.content" id="content" type="text" size="50" maxlength="100"/>
	</div>
</form>
</body>
</html>