package com.oneblog.weibo;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Weibo extends Model<Weibo> {
	public static final Weibo dao = new Weibo();
	public static final WeiboReply chliddao = new WeiboReply();
	private List<WeiboReply> childrens;  //定义一个子类集合
//	public List<WeiboReply> getWeiboReply(Long id) {
//		childrens=chliddao.find("select * from weibo_reply where weibo_id=?",id);
//		return childrens;
//	}
	public List<WeiboReply> getChildrens() {
		childrens=chliddao.find("select * from weibo_reply");
		return childrens;
	}
	public void setChildrens(List<WeiboReply> childrens) {
		this.childrens = childrens;
	}
	
}
