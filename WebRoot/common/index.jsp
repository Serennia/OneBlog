<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<title>Remiel个人网站</title>
<%@ include file="../base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="Remiel个人网站">
<meta name="description" content="Remiel个人网站">
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js"
	type="text/javascript" charset="utf-8"></script>
<link href="<%=basePath%>css/base.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/jqcloud/jqcloud.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>js/silder.js"></script>
 <script type="text/javascript" src="<%=basePath%>js/jqcloud/jqcloud-0.2.9.js"></script>
<script type="text/javascript">
$(function() {
	new slider({id:'slider'});
	  $.post(basepath + 'tags/loadtags', function(data){
		   $("#my_favorite_latin_words").jQCloud(data);
      }, 'json');
	});
</script>
</head>
<body>
	<%@ include file="head.jsp"%>
	<div class="article">
		<div class="content">
			<h3>
				<p>
					<span>推荐</span>文章 New Blog
				</p>
			</h3>
			<a href="http://www.yangqq.com/download/div/2013-08-08/571.html"
				target="_blank"><img src="<%=basePath%>images/index/xing.jpg"
				alt="黑色质感时间轴个人博客模板" title="黑色质感时间轴个人博客模板" class="topimg" width="315"
				height="205"></a>
			<ul class="topblog">
				<li><a href="http://www.yangqq.com/jstt/bj/2013-07-28/530.html"
					title="如果要学习web前端开发，需要学习什么？" target="_blank">如果要学习web前端开发，需要学习<span>遇到很多新手，都会问，如果要学习web前端开发，需...</span></a></li>
				<li><a href="http://www.yangqq.com/jstt/bj/2013-06-19/290.html"
					title="给个人博客增加色彩元素提升网站用户体验" target="_blank">给个人博客增加色彩元素提升网站<span>第一眼看到Remiel个人博客网站的时候，如果你喜欢，...</span></a></li>
				<li><a href="http://www.yangqq.com/jstt/bj/2013-06-18/285.html"
					title="如果个人博客网站再没有价值，你还会坚持吗？" target="_blank">如果个人博客网站再没有价值，你<span>个人博客现在的数量是越来越来多了，也有越来越多...</span></a></li>
			</ul>
			<h3>
				<p>
					<span>个人博客</span>模板 Templates
				</p>
			</h3>
			<ul class="template">

				<li><a
					href="http://www.yangqq.com/download/div/2013-08-08/571.html"
					title="灰原哀" target="_blank"><img
						src="<%=basePath%>images/index/1.jpg" alt="灰原哀"></a><span></span></li>

				<li><a
					href="http://www.yangqq.com/download/div/2013-07-19/394.html"
					title="灰原哀" target="_blank"><img
						src="<%=basePath%>images/index/2.jpg" alt="灰原哀"></a><span></span></li>

				<li><a
					href="http://www.yangqq.com/download/div/2013-07-14/378.html"
					title="灰原哀" target="_blank"><img
						src="<%=basePath%>images/index/3.jpg" alt="灰原哀"></a><span></span></li>

				<li><a
					href="http://www.yangqq.com/download/div/2013-07-13/375.html"
					title="灰原哀" target="_blank"><img
						src="<%=basePath%>images/index/4.jpg" alt="灰原哀"></a><span></span></li>
			</ul>
			<div class="tags">
				<section>
				<h2>
					<a href="http://www.yangqq.com/"></a><span>热点</span>专题
				</h2>
				<ul>
					<li><a href="http://www.yangqq.com/download/div/"
						target="_blank" title="个人博客模板">个人博客模板</a></li>
					<li><a href="http://www.yangqq.com/download/free/"
						target="_blank" title="国外html5模板">国外html5模板</a></li>
					<li><a href="http://www.yangqq.com/newshtml5/css3/"
						target="_blank" title="CSS3案例">CSS3案例</a></li>
					<li><a href="http://www.yangqq.com/newshtml5/css/"
						target="_blank" title="CSS3教程">CSS3教程</a></li>
					<li><a href="http://www.yangqq.com/newshtml5/study/"
						target="_blank" title="Html5教程">Html5教程</a></li>
					<li><a href="http://www.yangqq.com/newshtml5/t/"
						target="_blank" title="推荐工具">推荐工具</a></li>
				</ul>
				</section>
				<section>
				<h2>
					<a href="http://www.yangqq.com/"></a><span>热点</span>专题
				</h2>
				<ul>
					<li><a href="http://www.yangqq.com/news/s/" target="_blank"
						title="日记">日记</a></li>
					<li><a href="http://www.yangqq.com/news/read/" target="_blank"
						title="欣赏">欣赏</a></li>
					<li><a href="http://www.yangqq.com/news/life/" target="_blank"
						title="程序人生">程序人生</a></li>
					<li><a href="http://www.yangqq.com/news/humor/"
						target="_blank" title="短信祝福">短信祝福</a></li>
					<li><a href="http://www.yangqq.com/jstt/bj/" target="_blank"
						title="心得笔记">心得笔记</a></li>
					<li><a
						href="http://www.yangqq.com/jstt/div/2013-07-24/521.html"
						target="_blank" title="CSS简明教程">CSS简明教程</a></li>
					<li><a href="http://www.yangqq.com/news/jsex/" target="_blank"
						title="JS经典实例">JS经典实例</a></li>
					<li><a href="http://www.yangqq.com/web/" target="_blank"><b>建站流程</b></a></li>
				</ul>
				</section>
			</div>
			<h2 class="newt">
				<span>&#9825;</span>最新文章：<a
					href="http://www.yangqq.com/news/s/2013-11-22/622.html"
					title="抄袭门过后——丢掉心结，重拾自己" target="_blank"><strong>抄袭门过后——丢掉心结，重拾自己</strong></a>
			</h2>
			<div class="bloglist">
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
				
				
			</div>
		</div>
		<aside> <nav>
		<ul>
			<li class="aside1"><a href="http://www.yangqq.com/download/" target="_blank">关于我</a></li>
			<li class="aside2"><a href="http://www.yangqq.com/newsfree/" target="_blank">博客</a></li>
			<li class="aside3"><a href="http://www.yangqq.com/web/" target="_blank">碎言碎语</a></li>
			<li class="aside4"><a href="http://www.yangqq.com/newshtml5/" target="_blank">前沿技术</a></li>
			<li class="aside5"><a href="http://www.yangqq.com/jstt/" target="_blank">我的相册</a></li>
			<li class="aside6"><a href="http://www.yangqq.com/news/case/" target="_blank">留言板</a></li>
		</ul>
		</nav>
		   <div class="geyan">
    <ul id="slider" class="slider">  
  <li><a title="有些事儿是不能比赛的" href="/content/?375.html"  target="_blank">小时候，常听见小朋友们比赛谁的家长官儿最大；长大了，女同学们比赛谁最漂亮；再长大，女朋友们比赛谁的男友最出色...</a></li>  
  <li><a title="四川雅安市发生7.0级地震" href="/content/?369.html"  target="_blank">【最新伤亡】据民政部网站消息，截至20日21时，四川省雅安市芦山县7．0级地震已造成157人死亡，5700余...</a></li>  
  <li><a title="新增iweibo 平台" href="/content/?364.html"  target="_blank">网站新增一个iweibo平台，玩玩儿...
链接地址：http://www.yangqq.com/iwei...</a></li>  
  <li><a title="晚上十二点之前休息的，结果第二天两点才醒来，真服了自己..." href="/content/?363.html"  target="_blank">晚上十二点之前休息的，结果第二天两点才醒来，真服了自己......</a></li>  
  <li><a title="兴趣使然，让我在这一行混了那么久..." href="/content/?362.html"  target="_blank">从2011年建博客开始已经有三年了，虽然前期一直都没怎么管理，但是有兴趣依旧如初，还是让我在这一行混了那么久...</a></li>  
  <li><a title="生活规律" href="/content/?349.html"  target="_blank">生活越来越不规律了，一觉醒来就是2点了，吃完饭3点钟，研究研究代码，一晃神6点了......</a></li>  
  <li><a title="灰蒙蒙的天" href="/content/?344.html"  target="_blank">其实北方的空气还真的是越来越差了，今年4月份到天津后，就没有遇到过一次晴朗的天气，现在放眼过去，整个城市都陷...</a></li>  
  <li><a title="昨天都还几度，今天就飙到26°了，又没有春天了" href="/content/?342.html"  target="_blank">昨天都还几度，今天就飙到26&deg;了，又没有春天了
...</a></li>  
  <li><a title="清明" href="/content/?339.html"  target="_blank">前一段时间温度都很高，街上黑虫满天飞，张口就来，还好清明节这几天都阴天，下了好几场雨，温度降了些，消灭了好多...</a></li> 
 </ul>
   </div>  
		
<!-- 		<p class="sliderweibo"> -->
<!-- 			<a href="#"> <wb:follow-button uid="2735381233" type="red_3" -->
<!-- 					width="100%" height="24"></wb:follow-button> -->
<!-- 			</a> -->
			<iframe width="276px" height="550" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=10&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=2735381233&verifier=bbdef32b&dpc=1"></iframe>
<!-- 		</p> -->

		<div class="vcard">
			<a href="http://www.yangqq.com/about.html" target="_blank"
				title="Remiel个人档案"><img
				src="<%=basePath%>images/index/photo.jpg" alt="Remiel个人网站"
				class="photo" width="93" height="124"></a>
			<p class="fn">姓名：薛飞</p>
			<p class="nickname">网名：Remiel | Serennia</p>
			<p class="role">职业：java攻城狮</p>
			<p class="url">
				主页：<%=basePath%></p>
			<p class="address">现居：苏州市姑苏区</p>
		</div>
		<p class="qun">邮箱：xuefei_fly@126.com | tel: 18662250114</p>
		<div class="hotcomm">
			<h2>推荐个人博客模板</h2>
			<ul>
				<li><a
					href="http://www.yangqq.com/download/div/2013-06-08/173.html"
					title="Remiel个人博客模板（静态+asp整站源码+帝国模板）" target="_blank">Remiel个人博客模板（静态+asp整站源码+帝国模板）</a></li>
				<li><a
					href="http://www.yangqq.com/download/div/2013-07-19/394.html"
					title="Green绿色小清新的夏天-个人博客模板" target="_blank">Green绿色小清新的夏天-个人博客模板</a></li>
				<li><a
					href="http://www.yangqq.com/download/div/2013-06-18/286.html"
					title="花气袭人是酒香—个人网站模板" target="_blank">花气袭人是酒香—个人网站模板</a></li>
				<li><a
					href="http://www.yangqq.com/download/div/2013-06-16/283.html"
					title="吴硕个人主页" target="_blank">吴硕个人主页</a></li>
				<li><a
					href="http://www.yangqq.com/download/div/2013-06-21/296.html"
					title="时间煮雨-个人网站模板" target="_blank">时间煮雨-个人网站模板</a></li>
				<li><a
					href="http://www.yangqq.com/download/div/2013-07-03/345.html"
					title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
			</ul>
		</div>
		<div class="newbolg">
			<h2>
				<a href="http://www.yangqq.com/">热门文章</a>
			</h2>
			<ul class="rank">

				<li class="nh1"><i></i><a
					href="http://www.yangqq.com/download/div/2013-08-08/571.html"
					title="黑色质感时间轴html5个人博客模板" target="_blank">黑色质感时间轴html5个人博客模板</a></li>
				<li class="nh2"><i></i><a
					href="http://www.yangqq.com/download/div/2013-07-19/394.html"
					title="Green绿色小清新的夏天-个人博客模板" target="_blank">Green绿色小清新的夏天-个人博客模板</a></li>
				<li class="nh3"><i></i><a
					href="http://www.yangqq.com/download/div/2013-07-14/378.html"
					title="女生清新个人博客网站模板" target="_blank">女生清新个人博客网站模板</a></li>
				<li class="n4"><i></i><a
					href="http://www.yangqq.com/download/div/2013-07-13/375.html"
					title="Wedding-婚礼主题、情人节网站模板" target="_blank">Wedding-婚礼主题、情人节网站模板</a></li>
				<li class="n5"><i></i><a
					href="http://www.yangqq.com/download/div/2013-07-03/345.html"
					title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
				<li class="n6"><i></i><a
					href="http://www.yangqq.com/download/div/2013-07-02/344.html"
					title="with love for you 个人网站模板" target="_blank">with love for
						you 个人网站模板</a></li>
				<li class="n7"><i></i><a
					href="http://www.yangqq.com/download/div/2013-06-21/296.html"
					title="时间煮雨-个人网站模板" target="_blank">时间煮雨-个人网站模板</a></li>
				<li class="n8"><i></i><a
					href="http://www.yangqq.com/download/div/2013-06-18/286.html"
					title="花气袭人是酒香—个人网站模板" target="_blank">花气袭人是酒香—个人网站模板</a></li>
				<li class="n9"><i></i><a
					href="http://www.yangqq.com/download/div/2013-06-16/283.html"
					title="吴硕个人主页" target="_blank">吴硕个人主页</a></li>
				<li class="n10"><i></i><a
					href="http://www.yangqq.com/download/div/2013-06-16/282.html"
					title="有一种思念，是淡淡的幸福—个人网站模板" target="_blank">有一种思念，是淡淡的幸福—个人网站模板</a></li>
			</ul>
			<h2>
				<a href="http://www.yangqq.com/">标签</a>
			</h2>
<!-- 			<ul class="rank" id="tags"> -->
<!-- 			</ul> -->
			<div id="my_favorite_latin_words" style=" height: 350px; border: 1px solid #ccc;"></div>
		</div>
		</aside>
	</div>
	<%@ include file="foot.jsp"%>
	<!-- Baidu Button BEGIN -->



</body>
</html>