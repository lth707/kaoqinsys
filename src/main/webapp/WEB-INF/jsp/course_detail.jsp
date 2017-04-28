<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="box">
	<div class="box-body">
		<table class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>姓名</th>
					<th>学号</th>
					<th>性别</th>
					<th>考勤状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tcsModel" items="${tcsModels}">
					<tr>
						<td>${tcsModel.student.name}</td>
						<td>${tcsModel.student.num}</td>
						<c:if test="${tcsModel.student.sex==1}">
							<td>男</td>
						</c:if>
						<c:if test="${tcsModel.student.sex==0}">
							<td>女</td>
						</c:if>
						<c:if test="${tcsModel.tcs.state==1}">
							<td><span>已到</span> <select class="form-control disappear">
									<option selected value="1">已到</option>
									<option value="0">缺勤</option>
							</select>
							</td>
						</c:if>
						<c:if test="${tcsModel.tcs.state==0}">
							<td><span>缺勤</span> <select class="form-control disappear">
									<option value="1">已到</option>
									<option selected value="0">缺勤</option>
							</select>
							</td>
						</c:if>
						<td style="width:7%"><a class="modify"
							data-tcsid="${tcsModel.tcs.id}">修改</a> <span
							class="modifybtn disappear"> <a class="sure"
								data-tcsid="${tcsModel.tcs.id}">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								class="cancel">取消</a> </span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	$('.modify').click(
			function() {
				$this = $(this);
				$this.addClass('disappear');
				$this.next().removeClass('disappear');
				$this.parent().prev().addClass('pd3').find('span').addClass(
						'disappear').end().find('select').removeClass(
						'disappear');
			});
	$('.cancel').click(
			function() {
				var $thisparent = $(this).parent();
				$thisparent.addClass('disappear');
				$thisparent.prev().removeClass('disappear');
				$thisparent.parent().prev().removeClass('pd3').find('span')
						.removeClass('disappear').end().find('select')
						.addClass('disappear');
			});
	$('.sure').click(function() {
		var tcsid = $(this).data('tcsid');
		var $thisparent = $(this).parent();
		var $pretd = $thisparent.parent().prev();
		var $span = $pretd.find('span');
		var $select = $pretd.find('select');
		$.post('kebiao/modifystate', {
			tcsid : tcsid,
			state : $select.val()
		}, function(result) {
			if (result.code == 1) {
				layer.closeAll();
				layer.msg(result.message);
				$thisparent.addClass('disappear');
				$thisparent.prev().removeClass('disappear');
				
				if ($select.val() == 1)
					$pretd.text('已到');
				else
					$pretd.text('缺勤');
				$pretd.removeClass('pd3');
				$span.removeClass('disappear');
				$select.addClass('disappear');

			} else if (result.code == 303) {
				layer.msg(result.message);
				gotologin();
			} else {
				layer.msg(result.message);
			}
		});
	});
</script>