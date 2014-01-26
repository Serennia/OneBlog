<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String baseUrl=request.getScheme() + "://"
			+ request.getServerName() 
			+ path ;
%>
<script src="<%=basePath%>jslib/jquery-1.9.1.min.js"></script>
<script type="text/javascript" language="JavaScript" src="<%=basePath %>resource/juicer/juicer.js"></script>
  <link href="<%=basePath %>resource/css/pagination.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="<%=basePath %>resource/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
	var basepath = '<%=basePath%>';
	var baseUrl = '<%=baseUrl%>';
</script>