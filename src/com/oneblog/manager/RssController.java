package com.oneblog.manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheName;
import com.oneblog.life.Life;
import com.oneblog.utils.BaseUtils;
import com.sun.syndication.feed.rss.Channel;
import com.sun.syndication.feed.rss.Description;
import com.sun.syndication.feed.rss.Guid;
import com.sun.syndication.feed.rss.Image;
import com.sun.syndication.feed.rss.Item;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.WireFeedOutput;

public class RssController extends Controller {
	@Before(CacheInterceptor.class)
	@CacheName("rss")
	public void index() {
		String rss = createXml();
		renderHtml(rss);
	}

	/*
	 * 根据Channel源码提供的英文,Channel对象有两个构造器，一个默认的无参构造器用于clone对象，一个是有参的
	 * 我们自己指定的必须使用有参数的
	 * （因为我们需要许可证），指构造方法必须要创建一个type（版本），这个type不能随便写，必须要以rss_开头的版本号 Licensed
	 * under the Apache License, Version 2.0 (the "License");
	 * 因为当前版本是2.0，所以就是rss_2.0，必须是rss_2.0否则会抛异常，该源码中写的已经很明白。
	 */
	public String createXml() {
		String xml = "";
		Channel channel = new Channel("rss_2.0");
		channel.setTitle("Remiel的个人博客");// 网站标题
		channel.setDescription("\"神的慈悲\"、\"等待复活之日的魂之王\"， 将人的灵魂引导向最后的审判。");// 网站描述
		channel.setLink("www.shlll.net");// 网站主页链接
		channel.setEncoding("utf-8");// RSS文件编码
		channel.setLanguage("zh-cn");// RSS使用的语言
		channel.setTtl(5);// time to live的简写，在刷新前当前RSS在缓存中可以保存多长时间（分钟）
		channel.setCopyright("版权声明");// 版权声明
		channel.setPubDate(new Date());// RSS发布时间
		Image image = new Image();
		String link_url = BaseUtils.SERVER_IP + "/images/index/logo.jpg";
		image.setLink(BaseUtils.SERVER_IP);
		image.setUrl(link_url);
		image.setTitle("Remiel");
		image.setHeight(100);
		image.setWidth(100);
		channel.setImage(image);
		List<Item> items = new ArrayList<Item>();// 这个list对应rss中的item列表
		
		String sql="select * from life";
		List<Life> lifelist=Life.dao.find(sql);
		System.out.println("加载库.....");
		for (Life life : lifelist) {
			Item item = new Item();// 新建Item对象，对应rss中的<item></item>
			item.setAuthor("remiel");// 对应<item>中的<author></author>
			item.setTitle(life.getStr("title"));// 对应<item>中的<title></title>
			item.setGuid(new Guid());// GUID=Globally Unique Identifier// 为当前新闻指定一个全球唯一标示，这个不是必须的
			item.setPubDate(life.getTimestamp("createtime"));// 这个<item>对应的发布时间
//			item.setComments("注释111");// 代表<item>节点中的<comments></comments>
			// 新建一个Description，它是Item的描述部分
			Description description = new Description();
			description.setValue(life.getStr("content"));// <description>中的内容
			item.setDescription(description);// 添加到item节点中
			items.add(item);// 代表一个段落<item></item>，
			channel.setItems(items);
		}

		// 用WireFeedOutput对象输出rss文本
		try {
			WireFeedOutput out = new WireFeedOutput();
			xml = out.outputString(channel);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (FeedException e) {
			e.printStackTrace();
		}
		return xml;

	}
}
