<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%
	String footpath = request.getContextPath();
	String foot_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ footpath + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=foot_basePath%>css/remiel.css" rel="stylesheet" type="text/css">
<script src="<%=foot_basePath%>js/remiel.js"></script>
</head>
<body>
<footer>
<div class="fat">
     <section class="partner">
        <ul> 
         <h2>关于Remiel</h2>
         <p><a href="#" target="_blank">个人档案</a></p>
         <p><a href="#" target="_blank" rel="nofollow">给我留言</a></p><a href="http://www.yangqq.com/e/tool/gbook/?bid=1" target="_blank" rel="nofollow">
        </ul>
     </section>
      <section class="links">
         <h2>友情链接</h2>
  <ul>
<li><a href="http://www.csdn.net/" title="csdn" target="_blank">csdn</a></li>
<li><a href="http://http://www.oschina.net//" title="oschina" target="_blank">开源中国</a></li>
  </ul>
     </section>
      <section class="contact">
        <h2>fighting....</h2>
      </section>
   </div>  
<div id="copright">Design by Remiel  <a href="http://www.miitbeian.gov.cn/" target="_blank">苏ICP备xx号</a> 
</div>
</footer>
<div id="spig" class="spig">
    <div id="message">正在加载中……</div>
    <div id="mumu" class="mumu"></div>
</div>
</body>
</html>