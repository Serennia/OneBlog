package com.oneblog.common;

import java.util.List;

import com.jfinal.core.Controller;
import com.oneblog.life.Life;
import com.oneblog.utils.BaseUtils;

/**
 * CommonController
 */
public class CommonController extends Controller {
	
	public void index() {
			String sql="select * from life order by createtime desc limit 0,8";
			List<Life> lifelist=Life.dao.find(sql);
			for (Life life : lifelist) {
				String str=BaseUtils.delHTMLTag(life.getStr("content"));
				if(str.length()>100)
					str=str.substring(0, 100).concat("...");
				life.put("jianjie", str);
			}
			setAttr("lifelist", lifelist);
		render("/common/index.jsp");
	}
}
