<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
								<td class="fc-widget-content"><div
										class="fc-day-grid-container">
										<div class="fc-day-grid">
											<div class="fc-row fc-week fc-widget-content"
												style="height: 80px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>

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
														<thead>
															<tr>

																<td >1</td>
																<td >2</td>
																<td >3</td>
																<td >4</td>
																<td >5</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>1</td>
																<td>2</td>
																<td>3</td>
																<td>4</td>
																<td>5</td>
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