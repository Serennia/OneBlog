package com.oneblog.weibo;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BlogValidator.
 */
public class WeiboValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("content", "contentMsg", "请输入微博内容!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Weibo.class);
		String actionKey = getActionKey();
		if (actionKey.equals("/weibo/add")){
			System.out.println(controller.getAttrForStr("contentMsg"));
			controller.renderJson();
//			controller.render("/manager/weibo/add.jsp");
		}
		else if (actionKey.equals("/weibo/modify"))
			controller.renderJson();
//			controller.render("/manager/weibo/add.jsp");
	}
}
