package com.oneblog.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.oneblog.jquery.Jquery;
import com.oneblog.jquery.JqueryController;
import com.oneblog.life.Life;
import com.oneblog.life.LifeController;
import com.oneblog.love.LoveController;
import com.oneblog.manager.ManagerController;
import com.oneblog.manager.RssController;
import com.oneblog.manager.TagsController;
import com.oneblog.weibo.Weibo;
import com.oneblog.weibo.WeiboController;
import com.oneblog.weibo.WeiboReply;

/**
 * API引导式配置
 */
public class RemielConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("a_little_config.txt");				// 加载少量必要配置，随后可用getProperty(...)获取值
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP); 							// 设置视图类型为Jsp，否则默认为FreeMarker
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/", CommonController.class);
		me.add("/manager", ManagerController.class);
		me.add("/weibo", WeiboController.class);
		me.add("/life", LifeController.class);
		me.add("/jquery", JqueryController.class);
		me.add("/love", LoveController.class);
		me.add("/rss", RssController.class);
		me.add("/tags", TagsController.class);
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		arp.setShowSql(true);
		me.add(arp);
		me.add(new EhCachePlugin());
//		arp.addMapping("manager", Manager.class);	
		arp.addMapping("weibo", Weibo.class);	// 映射weibo 表到 Weibo模型
		arp.addMapping("weibo_reply", WeiboReply.class);
		arp.addMapping("life", Life.class);
		arp.addMapping("jquery", Jquery.class);
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
//		me.add(new TagsInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
//		me.add(new RemielActionHandler());
	}
	
	/**
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 80, "/", 5);
	}
}
