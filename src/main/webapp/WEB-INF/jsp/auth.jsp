<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.form-group {
	overflow: hidden;
}
</style>
<div class="box box-primary">
	<div class="box-header">
		<button class="btn btn-primary pull-right" id="add_teacher">添加老师</button>
	</div>
	<div class="box-body">
		<table class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>姓名</th>
					<th>教工号</th>
					<th>性别</th>
					<th>管理员</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="teacher" items="${teachers}">
					<tr>
						<td>${teacher.name}</td>
						<td>${teacher.num}</td>
						<c:if test="${teacher.sex==1}">
							<td>男</td>
						</c:if>
						<c:if test="${teacher.sex==0}">
							<td>女</td>
						</c:if>
						<c:if test="${teacher.isadmin==1}">
							<td>是</td>
						</c:if>
						<c:if test="${teacher.isadmin==0}">
							<td>否</td>
						</c:if>
						<td><a data-teacherid='${teacher.id}' class="setasadmin">
								<c:if test="${teacher.isadmin==1}">
								取消管理员
						</c:if> <c:if test="${teacher.isadmin==0}">
								设置为管理员
						</c:if> </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$(function() {
		$('.setasadmin').click(function() {
			var teacher_id = $(this).data('teacherid');
			$.post('modifyTeacher', {
				teacher_id : teacher_id
			}, function(result) {
				layer.msg(result.message);
				if (result.code == 1) {
					$('#content').load("auth");
				} else if (result.code == 303) {
					gotologin();
				}
			});
		});

		$('#add_teacher').click(function() {

			layer.open({
				type : 1,
				title : '添加老师',
				scrollbar : false,
				area : [ '600px', '' ],
				content : $('#addteacherdiv')
			});
		});
		$('#confirmadd').unbind('click');
		$('#confirmadd').click(
				function(e) {
					var $form = $('#addteacherform');
					var validfield = true;
					$form.find('input').not(':radio').each(
							function(i, e) {
								if ($(e).attr('id') != 'password') {
									var val = $(e).val().trim();
									if (!val) {
										layer.tips($(e).attr('placeholder')
												+ '不能为空', $(e));
										validfield = false;
										return false;
									}
								}
							});
					if (validfield) {
						$.post($form.attr('action'), $form.serialize(),
								function(result) {
									if (result.code == 1) {
										layer.closeAll();
										layer.msg(result.message);
										$('#content').load("auth");
									} else if (result.code == 303) {
										layer.msg(result.message);
										gotologin();
									} else {
										layer.msg(result.message);
									}
								});
					}
					return false;
				});
	});
</script>