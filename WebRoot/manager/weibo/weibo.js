	 var grid;
$(function(){
	//列表结构
	grid= $("#maingrid")
			.ligerGrid(
					{
						columns : [ {
							display : "发布时间",
							name : "createtime",
							width : 200,
							type : "text",
							align : "left"
						}, {
							display : "内容",
							name : "content",
							width : 850,
							type : "textarea",
							align : "left"
						}
						],
						dataAction : 'server',
						pageSize : 20,
						toolbar : {},
						url : basepath+'weibo/gridweibo',
						sortName : 'id',
						width : '98%',
						height : '100%',
						heightDiff : -10,
						delayLoad:true,
						rownumbers: true,
						checkbox : true
					});
  $("#formsearch").ligerForm({
	   fields:[
	           {display:"内容",name:"content",newline:false,labelWidth:100,width:220,space:30,type:"text",cssClass:"field",attr: { op: "like" }}
	           ],
	   toJSON: JSON2.stringify
  });
		grid.loadData(true);
	//增加查询/重置按钮,并创建事件
		LG.appendSearchButtons("#formsearch", grid); 
	//加载toolbar
	LG.loadToolbar(grid, toolbarBtnItemClick);

	//工具条事件
	function toolbarBtnItemClick(item) {
		switch (item.id) {
		case "add":
			f_detail();
			break;
		case "modify":
			var selected = grid.getSelected();
			if (!selected) {
				LG.tip('请选择行!');
				return
			}
			f_detail(selected);
			break;
		case "delete":
			var selected = grid.getSelected();
			if (selected) {
				jQuery.ligerDialog.confirm('确定删除吗?', function(confirm) {
					if (confirm)
						f_delete(selected);
				});
			} else {
				LG.tip('请选择行!');
			}
		
			break;
		case "view":
			var selected = grid.getSelected();
			if (!selected) {
				LG.tip('请选择行!');
				return
			}
			break;
		}
		
	}
	function f_reload(selected) {
		grid.loadData();
	}

	function f_detail(selected){
		if(typeof(selected) == "undefined"){
			top.f_addTab(null, '新增微博',
	        		basepath+'manager/weibo/add.jsp');
		}else{
			top.f_addTab(null, '修改微博',
	        		basepath+'manager/weibo/add.jsp?id='+selected.id);
		}
		
		 
	}
	
	function f_delete(selected){
			LG.ajax({
				url:basepath+'weibo/delete',
				loading : '正在删除中...',
				data : {
					id : selected.id
				},
				success : function(data,message) {
					LG.showSuccess(message);
					f_reload();
				},
				error : function(message) {
					LG.showError(message);
				}
			});
		
	
	}

});



