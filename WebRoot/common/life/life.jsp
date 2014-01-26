<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生活是一种态度</title>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function() {
		var lifename='${lifename}';
		if(lifename!=""){
			$(".newlist h2").append("> "+lifename);
		}
	});
</script>

</head>
<body>
	<%@ include file="../head.jsp"%>
	<article>
	<div class="newlist">
		<h2>
			<span> <a href="/life/个人随笔">个人随笔</a> <a href="/life/糗事百科">糗事百科</a>
				<a href="/life/生活娱乐">生活娱乐</a> <a href="/life/体育">体育</a><a href="/life/焦点新闻">焦点新闻</a>
			</span> 您当前的位置： <a href="/">首页</a> > <a href="/life">繁星小筑</a> 
		</h2>
		<ul>
				<c:forEach items="${lifelist}" var="life">
			<p class="ptit">
				<b> <a title="${life.title}" target="_blank"
					href="<%=basePath%>life/detail/${life.id}">${life.title}</a>
				</b>
			</p>
			<p class="ptime">发布时间：${life.createtime} 作者：Remiel 分类：个人随笔</p>
			<a title="${life.title}" target="_blank"
				href="<%=basePath%>life/detail/${life.id}"> <img class="imgdow"
				alt="${life.title}"
				src="${life.pic}">
			</a>
			<p class="pcon">
				 ${life.jianjie}
				  <a title="${life.title}" target="_blank"
					href="<%=basePath%>life/detail/${life.id}">详细信息</a>
			</p>
			<div class="line"></div>
			</c:forEach>

			
			
		</ul>
		<div class="page">
			<a title="Total record"><b>150</b></a><b>1</b> <a
				href="http://www.yangqq.com/newstalk/index_2.html">2</a>
		</div>
	</div>
	<%@ include file="../right.jsp"%>
	 </article>
	<%@ include file="../foot.jsp"%>
</body>
</html>