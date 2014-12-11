package com.keyan.tool;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapTool {
	@SuppressWarnings("unchecked")
	public Map<String, String> nullValueDel(Map<String, String> map){
		Set set = map.entrySet();
    	Iterator iter1 = set.iterator();
    	Map<String, String> newMap = new HashMap<String, String>();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		if (!(entry.getValue() == null || entry.getValue().equals("null"))){ 
    			newMap.put(entry.getKey(), entry.getValue());
    		}
    	}
    	return newMap;
	}
	@SuppressWarnings("unchecked")
	public Map<String, String> nullValueParse(Map<String, String> map){
		Set set = map.entrySet();
    	Iterator iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		if (entry.getValue() == null || entry.getValue().equals("null")){ 
    			map.put(entry.getKey(), "");
    		}
    	}
    	return map;
	}
}
