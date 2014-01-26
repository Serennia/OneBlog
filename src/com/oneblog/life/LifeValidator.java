package com.oneblog.life;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class LifeValidator extends Validator {

	@Override
	protected void validate(Controller c) {
		validateRequiredString("life.title", "titleMsg", "请输入标题!");
		validateRequiredString("life.content", "contentMsg", "请输入内容!");

		
	}

	@Override
	protected void handleError(Controller c) {
		c.keepModel(Life.class);
		String actionKey = getActionKey();		
		if (actionKey.equals("/life/save"))
			c.renderJson();
		else if (actionKey.equals("/life/modify"))
			c.renderJson();
	}

}
