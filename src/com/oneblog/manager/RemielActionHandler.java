package com.oneblog.manager;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.config.Constants;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.handler.Handler;
import com.jfinal.log.Logger;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;
import com.jfinal.render.RenderFactory;

/**
 * ActionHandler
 */
public class RemielActionHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		System.out.println("拦截action...."+target);
//		if(target.indexOf(".")==-1)
			nextHandler.handle(target, request, response, isHandled);
	}
	
}