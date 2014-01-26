(function(window, undefined) {
	window.common = {
		showReplay : function(obj) {
			if (!$(obj).parents('li').next('div').length
					|| $(obj).parents('li').next('div').is(":visible")) {
				return;
			}
			$(obj).parents('li').next('.reply_div').show("normal");
		},
		closeReplay : function(obj) {
			if (!$(obj).parents('.weibo_div1').length
					|| $(obj).parents('li').next('div').is(":visible")) {
				return;
			}
			$(obj).parents('.reply_div').hide("normal");
		},
		validatereply : {
			/** *校验表单的方法**** */
			validate_content : function( id) {
				var text = $("#content_"+id).val();
				if (text == "" || text == null) {
					$("#label_content_" + id).html("回复不能为空");
					return false;
				} else {
					$("#label_content_" + id).html("");
					return true;
				}
			},
			validate_name : function(id) {
				var text = $("#name_"+id).val();
				if (text == "" || text == null) {
					$("#label_name_" + id).html("昵称不能为空");
					return false;
				} else {
					$("#label_name_" + id).html("");
					return true;
				}
			}
		},
		reply : function(obj) {
			var id=$(obj).attr("id");
			for ( var valida in this.validatereply) {
				var def = this.validatereply[valida]();
				if (def != null && !this.validatereply[valida](id)) {
					alert("请仔细检查你的数据录入是否完整？");
					return;
				}
			}
			var content=$("#content_"+id).val();
			var name=$("#name_"+id).val();
	        $.post(basepath + 'weibo/addReply', {content:content,name:name,weibo_id:id}, function(data){
	        	alert(data.Message);
	        	$(".weibo_div1 textarea").val("");
	        	$(".weibo_div1 input[type=text]").val("");
	        	$("#b_"+id).html("回复("+data.num+")");
	        	$(obj).parents('.reply_div').find("#reply_list").append(common.list.weibo_reply(data.reply));
	        }, 'json');
			
		},
		list:{
			weibo_reply:function(data){
				var reply=['<li>',
								'<a  id="reply_a1"><img src="'+baseUrl+data.headpic+'" width="50px;" height="50px;"/></a>',
								'<div><a id="reply_a2">',data.name,' : </a><span>',data.content,'</span></div>',
							'</li>'
				           ].join("");
				return reply;
			}
		}

	};
})(window);
