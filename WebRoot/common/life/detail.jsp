<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生活是一种态度</title>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="../head.jsp"%>
	<article>
	<div id="index_about">
		<h1 class="c_titile">${life.title}</h1>
		<p class="box">
			发布时间：${life.createtime} 编辑： <a href="mailto:xuefei_fly@126.com">Remiel</a> 
<!-- 			我有话说(401人参与) -->
			 已被围观： <span>${life.clicks}次</span>
			
		</p>
		<ul>
			${life.content}
		</ul>
		
		

		
	</div>
	<%@ include file="../right.jsp"%>
	 </article>
	<%@ include file="../foot.jsp"%>
</body>
</html>