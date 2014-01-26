package com.oneblog.life;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.oneblog.utils.BaseUtils;

public class LifeController  extends Controller{
	public void index() {
		String UrlPara= getPara();
		List<Life> lifelist=new ArrayList<Life>();
		String lifename="";
		if(!StringUtils.isEmpty(UrlPara)){
			String type;
			try {
				UrlPara=URLDecoder.decode(UrlPara, "utf-8");
				lifename=UrlPara;
				if(UrlPara.equals("个人随笔")){
					type="1";
				}
				else if(UrlPara.equals("糗事百科")){
					type="2";
				}
				else if(UrlPara.equals("生活娱乐")){
					type="3";
				}
				else if(UrlPara.equals("焦点新闻")){
					type="4";
				}else{
					type="5";
				}
				String sql="select * from life where type=?";
				lifelist=Life.dao.find(sql, type);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}else{
			String sql="select * from life where  pic is not null";
			lifelist=Life.dao.find(sql);
		}

		for (Life life : lifelist) {
			String str=BaseUtils.delHTMLTag(life.getStr("content"));
			if(str.length()>100)
				str=str.substring(0, 100).concat("...");
			life.put("jianjie", str);
		}
		setAttr("lifelist", lifelist);
		setAttr("lifename", lifename);
		render("/common/life/life.jsp");
	}
	public void gridlife(){
		String sql="select * from life";
		List<Life> list=Life.dao.find(sql);
		String jsonText=BaseUtils.GridData(list);
		renderJson(jsonText);
	}
	@Before(LifeValidator.class)
	public void save() {
//		Life l=getModel(Life.class);
//		System.out.println(l.toString());
		getModel(Life.class).set("createtime", new Date()).set("clicks", 0).save();
		renderJson(BaseUtils.getSuccessMessage("发表成功！"));
	}
	public void to_modify(){
		String id= getPara("id");
		Life life=Life.dao.findById(id);
		renderJson(life);
	}
	@Before(LifeValidator.class)
	public void modify(){
		getModel(Life.class).update();
		renderJson(BaseUtils.getSuccessMessage("修改成功！"));
	}
	public void delete() {
		String id= getPara("id");
		Life.dao.deleteById(id);
		renderJson(BaseUtils.getSuccessMessage("删除成功！"));
	}
	public void detail(){
		Life life=Life.dao.findById(getParaToInt());
		life.set("clicks", life.getInt("clicks")+1);
		life.update();
		setAttr("life", life);
		render("/common/life/detail.jsp");
	}

	public String getRealIpAddr() {
		  HttpServletRequest request = getRequest();
		  String ip = request.getHeader("x-forwarded-for");
		  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		    ip = request.getHeader("Proxy-Client-IP");
		  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		    ip = request.getHeader("WL-Proxy-Client-IP");
		  if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		    ip = request.getRemoteAddr();
		  return ip;
		}
}
