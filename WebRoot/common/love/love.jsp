<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remiel 爱</title>
<%@ include file="../../base.jsp"%>
<link href="<%=basePath%>css/love/default.css" type="text/css"
	rel="stylesheet"></link>
<script type="text/javascript" src="<%=basePath%>js/love/garden.js"></script>
<script type="text/javascript" src="<%=basePath%>js/love/functions.js"></script>
<style type="text/css">
@font-face {
	font-family: digit;
	src: url('<%=basePath%>css/love/digital-7_mono.ttf') format("truetype");
}

.aixin_hover {
	background: rgba(255, 255, 255, 0.2);
	-webkit-transform: rotate(360deg);
	-moz-transform: rotate(360deg);
	-o-transform: rotate(360deg);
	transform: rotate(360deg);  
}

.aixin {
	width: 160px;
	height: 200px;
	position: relative;
	margin: auto;
	display: block;
	transition: All 1s ease;
	-webkit-transition: All 1s ease;
	-moz-transition: All 1s ease;
	-o-transition: All 1s ease;
	cursor: pointer;
}

.aixin:before {
	content: " ";
	border: 0 solid transparent;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	border-radius: 100px 100px 0 0;
	width: 80px;
	height: 120px;
	background: #ff0000;
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	position: absolute;
	left: 20px;
}

.aixin:after {
	content: " ";
	border: 0 solid transparent;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	border-radius: 100px 100px 0 0;
	width: 80px;
	height: 120px;
	background: #ff0000;
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	position: absolute;
	left: 48px;
	top: 0px;
}
</style>
</head>
<body>
	<div id="mainDiv">
		<div id="content">
			<div id="code">
				<span class="comments">/**</span><br /> <span class="space" /><span
					class="comments">*${map.fromdate},</span><br /> <span
					class="space" /><span class="comments">*${map.todate}.</span><br />
				<span class="space" /><span class="comments">*/</span><br /> Boy
				name = <span class="keyword">Mr</span> Xue<br /> Girl name = <span
					class="keyword">Mrs</span> Sun<br /> <span class="comments">//
					Fall in love river. </span><br /> The boy love the girl;<br /> <span
					class="comments">// They love each other.</span><br /> The girl
				loved the boy;<br /> <span class="comments">// AS time goes
					on.</span><br /> The boy can not be separated the girl;<br /> <span
					class="comments">// At the same time.</span><br /> The girl can
				not be separated the boy;<br /> <span class="comments">//
					Both wind and snow all over the sky.</span><br /> <span class="comments">//
					Whether on foot or 5 kilometers.</span><br /> <span class="keyword">The
					boy</span> very <span class="keyword">happy</span>;<br /> <span
					class="keyword">The girl</span> is also very <span class="keyword">happy</span>;<br />
				<span class="placeholder" /><span class="comments">//
					Whether it is right now</span><br /> <span class="placeholder" /><span
					class="comments">// Still in the distant future.</span><br /> <span
					class="placeholder" />The boy has but one dream;<br /> <span
					class="comments">// The boy wants the girl could well have
					been happy.</span><br /> <br> <br> I want to say:<br /> Baby,
				I love you forever;<br />
			</div>
			<div id="loveHeart">
				<canvas id="garden"></canvas>
				<div id="words">
					<div id="messages">
						亲爱的，这是我们相爱在一起的时光。
						<div id="elapseClock"></div>
					</div>
					<div id="loveu">
						真爱永恒。<br />
						<div class="signature">- 阿加西</div>
					</div>
				</div>
			</div>
		</div>
		<div id="copyright"></div>
	</div>

	<script type="text/javascript">
		var together = new Date();
		together.setFullYear(2012, 10, 24);
		together.setHours(7);
		together.setMinutes(0);
		together.setSeconds(0);
		together.setMilliseconds(0);

		if (!document.createElement('canvas').getContext) {
			var msg = document.createElement("div");
			msg.id = "errorMsg";
			msg.innerHTML = "Your browser doesn't support HTML5!<br/>Recommend use Chrome 14+/IE 9+/Firefox 7+/Safari 4+";
			document.body.appendChild(msg);
			$("#code").css("display", "none");
			$("#copyright").css("position", "absolute");
			$("#copyright").css("bottom", "10px");
			document.execCommand("stop");
		} else {
			setTimeout(function() {
				startHeartAnimation();
			}, 5000);

			timeElapse(together);
			setInterval(function() {
				timeElapse(together);
			}, 500);
			adjustCodePosition();
			$("#code").typewriter();
			$("#copyright").append('<div class="aixin" title="The little drops of love"></div>');
		}
		$(function() {
			$(".aixin").hover(function() {
				$(this).addClass("aixin_hover");
			}, function() {
				$(this).removeClass("aixin_hover");
			});

		});
	</script>
</body>
</html>