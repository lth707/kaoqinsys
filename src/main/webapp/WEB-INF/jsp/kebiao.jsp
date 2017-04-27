<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.fc-row .fc-content-skeleton td {
	text-align: center;
	vertical-align: middle;
}

.fc-row table {
	height: 70px;
}

.fc-row .fc-content-skeleton {
	padding-bottom: 0px;
}
</style>
<div class="box box-primary">
	<div class="box-body no-padding">
		<!-- THE CALENDAR -->
		<div id="calendar" class="fc fc-ltr fc-unthemed">
			<div class="fc-toolbar">
				<div class="fc-left">
					<div class="fc-button-group">
						<button type="button" title="上一周"
							class="fc-prev-button fc-button fc-state-default fc-corner-left">
							<span class="fc-icon fc-icon-left-single-arrow"></span>
						</button>
						<button type="button" title="下一周"
							class="fc-next-button fc-button fc-state-default fc-corner-right">
							<span class="fc-icon fc-icon-right-single-arrow"></span>
						</button>
					</div>
					<button type="button"
						class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
						disabled="disabled">当前周</button>
				</div>
				<div class="fc-center">
					<h2>${currentdate}</h2>
				</div>
				<div class="fc-clear"></div>
			</div>
			<div class="fc-view-container" style="">
				<div class="fc-view fc-month-view fc-basic-view">
					<table>
						<thead>
							<tr>
								<td class="fc-widget-header"><div
										class="fc-row fc-widget-header">
										<table>
											<thead>
												<tr>
													<th class="fc-day-header fc-widget-header"
														style="width:10%"></th>
													<th class="fc-day-header fc-widget-header fc-sun">星期一</th>
													<th class="fc-day-header fc-widget-header fc-mon">星期二</th>
													<th class="fc-day-header fc-widget-header fc-tue">星期三</th>
													<th class="fc-day-header fc-widget-header fc-wed">星期四</th>
													<th class="fc-day-header fc-widget-header fc-thu">星期五</th>
												</tr>
											</thead>
										</table>
									</div>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="fc-widget-content">
									<div class="fc-day-grid-container">
										<div class="fc-day-grid">




											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第1节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="0" end="4">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第2节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="5" end="9">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第3节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="10" end="14">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第4节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="15" end="19">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="min-height:20px">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td colspan="6" style="text-align:center;height:30px">中午间歇</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>







											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第5节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="20" end="24">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第6节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="25" end="29">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第7节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="30" end="34">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第8节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="35" end="39">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="min-height:20px">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td colspan="6" style="text-align:center;height:30px">下午间歇</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>



											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第9节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="40" end="44">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-mon"
																	style="width:10%"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<tbody>
															<tr>
																<td style="width:10%">第10节</td>
																<c:forEach var="index" items="${fiftyArrayList}"
																	begin="45" end="49">

																	<c:set value="${courseMap.get(index)}" var="course" />
																	<c:set value="${tcsMap.get(index)}" var="tcs" />
																	<c:if test="${course!=null}">
																		<td data-tcs='${tcs}'>${course.name}</td>
																	</c:if>
																	<c:if test="${course==null}">
																		<td></td>
																	</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.box-body -->