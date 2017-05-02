package com.lth.kaoqinsys.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tool {
	@SuppressWarnings("deprecation")
	public static HashMap<String, Object> TodayInfo(String start) {
		int WEEKLEN = 7;// 一周7天为常量
		String[] WEEKDAYS = new String[] { "日", "一", "二", "三", "四", "五", "六" };
		HashMap<String, Object> weekInfo = new HashMap<String, Object>();
		weekInfo.put("week", null);
		weekInfo.put("day", null);// 初始化返回信息，默认第null周，星期null
		int oneDay = 24 * 60 * 60 * 1000;// 一天的毫秒时长
		int weekLeave, // 开学当天所在周剩余天数
		weekStart; // 开学当天start是星期几
		Date today; // 今天
		long dateDiff;// 今天与开学当天日期差
		Date sDate; // 开学之日，日期对象
		Pattern rDateStr = Pattern
				.compile("\\d{4}[\\/-]\\d{1,2}[\\/-]\\d{1,2}");// 简单的日期格式校验：2013/12/19
		Matcher m = rDateStr.matcher(start);
		boolean flg = m.matches();
		if (!flg) {
			return weekInfo;
		}
		sDate = new Date(start.replace("-", "/"));
		weekStart = sDate.getDay();
		weekStart = weekStart == 0 ? 7 : weekStart; // JS中周日的索引为0，这里转换为7，方便计算
		weekLeave = WEEKLEN - weekStart;
		today = new Date();
		weekInfo.put("day", WEEKDAYS[today.getDay()]);
		today = new Date((today.getYear() + 1900) + "/"
				+ (today.getMonth() + 1) + "/" + today.getDate());
		dateDiff = today.getTime() - sDate.getTime();
		if (dateDiff < 0) {
			return weekInfo;
		}
		dateDiff = dateDiff / oneDay;
		weekInfo.put("week",
				Math.ceil((dateDiff - weekLeave) / (double) WEEKLEN) + 1);
		return weekInfo;
	}

	@SuppressWarnings("deprecation")
	public static HashMap<String, Object> getCurrentTermAndWeek() {
		Date nowDate = new Date();
		int curYear = nowDate.getYear() + 1900;
		Date date1 = new Date(curYear + "/3/1");
		Date date2 = new Date((curYear - 1) + "/9/1");
		int term = 1;// 学期
		if (Date.parse(nowDate.toString()) > Date.parse(date2.toString())
				&& Date.parse(nowDate.toString()) < Date
						.parse(date1.toString())) {
			term = 1;
		} else if (Date.parse(nowDate.toString()) > Date
				.parse(date1.toString())) {
			term = 2;
		} else {
			term = 1;
		}
		HashMap<String, Object> td = new HashMap<String, Object>();
		if (term == 1) {
			td = Tool.TodayInfo((curYear - 1) + "/9/1");
		} else {
			td = TodayInfo(curYear + "/3/1");
		}
		td.put("term", term);
		td.put("year", curYear - 1);
		return td;
	}
}
