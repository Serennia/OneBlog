package com.oneblog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	public static String returnNow(){
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		String sdate=sf.format(d);
		return sdate;
	}
	public static void main(String[] args) {
		System.out.println(returnNow());
	}
}
