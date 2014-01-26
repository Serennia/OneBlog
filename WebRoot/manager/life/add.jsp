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
        <script type="text/javascript" src="<%=basePath %>resource/jquery.form.js"></script>
        <script src="<%=basePath %>resource/uploadify/jquery.uploadify-3.1.min.js"
	type="text/javascript"></script>

<link href="<%=basePath %>resource/uploadify/uploadify.css" type="text/css"
	rel="stylesheet" />
    <style type="text/css">
/*          .rightDiv{float: left;border:  1px solid #cdcdcd;margin: 2px;width: 750px;min-width: 750px;height: 450px;padding: 50px;} */
	table{margin: 20px;}
	table tr{height: 50px;}
	table input{height: 30px;}
	.center{width: 960px;text-align: center;margin-left: auto;margin-right: auto}
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
    	$(".validate_p").html("");
    	var url= basePath + "life/save";
    	if($("#id").val()!=""){
    		url=basePath + "life/modify";
  		}
    	   $("#lifeform").ajaxSubmit({
               type: 'post',
               url: url ,
               dataType:"json",
               contentType: "application/x-www-form-urlencoded; charset=utf-8",
               success: function(data){
            	if(data.life){
            		$("#titleMsg").html(data.titleMsg);
      		  		$("#contentMsg").html(data.contentMsg);
      		  	}
               else if(data.IsError){
	                alert(data.Message);
	            }else{
	                var win = parent || window;
	                win.LG.showSuccess(data.Message, function () {
	                    win.LG.closeAndReloadParent(null, "life");
	                });
	            }
               }
           });
        
    }
    function f_cancel()
    {
        var win = parent || window;
        win.LG.closeCurrentTab(null);
    }
    $(document).ready(function(){
    	 $("#uploadify").uploadify({
 	    	'height'        : 27, 
 	    	'width'         : 80,  
 	    	'buttonText'    : '浏 览',
 	        'swf'           : basePath+'resource/uploadify/uploadify.swf',
 	        'uploader'      :  basePath+'manager/uploadfile',
 	        'langFile'      : basePath+"resource/uploadify/language_cn.js",
 	        'fileSizeLimit':'10MB',//限制上传文件最大单位
 	        'queueSizeLimit':'1',//限制队列只能一次上传5个
 	        'fileObjName': 'uploadify',
 	        'auto'          : false,//是否选取文件后自动上传   
 	        'multi': true,//是否支持多文件上传
 	         ' fileTypeDesc':'上传文件支持的文件格式:jpg,jpge,png',
              'fileTypeExts':'*.jpg;*.jpge;*.png',
             	 'formData'      : {'photoAlbumId':''},
 			        'onUploadStart' : function(file) {
 			        	$("#uploadify").uploadify("settings", "formData");
 			        },
 			        //返回一个错误，选择文件的时候触发
 			        'onSelectError':function(file, errorCode, errorMsg){
 			            switch(errorCode) {
 			                case -100:
 			                	alertDialog("上传的文件数量已经超出系统限制的"+$('#uploadify').uploadify('settings','queueSizeLimit')+"个文件！");
 			                    break;
 			                case -110:
 			                	alertDialog("文件 ["+file.name+"] 大小超出系统限制的"+$('#uploadify').uploadify('settings','fileSizeLimit')+"大小！");
 			                    break;
 			                case -120:
 			                	alertDialog("文件 ["+file.name+"] 大小异常！");
 			                    break;
 			                case -130:
 			                	alertDialog("文件 ["+file.name+"] 类型不正确！");
 			                    break;
 			            }
 			        },
 			        //检测FLASH失败调用
 			        'onFallback':function(){
 			        	alertDialog("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
 			        },
 			       onUploadSuccess : function(file, data, response) {
 			    	   $("#pic").val(data);
 			    	   $("#pic_img").attr("src",data);
 			        }
 	    });
    	
    	
    	
    	
    	
    	
    	
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
            	this.sync();}
                });
        var id=$("#id").val();
        if(id!=null&&id!=''){
            $.post(basepath + 'life/to_modify', {id:id}, function(data){
              	editor.html(data.content);
              	$("#title").val(data.title);
              	$("#type").val(data.type);
              	$("#source").val(data.type);
              	$("#sourceurl").val(data.sourceurl);
              	$("#tags").val(data.tags);
              	$("#pic").val(data.pic);
            	$("#pic_img").val(data.pic);
            }, 'json');
            editor.focus();
            
        }
  
  
    
    });
</script>
<form   method="post"  id="lifeform">
	<input type="hidden" value="<%=request.getParameter("id")==null?"":request.getParameter("id")%>" id="id" name="life.id"/>
	<div class="center" align="center">
	<table align="center">
		<tr>
			<td style="width:50px">标题</td><td><input type="text" size="100px;" name="life.title" id="title"></td><td id="titleMsg" class="validate_p">${titleMsg}</td>
		</tr>
		<tr>
			<td style="width:50px">类型</td><td ><select  name="life.type" id="type"><option value="1">个人随笔</option><option value="2">技术前沿</option><option value="3">生活娱乐</option><option value="4">实时动态</option></select></td>
		</tr>
		<tr>
			<td style="width:50px">来源</td><td ><select  name="life.source" id="source"><option value="1">Remiel原创</option><option value="2">网络转载</option></select></td>
		</tr>
		<tr>
			<td style="width:50px">来源地址</td><td ><input type="text" size="100px;" name="life.sourceurl" id="sourceurl"/></td><td></td>
		</tr>
		<tr><td style="width:50px">文章配图</td><td ><input type="text" size="100px;"name="life.pic"  id="pic" readonly="readonly"/><td></td></tr>
		<tr><td colspan="2"><img src="" id="pic_img" width="150px;" height="150px;"></td></tr>
		
		<tr><td style="width:50px">标签</td><td ><input type="text" size="100px;" name="life.tags" id="tags"/></td><td></td></tr>
		<tr>
			<td colspan="2"><input type="file" size="100px;"name="uploadify" id="uploadify" />
				<hr> <a
						href="javascript:$('#uploadify').uploadify('upload','*')">开始上传</a>&nbsp;
						<a href="javascript:$('#uploadify').uploadify('cancel', '*')">取消所有上传</a>
			</td>
		</tr>
		<tr><td colspan="2"></td></tr>
		<tr>
			<td style="width:50px">内容</td><td> <input name="life.content" id="content" type="text" size="50" maxlength="100"/></td><td id="contentMsg" class="validate_p">${contentMsg}</td>
		</tr>
	</table>
	</div>
 		
</form>
</body>
</html>