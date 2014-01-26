package com.oneblog.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Record;

public class BaseUtils {
	public static ResourceBundle bundle = ResourceBundle.getBundle("source/fileserver");
	public static final String SERVER_Add = bundle.getString("SERVER_Add");
	public static final String SERVER_IP = bundle.getString("ServerIp");
	public static final String ServerName = bundle.getString("ServerName");
	public static final String SERVER_PORT = bundle.getString("ServerPort");
	public static final String FilePath = bundle.getString("FilePath");
	public static final String ImagePath = bundle.getString("ImagePath");
	public static final String VideoPath = bundle.getString("VideoPath");
	public static final String StaticPath = bundle.getString("StaticPath");
	
	public static final String RandomHeadPic=bundle.getString("RandomHeadPic");
	/**
	 * 封装ligerui grid
	 * @param list
	 * @return
	 */
	public static String GridData(List<?> list){
		String jsonText=JsonKit.toJson(list);
		jsonText="{\"Rows\":"+jsonText+",\"Total\":"+list.size()+"}";
		return jsonText;
	}
	
	public static Map<String,Object> getSuccessMessage(String Message){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("IsError", false);
		map.put("Message", Message);
		map.put("Data", null);
		return map;
	}
	
	public static Map<String,Object> getErrorMessage(String Message){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("IsError", true);
		map.put("Message", Message);
		return map;
	}
	/**
	 * 获取随机头像
	 * @return 随机头像地址
	 */
	public static String getRandomHeadPic(){
		String picurl="";
		String path=BaseUtils.class.getClass().getResource("/")
				.getPath();
		path = path.substring(1, path.length());
		path=path.substring(0,path.indexOf("WEB-INF")-1)+RandomHeadPic;
		File f = new File(path);
		if (f.exists() && f.isDirectory()) {// 判断是文件还是目录
			if (f.listFiles().length != 0) {// 若有则把文件放进数组，并判断是否有下级目录
				File file[] = f.listFiles();
				int i = f.listFiles().length;
				 Random random1 = new Random();
				 picurl = RandomHeadPic+file[random1.nextInt(i-1)].getName();
			}
		}
		return picurl;
		
	}
	 private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
	 private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
	 private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
	 
	  public static String delHTMLTag(String htmlStr) {
	        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
	        Matcher m_script = p_script.matcher(htmlStr);
	        htmlStr = m_script.replaceAll(""); // 过滤script标签

	        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
	        Matcher m_style = p_style.matcher(htmlStr);
	        htmlStr = m_style.replaceAll(""); // 过滤style标签

	        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
	        Matcher m_html = p_html.matcher(htmlStr);
	        htmlStr = m_html.replaceAll(""); // 过滤html标签

	        return htmlStr.trim(); // 返回文本字符串
	    }
	  /**
		 * 将List 数组转换为Tree 所需要的数据
		 * 
		 * @param list
		 * @param id
		 *            ID 列
		 * @param pid
		 *            PID 列
		 * @return
		 */
		public static List<Map<String, Object>> ArrayToTreeData(List<Record> mydata, String id, String pid) {
			Map<Object, Object> h = new HashMap<Object, Object>();// 数据索引
			List<Map<String, Object>> r = new ArrayList<Map<String, Object>>();// 数据池，返回的数据

			for (Record item : mydata) {
				if (!item.getColumns().containsKey(id)) {
					continue;
				} else {
					h.put(item.getColumns().get(id), item.getColumns());
				}
			}

			for (Record item : mydata) {
				if (!item.getColumns().containsKey(id)) {
					continue;
				}
				if (!item.getColumns().containsKey(pid) || (item.getColumns().get(pid) == null) || !h.containsKey(item.getColumns().get(pid))) {
					r.add(item.getColumns());
				} else {
					Map<String, List<Map<String, Object>>> pitem = (Map<String, List<Map<String, Object>>>) h.get(item.getColumns().get(pid));
					if (!pitem.containsKey("children")) {
						List<Map<String, Object>> children = new ArrayList<Map<String, Object>>();
						children.add(item.getColumns());
						pitem.put("children", children);
					} else {
						List<Map<String, Object>> children = pitem.get("children");
						children.add(item.getColumns());
						pitem.put("children", children);
					}
				}
			}
			return r;
		}
	  
public static void main(String[] args) {
	String pic=getRandomHeadPic();
	System.out.println("pic :"+pic);
}
}
