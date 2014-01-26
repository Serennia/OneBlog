<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery教程</title>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/jquerytab.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	$(function() {
		$(".hover ul li").hover(function() {
			$(this).children("dl").slideDown(300);
		}, function() {
			$(this).children("dl").slideUp(100);
		});
		
		
		$("#content a").click(function(){
				var id=this.id;
				var previd=0;
				var nextid=0;
				if($(this).parent('dd').prev('dd').length>0){
					previd=$(this).parent('dd').prev('dd').children('a').attr("id");
				}
				if($(this).parent('dd').next('dd').length>0){
					nextid=$(this).parent('dd').next('dd').children('a').attr("id");
				}
		       $.post(basepath + 'jquery/loadContent', {id:id,previd:previd,nextid:nextid}, function(data){
				  	$(".zuoji").html(data.j.content);
				      	var first= typeof(data.p)== "undefined"?"已经没有上一篇了":'上一篇：'+'<a id="'+data.p.id+'">'+data.p.jname+'</a>';
				      	$(".nextinfo p").first().html(first);
				    	var last= typeof(data.n)== "undefined"?"已经是最后一篇":'下一篇：'+'<a id="'+data.n.id+'">'+data.n.jname+'</a>';
				       	$(".nextinfo p").last().html(last);
				    if(previd!=0||nextid!=0){
				      	$(".otherlink").html('<h2></h2>');
		    	   }
		       }, 'json');
		       $("#jquery_tab").text(this.innerHTML);
			});
		
		  $(".nextinfo p").delegate("a","click",function(){
			  var id=this.id;
			  var a_s=$("#content dl dd a");
			  for(var j=0,k=a_s.length;j<k;j++){
				  if(a_s[j].id==id)
					  a_s[j].click();
			  }
		  });
		
		
		
	});

</script>
</head>
<body>
	<%@ include file="../head.jsp"%>
<article>
	<div id="index_about">
		<h2>
		 您当前的位置： <a href="/">首页</a> > <a class="nohand">JQuery教程</a>  > <a  class="nohand" id="jquery_tab">带你认识Jquery</a>
		</h2>
	
		<div id="content">
			<div class="main_nav hover">
				<ul>
				<c:forEach items="${tempTree}" var="tree">
					<li>
						<c:if test="${tree.parentid==0}">
							<a id="${tree.id}">${tree.text}</a>
						</c:if>
					
						<dl>
							<c:forEach items="${tree.children}" var="c">
								<dd><a id="${c.id}">${c.text}</a></dd>
							</c:forEach>
						</dl>
					</li>
			 </c:forEach>
				</ul>
			</div>

		</div>
	<ul class="zuoji">
	${jquery.content}
	</ul>
<!-- 	<div class="biaoqian"> -->
<!-- 		<p><span>标签:</span></p> -->
<!-- 	</div> -->
	<div class="otherlink"></div>
	<div class="nextinfo">
		<p></p>
		<p></p>
	</div>
</div>
	<%@ include file="../right.jsp"%> 
</article>
	<%@ include file="../foot.jsp"%>
</body>
</html>