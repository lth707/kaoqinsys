
/*
 * 说明： 一周的起始计算方式不同国家有所不同，很多其他国家将周日作为一周的开始 本代码使用中国习惯，将周一作为每周的开始 特此说明
 */

function TodayInfo(start) {
	var WEEKLEN = 7, // 一周7天为常量
	WEEKDAYS = ["日", "一", "二", "三", "四", "五", "六"], weekInfo = {
		"week" : null,
		"day" : null
	}, // 初始化返回信息，默认第null周，星期null
	oneDay = 24 * 60 * 60 * 1000, // 一天的毫秒时长
	weekLeave, // 开学当天所在周剩余天数
	weekStart, // 开学当天start是星期几
	today, // 今天
	dateDiff, // 今天与开学当天日期差
	sDate; // 开学之日，日期对象
	var rDateStr = /\d{4}[\/-]\d{1,2}[\/-]\d{1,2}/g; // 简单的日期格式校验：2013/12/19
	if (!rDateStr.test(start)) {
		return weekInfo;
	}
	sDate = new Date(start.replace("-", "/"));
	weekStart = sDate.getDay();
	weekStart = weekStart === 0 ? 7 : weekStart; // JS中周日的索引为0，这里转换为7，方便计算

	weekLeave = WEEKLEN - weekStart;
	today = new Date();
	weekInfo.day = WEEKDAYS[today.getDay()];
	today = new Date(today.getFullYear() + "/" + (today.getMonth() + 1) + "/"
			+ today.getDate());
	dateDiff = today - sDate;
	if (dateDiff < 0) {
		return weekInfo;
	}
	dateDiff = parseInt(dateDiff / oneDay);
	weekInfo.week = Math.ceil((dateDiff - weekLeave) / WEEKLEN) + 1;
	return weekInfo;
}
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt) { // author: meizz
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
		// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4
						- RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1)
							? (o[k])
							: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
};