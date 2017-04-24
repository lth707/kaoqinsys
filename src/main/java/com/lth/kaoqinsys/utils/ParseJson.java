package com.lth.kaoqinsys.utils;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 解析Json数据
 * 
 * @author Superfic
 *
 */
public class ParseJson {
	public static List<Integer> getListWeek(String week) {
		List<Integer> list = new ArrayList<Integer>();
		String[] srtArr = week.split(",");
		int[] intArr = new int[srtArr.length];
		for (int i = 0; i < srtArr.length; i++) {
			try {
				intArr[i] = Integer.parseInt(srtArr[i].trim());
			} catch (NumberFormatException nbFmtExp) {
				intArr[i] = 0;
			}
		}
		for (int i = 0; i < intArr.length; i++) {
			list.add(Integer.valueOf(intArr[i]));
		}
		return list;
	}

	public static void parseJsonString(String json) {
		List<Integer> week = null;
		JSONObject jsonObject = new JSONObject();
		JSONObject dataJson = JSONObject.fromObject(json);
		JSONArray data = dataJson.getJSONArray("data");
		for (int i = 0; i < data.size(); i++) {
			JSONObject jsonObj = data.getJSONObject(i);
			String weekJson = jsonObj.getString("week");
			week = getListWeek(weekJson);
			jsonObj.put("week", week);
		}
		System.out.println(jsonObject);
	}
}
