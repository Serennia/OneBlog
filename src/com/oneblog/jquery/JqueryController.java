package com.oneblog.jquery;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.oneblog.utils.BaseUtils;

public class JqueryController extends Controller{
	public void index() {
		List<Record> treeData = Db.find("SELECT jname as text,id,id as id,parentid,parentid as parent FROM jquery WHERE  1=1");
		List<Map<String, Object>> tempTree = BaseUtils.ArrayToTreeData(treeData, "id", "parentid");
		Jquery j=Jquery.dao.findById( 1);
		setAttr("tempTree",tempTree);
		setAttr("jquery",j);
		render("/common/jquery/jquery.jsp");
	}
	public void getTree(){
		String view = getPara("view");
		String idfield = getPara("idfield");
		String pidfield = getPara("pidfield");
		String textfield = getPara("textfield");
		StringBuffer sb = new StringBuffer();
		StringBuffer field = new StringBuffer();
		field.append(textfield).append(" as text");
		if (!StringUtils.isEmpty(idfield)) {
			field.append(",").append(idfield).append(",").append(idfield).append(" as id");
		}
		if (!StringUtils.isEmpty(pidfield)) { 
			field.append(",").append(pidfield).append(",").append(pidfield).append(" as parent");
		}
		String whereSql = " 1=1 ";
		String SQL = sb.append("SELECT ").append(field).append(" FROM ").append(view).append(" WHERE ").append(whereSql).toString();
		List<Record> treeData = Db.find(SQL);
		List<Map<String, Object>> tempTree = BaseUtils.ArrayToTreeData(treeData, idfield.toLowerCase(), pidfield.toLowerCase());
		renderJson(tempTree);
	}
	
	public void insert(){
		Jquery j=new Jquery();
		j.set("type", "1");
		j.set("parentid", getPara("id"));
		j.set("jname", getPara("jname"));
		j.save();
		renderJson(BaseUtils.getSuccessMessage("添加成功！"));
	}
	public void update(){
		Jquery j=Jquery.dao.findById( getPara("id"));
		j.set("jname", getPara("jname")).update();
		renderJson(BaseUtils.getSuccessMessage("修改成功！"));
	}
	
	public void updatecontent(){
		Jquery j=Jquery.dao.findById( getPara("id"));
		System.out.println(j);
		j.set("content", getPara("content")).update();
		renderJson(BaseUtils.getSuccessMessage("设置内容成功！"));
	}
	
	
	public void querycontent(){
		Jquery j=Jquery.dao.findById( getPara("id"));
		renderJson(j);
	}
//	@BEFORE(CACHEINTERCEPTOR.CLASS)
//	@CACHENAME("JQUERY")
	public void loadContent(){
		Jquery j=CacheKit.get("jquery",getPara("id"),new IDataLoader() {
			public Object load() {
				return Jquery.dao.findById( getPara("id"));
			}
		});
		setAttr("j", j);
		CacheKit.put("jquery", j.getLong("id"), j);
		
		String nextid=getPara("nextid");
		if(!nextid.equals("0")){
			Jquery next=CacheKit.get("jquery", getPara("nextid"),new IDataLoader() {
				public Object load() {
					System.out.println("加载库...");
					return Jquery.dao.findById( getPara("nextid"));
				}
			});
			setAttr("n",next);
			CacheKit.put("jquery",next.getLong("id") , next);
		}
		String previd=getPara("previd");
		if(!previd.equals("0")){
			Jquery prev=CacheKit.get("jquery", getPara("previd"),new IDataLoader() {
				public Object load() {
					System.out.println("加载库...");
					return Jquery.dao.findById( getPara("previd"));
				}
			});
			setAttr("p",prev);
			CacheKit.put("jquery", prev.getLong("id"), prev);
		}
		renderJson();
		

	}

}
