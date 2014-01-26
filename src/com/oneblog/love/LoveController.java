package com.oneblog.love;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.oneblog.utils.DateUtils;

public class LoveController extends Controller{
	public void index() {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("fromdate", "2012-11-24");
		map.put("todate", DateUtils.returnNow());
		setAttr("map", map);
		render("/common/love/love.jsp");
	}
}
