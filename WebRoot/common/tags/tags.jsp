<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贴上一个标签  ，记录一种生活</title>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function() {
	    var everypage_count = 5;
	    function createPagination(current_page, sum_count) {
	        $("#pagination").pagination(sum_count, {
	            num_edge_entries: 3,
	            num_display_entries: 4,
	            items_per_page: everypage_count,
	            maxentries:sum_count,
	            next_text: '下一页',
	            prev_text: '上一页',
	            current_page: current_page,
	            callback: pageselectCallback
	        });
	    }
		
	    function pageselectCallback(current_page, jq){
	    	window.location.href =window.location.pathname+"?pageIndex="+current_page;
	    	return false;
	    }
	    //添加分页
	    createPagination('${map.pageIndex}' , '${map.sum_count}');
	});
</script>

</head>
<body>
${map}
	<%@ include file="../head.jsp"%>
	<article>
	<div class="bloglist" style="width: 700px;float: left;">
<!-- 				<h2> -->
<!-- 					<a title="抄袭门过后——丢掉心结，重拾自己" -->
<!-- 						href="http://www.yangqq.com/news/s/2013-11-22/622.html" -->
<!-- 						target="_blank"><strong>抄袭门过后——丢掉心结，重拾自己</strong></a> -->
<!-- 				</h2> -->
<!-- 				<ul> -->
<!-- 					<p>那仅有的一次抄袭被识破后，虽然我后来不断的努力写好的文章，在教育报刊杂志投稿并发表，但总被盖上了可能是抄袭的帽子。我怨老师的毫不留 -->
<!-- 						情，更多的是怨自己至今还放不下。如果我本身作文水平就一般，不会经常被当范文，不那么骄傲，我就不会摔得很惨， -->
<!-- 						实在想不出的话题，哪怕写得再糟，也不会抄袭别人的作品......</p> -->
<!-- 					<p class="readmore"> -->
<!-- 						<a title="抄袭门过后——丢掉心结，重拾自己" -->
<!-- 							href="http://www.yangqq.com/news/s/2013-11-22/622.html" -->
<!-- 							target="_blank">阅读全文&gt;&gt;</a> -->
<!-- 					</p> -->
<!-- 					<p class="dateview"> -->
<!-- 						<span>2013-11-22</span><span>作者：Remiel</span><span>个人博客分类：[<a -->
<!-- 							href="http://www.yangqq.com/news/s/">随笔</a>] -->
<!-- 						</span> -->
<!-- 					</p> -->
<!-- 				</ul> -->
	<c:forEach items="${lifelist}" var="life">
				<h2>
					<a title="${life.title}"
						href="<%=basePath%>life/detail/${life.id}"
						target="_blank"><strong>${life.title}</strong></a>
				</h2>
				<ul>
					<p>${life.jianjie}</p>
					<p class="readmore">
						<a title="${life.title}"
							href="<%=basePath%>life/detail/${life.id}"
							target="_blank">阅读全文&gt;&gt;</a>
					</p>
					<p class="dateview">
						<span>${fn:split(life.createtime," ")[0]}</span><span>作者：Remiel</span><span>个人博客分类：[<a
							href="<%=basePath%>tags/${life.tags}">${life.tags}</a>]
						</span>
					</p>
				</ul>
	</c:forEach>
		<div class="page">
			<a title="Total record"><b>150</b></a><b>1</b> <a
				href="http://www.yangqq.com/newstalk/index_2.html">2</a>
		</div>
		
		<div id="pagination" class="pagination" style="float:right;margin-top:10px;"></div>
	</div>
	<%@ include file="../right.jsp"%>
	 </article>
	<%@ include file="../foot.jsp"%>
</body>
</html>