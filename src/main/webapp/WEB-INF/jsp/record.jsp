<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="calendar" class="fc fc-ltr fc-unthemed">
	<div class="fc-toolbar">
		<div class="fc-right">
			<h2>
				<input value='${currentYear}' readonly class="datepicker"
					style="width:80px;text-align:center" />年&nbsp;&nbsp;&nbsp;&nbsp;第<select
					id="termselected">
					<c:if test='${currentTerm==1}'>
						<option value='1' selected>1</option>
					</c:if>
					<c:if test='${currentTerm!=1}'>
						<option value='1'>1</option>
					</c:if>
					<c:if test='${currentTerm==2}'>
						<option value='2' selected>2</option>
					</c:if>
					<c:if test='${currentTerm!=2}'>
						<option value='2'>2</option>
					</c:if>
				</select>学期
			</h2>
		</div>
		<div class="fc-clear"></div>
	</div>
</div>
<div class="box box-primary">
	<div class="box-body">
		<table class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>姓名</th>
					<th>学号</th>
					<th>性别</th>
					<th>年级</th>
					<th>班级</th>
					<th>考勤记录</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="studentRecordModel" items="${studentRecordModels}">
					<tr>
						<td>${studentRecordModel.student.name}</td>
						<td>${studentRecordModel.student.num}</td>
						<c:if test="${studentRecordModel.student.sex==1}">
							<td>男</td>
						</c:if>
						<c:if test="${studentRecordModel.student.sex==0}">
							<td>女</td>
						</c:if>
						<td>${studentRecordModel.student.grade}</td>
						<td>${studentRecordModel.student.classnum}</td>
						<td>${studentRecordModel.presentAndAbsentTimeString}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$('#termselected').change(
			function() {
				top.curWeekAndTerm.term = $(this).val();
				checkTermAndYear();
				$('#content').load("record?" + $.param(top.curWeekAndTerm));
				location.hash = top.Base64.encode("record?"
						+ $.param(top.curWeekAndTerm));
			});

	var datepicker = $('.datepicker').datetimepicker({
		format : 'yyyy',
		autoclose : true,
		endDate : new Date(getCurrentTermAndWeek().year + '/12/30'),
		startView : 4,
		maxView : 4,
		minView : 4,
		fontAwesome : true,
	}).on(
			'changeYear',
			function(ev) {
				var newDate = new Date(ev.date);
				datepicker.val(newDate.getFullYear());
				top.curWeekAndTerm.year = datepicker.val();
				checkTermAndYear();
				location.hash = top.Base64.encode("record?"
						+ $.param(top.curWeekAndTerm));
			});
</script>