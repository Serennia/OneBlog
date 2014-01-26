package com.oneblog.weibo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.oneblog.utils.BaseUtils;

public class WeiboController  extends Controller{
	public static final WeiboReply WeiboReplyDao = new WeiboReply();
	public void index() {
		String sql="select w.id,w.content,date_format(w.createtime,'%Y-%m-%d %H:%i:%s')createtime , " +
				"( select count(*) from weibo_reply  where weibo_id=w.id)num from weibo w " +
				" order by id desc ";
		List<Weibo> weibolist=Weibo.dao.find(sql);
		for (Weibo weibo : weibolist) {
			List<WeiboReply> list=WeiboReplyDao.find("select * from weibo_reply where weibo_id=?",weibo.getLong("id"));
//			weibo.setChildrens(list);
//			System.out.println(weibo.getChildrens());
			weibo.put("childrens", list);
		}
		setAttr("weiboList", weibolist);
		System.out.println(weibolist);
		render("/common/weibo/weibo.jsp");
	}
	public void getWeiboReply(Long id) {
		List<WeiboReply> WeiboReply=WeiboReplyDao.find("select * from weibo_reply where weibo_id=?",id);
		System.out.println(WeiboReply.toString());
		setAttr("WeiboReply", WeiboReply);
		renderJson();
	}
	
//	public void weibo(){
//		redirect("/weobomanager");
//	}
	public void gridweibo(){
		String sql="select * from weibo";
		List<Weibo> list=Weibo.dao.find(sql);
		String jsonText=BaseUtils.GridData(list);
		renderJson(jsonText);
	}
	@Before(WeiboValidator.class)
	public void add(){
		String content= getPara("content");
		new Weibo().set("content", content).set("createtime", new Date()).save();
//		getModel(Weibo.class).set("createtime", new Date()).save();
		renderJson(BaseUtils.getSuccessMessage("发表成功！"));
	}
	@Before(WeiboValidator.class)
	public void modify(){
		String id= getPara("id");
		String content= getPara("content");
		Weibo.dao.findById(id).set("content", content).update();
		renderJson(BaseUtils.getSuccessMessage("修改成功！"));
	}
	
	public void to_modify(){
		String id= getPara("id");
		Weibo weibo=Weibo.dao.findById(id);
		System.out.println(weibo.toJson());
		renderJson(weibo);
	}
	
	public void delete() {
		String id= getPara("id");
		Weibo.dao.deleteById(id);
		renderJson(BaseUtils.getSuccessMessage("删除成功！"));
	}
	
	public void addReply() {
		String content= getPara("content");
		String name= getPara("name");
		String weibo_id= getPara("weibo_id");
		String headpic=BaseUtils.getRandomHeadPic();
		WeiboReply reply= new WeiboReply();
		reply.set("content", content).set("name", name).set("weibo_id", weibo_id).set("headpic", headpic).save();
		int num=WeiboReplyDao.find("select weibo_id from weibo_reply where weibo_id=?",weibo_id).size();
		Map<String,Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("Message", "回复成功！");
		jsonMap.put("reply", reply);
		jsonMap.put("num", num);
		System.out.println(jsonMap);
		renderJson(jsonMap);
	}
}
