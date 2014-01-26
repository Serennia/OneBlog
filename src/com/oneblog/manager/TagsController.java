package com.oneblog.manager;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheName;
import com.oneblog.life.Life;
import com.oneblog.utils.BaseUtils;
//@Before(TagsInterceptor.class)
public class TagsController extends Controller{
	public void index() {
		String UrlPara= getPara();
		String pageIndex=getPara("pageIndex");
		if(StringUtils.isEmpty(pageIndex)){
			pageIndex="1";
		}
		System.out.println("-----标签-----"+UrlPara);
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			UrlPara=URLDecoder.decode(UrlPara, "utf-8");
			Page<Life> page=Life.dao.paginate(Integer.parseInt(pageIndex), 5, "select *", "from life where tags=? order by createtime desc",UrlPara);
			List<Life> lifelist=page.getList();
			for (Life life : lifelist) {
				String str=BaseUtils.delHTMLTag(life.getStr("content"));
				if(str.length()>100)
					str=str.substring(0, 100).concat("...");
				life.put("jianjie", str);
			}
			map.put("pageIndex",pageIndex);
			map.put("sum_count",lifelist.size());
			setAttr("lifelist", lifelist);
			setAttr("map", map);
			System.out.println(map.toString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		render("/common/tags/tags.jsp");
	}
	
	@Before(CacheInterceptor.class)
	@CacheName("tags")
	public void loadtags() {
		String sql="select tags as text,count(tags)weight from life group by tags ";
		List<Record> tags = Db.find(sql);
		for (Record record : tags) {
			record.set("url", BaseUtils.SERVER_IP+"/tags/"+record.getStr("text"));
		}
		System.out.println("加载库.....");
		renderJson(tags);
	}
	
}
