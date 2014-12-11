package com.keyan.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NumberTool {
	public static boolean isNum(String str){
		if (str == null || str.length() == 0) {
			return false;
		}
		Pattern pattern = Pattern.compile("([1-9]+[0-9]*|0)(\\.[\\d]+)?");
		Matcher isNum = pattern.matcher(str);
		if( !isNum.matches()){
			return false;
		}
		return true;
	} 
}
