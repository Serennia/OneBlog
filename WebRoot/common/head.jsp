<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String headpath = request.getContextPath();
	String head_basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ headpath + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if lt IE 9]>
<script
      type="text/javascript" src="<%=head_basePath%>js/html5.js">
</script>
<![endif]-->
	<style type="text/css">
#goTopBtn {
	bottom: 80px;
	cursor: pointer;
	height: 32px;
	position: fixed;
	right: 20px;
	width: 32px;
	background: url(<%=head_basePath%>images/returntop.png)
		no-repeat -32px 0px;
}

#goTopBtn:hover {
	background: url(<%=head_basePath%>images/returntop.png)
		no-repeat 0px 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	var navs=$("#nav a");
	var pn=window.location.pathname;
	for(var i=0;i<navs.length;i++){
		var href=$(navs[i]).attr("href");
		if(pn.indexOf(href)!=-1&&href!="/"){
			$(navs[i]).attr("id","nav_current");
		}
		else if(pn=="/"&&href==pn){
			$(navs[i]).attr("id","nav_current");
		}
		else{
			$(navs[i]).removeAttr("id");
		}
	}
});
// document.createElement("header");
// document.createElement("figure");
// document.createElement("aside");
// document.createElement("footer");
// document.createElement("section");
// document.createElement("article");
</script>
<!--[if IE 6]> <link href="<%=head_basePath%>css/ie.css" rel="stylesheet" type="text/css"> <![endif]-->
<!--[if IE 7]> <link href="<%=head_basePath%>css/ie.css" rel="stylesheet" type="text/css"> <![endif]-->
<!--[if IE 8]> <link href="<%=head_basePath%>css/ie.css" rel="stylesheet" type="text/css"> <![endif]-->
</head>
<body>
<!-- 页头 -->
<figure><p><a class="emails"  href="mailto:xuefei_fly@126.com" title="联系我"></a>
<a class="rssdy" target="_blank" href="/rss" title="rss订阅"></a>
欢迎光临本站，建议使用高版本浏览器浏览本站，支持显示器最低分辨率为1024*768，使用Chrome浏览器浏览效果最佳！
</p>
</figure>
<header>
 <img src="<%=head_basePath%>images/index/logo.jpg" alt="Remiel网站-Remiel个人博客" width="70" height="70"> 
  <h1><a href="http://www.yangqq.com/">Remiel个人博客网站</a></h1>
  <p>Remiel其特技为统辖神的幻视，所谓人们的梦、幻觉都属于其中，如先知们的「启示」，这在传递神的讯息时非常重要。另外雷米勒还是能操纵雷霆的天使。</p>
</header>
<nav id="nav">
     <ul>
       <li><a id="nav_current" href="/">网站首页</a></li>
        <li><a href="http://www.yangqq.com/download/"  title="个人博客">个人博客</a></li>
        <li><a href="http://www.yangqq.com/book/"  title="前言技术">前言技术</a></li>
        <li><a href="/jquery"  title="JQuery教程">JQuery教程</a></li>
        <li><a href="http://www.yangqq.com/newshtml5/" title="懒人特效">懒人特效</a></li>
        <li><a href="http://www.yangqq.com/jstt/"  title="技术探讨">技术探讨</a></li>
        <li><a href="/life"  title="繁星小筑">繁星小筑</a></li>
        <li><a href="/weibo" title="微博">微博</a></li>
        <li><a href="http://www.yangqq.com/news/jsex/"  title="关于我">关于我</a></li> 
        </ul>
</nav>
<div id="goTopBtn" style="display: none;"></div>
<script type=text/javascript>
		//返回首页
		function goTopEx(){
		    var obj=document.getElementById("goTopBtn");
		    function getScrollTop(){
		            return document.documentElement.scrollTop;
		        }
		    function setScrollTop(value){
		            document.documentElement.scrollTop=value;
		        }    
		    window.onscroll=function(){getScrollTop()>0?obj.style.display="":obj.style.display="none";};
		    obj.onclick=function(){
		        var goTop=setInterval(scrollMove,10);
		        function scrollMove(){
		                setScrollTop(getScrollTop()/1.1);
		                if(getScrollTop()<1)clearInterval(goTop);
		            }
		    };
		}
		goTopEx();
		var version = $.support.leadingWhitespace;
		if(version){
			$("#nav ul li").last().after('<li><a href="/love"  title="关于我和你">关于我和你</a></li>');
		}
	</script>
	
</body>
</html>