package com.oneblog.manager;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;
import com.oneblog.utils.BaseUtils;
import com.oneblog.utils.CaptchaRender;

/**
 * ManagerController
 */
@Before(ManagerInterceptor.class)
public class ManagerController extends Controller {
	
	public void index() {
//		setAttr("ManagerList", Manager.dao.find("select * from Manager order by id asc"));
		render("/manager/index.jsp");
	}
	
	public void add() {
	}
	
	@Before(ManagerValidator.class)
	public void save() {
		getModel(Manager.class).save();
		redirect("/Manager");
	}
	
	public void edit() {
		setAttr("Manager", Manager.dao.findById(getParaToInt()));
	}
	
	@Before(ManagerValidator.class)
	public void update() {
		getModel(Manager.class).update();
		redirect("/Manager");
	}
	
	public void delete() {
		Manager.dao.deleteById(getParaToInt());
		redirect("/Manager");
	}
	
	public void weibo(){
		redirect("/manager/weibo/weibo.jsp");
	}
	public void life(){
		redirect("/manager/life/life.jsp");
	}
	public void jquery(){
		redirect("/manager/jquery/jquery.jsp");
	}
	
	/**
	 * 获取按钮
	 */
	public void getMyButtons(){
		String jsonText="";
		String path = ManagerController.class.getClass().getResource("/")
				.getPath();
		path = path.substring(1, path.length()) + "source/button.txt";
		System.out.println(path);
		File f = new File(path);
		try {
			BufferedReader bufReader = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
			 String inLine = null;
			while ((inLine = bufReader.readLine()) != null) {
				System.out.println(inLine);
				jsonText=inLine;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		renderJson(jsonText);
	}
	/**
	 * KindEditor图片上传至文件服务器
	 */
	public void KindUpload(){
		String path=BaseUtils.SERVER_Add+"/"+BaseUtils.ImagePath;
		try{
		UploadFile file = getFile("imgFile", path);
			 if (file != null) {
				String url=BaseUtils.SERVER_IP+":"+BaseUtils.SERVER_PORT+"/"+BaseUtils.ServerName+"/"+BaseUtils.ImagePath + "/"+file.getFileName();
	            setAttr("error",0);
	            setAttr("url", url);
	            renderJson();
	        }
	        else{
	            setAttr("error",1);
	            setAttr("message","请选择文件");
	            renderJson();
	        }
			
		}catch (Exception e) {
	        setAttr("error",1);
	        setAttr("message","上传出现异常，请重新上传");
	        renderJson();
	    }
	    /*
	    //低版本浏览器用这个
	    render(new JsonRender().forIE());
	    //高版本IE用这个
	    renderJson();
	    */
		 
	}
	
	public void uploadfile(){
		String path=BaseUtils.SERVER_Add+"/"+BaseUtils.ImagePath;
		UploadFile file = getFile("uploadify", path);
		 if (file != null) {
				String url=BaseUtils.SERVER_IP+":"+BaseUtils.SERVER_PORT+"/"+BaseUtils.ServerName+"/"+BaseUtils.ImagePath + "/"+file.getFileName();
				System.out.println("url :"+url);
	            renderJson(url);
	        }
	        else{
	            setAttr("message","请选择文件");
	            renderJson();
	        }
	}
	
	public void login(){
//		String username= getPara("username");
//		String password= getPara("password");
		String captchaCode = getPara("captchaCode");
		Object objMd5RandomCode = this.getSessionAttr(CaptchaRender.DEFAULT_CAPTCHA_MD5_CODE_KEY);
					String md5RandomCode = null;
					if(objMd5RandomCode != null){
						md5RandomCode = objMd5RandomCode.toString();
						this.removeSessionAttr(CaptchaRender.DEFAULT_CAPTCHA_MD5_CODE_KEY);
					}
					if(!CaptchaRender.validate(md5RandomCode, captchaCode)){
//						this.setFlash("username", username);
//						this.setFlash("password", password);
//						this.setFlash("msg", "验证码错误，请输入正确的验证码");
//						redirect(ShiroKit.getLoginUrl());
						return;
					}
	}
}


