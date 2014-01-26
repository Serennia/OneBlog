<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnc" uri="/WEB-INF/tlds/fnc.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微博-Remiel个人网站</title>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>js/common.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$(".moodlist b").bind("click", function() {
			common.showReplay(this);
		});
		$(".weibo_div1 span").bind("click", function() {
			common.closeReplay(this);
			$(".weibo_div1 label").html("");
		});
		$(".weibo_div1 input[type=button]").bind("click", function() {
			common.reply(this);
		});
		
	});
</script>
</head>
<body>
	<%@ include file="../head.jsp"%>
	<article>
	<div class="moodlist">
		<ul >
			<c:forEach items="${weiboList}" var="weibo">
				<li><a > ${weibo.content} </br> <span>${weibo.createtime}</span>
						<span style="float: right;"><b id="b_${weibo.id}">回复(${weibo.num})</b></span>
					</a>
				</li>
			<div style="display: none;" class="reply_div">	
				<ul id="reply_list">
					<c:forEach items="${weibo.childrens}" var="c">
						<li>
							<a id="reply_a1"><img src="<%=baseUrl%>${c.headpic}" width="50px;" height="50px;"/></a>
							<div><a id="reply_a2">${c.name} : </a><span>${c.content}</span></div>
						</li>
					</c:forEach>
				</ul>
				<div class="weibo_div1">
						<textarea  onblur="common.validatereply.validate_content('${weibo.id}')" id="content_${weibo.id}"></textarea>
						<label id="label_content_${weibo.id}"></label>
						<div class="weibo_div2">
							昵称：<input type="text" onblur="common.validatereply.validate_name('${weibo.id}')" id="name_${weibo.id}" class="weibo_text"/>
								  <input type="button" value="发表" id="${weibo.id}" class="weibo_button"/>
						</div>
						<label id="label_name_${weibo.id}"></label>
						</br>
						<span ><img src="<%=basePath%>images/close.png" /></span>
				</div>
			</div>
			</c:forEach>
		</ul>
		<div class="page">
			<a title="Total record"><b>150</b></a><b>1</b><a
				href="http://www.yangqq.com/newstalk/index_2.html">2</a><a
				href="http://www.yangqq.com/newstalk/index_3.html">3</a><a
				href="http://www.yangqq.com/newstalk/index_4.html">4</a><a
				href="http://www.yangqq.com/newstalk/index_5.html">5</a><a
				href="http://www.yangqq.com/newstalk/index_2.html">&gt;</a><a
				href="http://www.yangqq.com/newstalk/index_6.html">&gt;&gt;</a>
		</div>
	</div>
	<%@ include file="../right.jsp"%> </article>
	<%@ include file="../foot.jsp" %>
</body>
</html>