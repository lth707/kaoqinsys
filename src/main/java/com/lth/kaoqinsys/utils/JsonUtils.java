package com.lth.kaoqinsys.utils;

import com.alibaba.fastjson.JSON;

/**
 * Json数据生成工具
 * @author Superfic
 *
 */
public class JsonUtils {
	public static String toJsonFromList(Object list){
		String jsonString = "";
		try {
			jsonString = JSON.toJSONString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonString;
	}
}
