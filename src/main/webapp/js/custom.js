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

function getCurrentTermAndWeek() {

	var nowDate = new Date();
	var curYear = nowDate.Format('yyyy');
	var date1 = new Date(curYear + '/3/1');
	var date2 = new Date((curYear - 1) + '/9/1');
	var term = 1;// 学期
	var week = 1;// 周
	if (Date.parse(nowDate) > Date.parse(date2)
			&& Date.parse(nowDate) < Date.parse(date1)) {
		term = 1;
	} else if (Date.parse(nowDate) > Date.parse(date1)) {
		term = 2;
	} else {
		term = 1;
	}
	var td;
	if (term == 1) {
		td = TodayInfo((curYear - 1) + "/9/1");
	} else {
		td = TodayInfo(curYear + "/3/1");
	}
	week = td.week;
	return {
		week : td.week,
		day : td.day,
		term : term,
		year : curYear - 1
	};
}

function gotologin() {
	setTimeout(function() {
				layer.closeAll();
				location.href = 'login';
			}, 500);
}
function openTips(ele, tcs) {
	var content = ['<div class="row">', '<div class="col-sm-12">',
			'<div class="col-sm-5">课程名</div>',
			'<div class="col-sm-7">' + tcs.course.name + '</div>', '</div>',
			'</div>', '<div class="row">', '<div class="col-sm-12">',
			'<div class="col-sm-5">教师</div>',
			'<div class="col-sm-7">' + tcs.teacher.name + '</div>', '</div>',
			'</div>', '<div class="row">', '<div class="col-sm-12">',
			'<div class="col-sm-5">班级</div>',
			'<div class="col-sm-7">' + tcs.course.classroom + '</div>',
			'</div>', '</div>', '<div class="row">', '<div class="col-sm-12">',
			'<div class="col-sm-5">周数</div>',
			'<div class="col-sm-7">1-20周</div>', '</div>', '</div>'];

	layer.tips(content.join(''), ele, {
				time : 0,
				tips : [2, '#78BA32'],
				area : ["200px", ""]
			});
}

/**
 * 
 * Base64 encode / decode
 * 
 * @author haitao.tu
 * @date 2010-04-26
 * @email tuhaitao@foxmail.com
 * 
 */
function Base64() {
	// private property
	_keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	// public method for encoding
	this.encode = function(input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;
		input = _utf8_encode(input);
		while (i < input.length) {
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;
			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}
			output = output + _keyStr.charAt(enc1) + _keyStr.charAt(enc2)
					+ _keyStr.charAt(enc3) + _keyStr.charAt(enc4);
		}
		return output;
	};
	// public method for decoding
	this.decode = function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;
		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
		while (i < input.length) {
			enc1 = _keyStr.indexOf(input.charAt(i++));
			enc2 = _keyStr.indexOf(input.charAt(i++));
			enc3 = _keyStr.indexOf(input.charAt(i++));
			enc4 = _keyStr.indexOf(input.charAt(i++));
			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;
			output = output + String.fromCharCode(chr1);
			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}
		}
		output = _utf8_decode(output);
		return output;
	};
	// private method for UTF-8 encoding
	_utf8_encode = function(string) {
		string = string.replace(/\r\n/g, "\n");
		var utftext = "";
		for (var n = 0; n < string.length; n++) {
			var c = string.charCodeAt(n);
			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
		}
		return utftext;
	};
	// private method for UTF-8 decoding
	_utf8_decode = function(utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
		while (i < utftext.length) {
			c = utftext.charCodeAt(i);
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i + 1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				string += String.fromCharCode(((c & 15) << 12)
						| ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
		}
		return string;
	};
}
