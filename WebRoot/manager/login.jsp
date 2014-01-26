<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function refushcode(){
		var d = new Date();
		//为了避免服务器或者浏览器缓存，添加了一个额外的参数
		document.getElementById("safecode").src="${BASE_PATH}/au/img?t="+d.toString(40);
	}
   </script>
<img src="${BASE_PATH}/au/img" alt="点击刷新" style="padding-top: 7px;" id="safecode" onclick="refushcode();"/>
</body>
</html>