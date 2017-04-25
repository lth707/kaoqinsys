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
													<th class="fc-day-header fc-widget-header fc-sun">Sun</th>
													<th class="fc-day-header fc-widget-header fc-mon">Mon</th>
													<th class="fc-day-header fc-widget-header fc-tue">Tue</th>
													<th class="fc-day-header fc-widget-header fc-wed">Wed</th>
													<th class="fc-day-header fc-widget-header fc-thu">Thu</th>
													<th class="fc-day-header fc-widget-header fc-fri">Fri</th>
													<th class="fc-day-header fc-widget-header fc-sat">Sat</th>
												</tr>
											</thead>
										</table>
									</div></td>
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
																<td
																	class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																	data-date="2019-06-30"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"
																	data-date="2019-07-01"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"
																	data-date="2019-07-02"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"
																	data-date="2019-07-03"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"
																	data-date="2019-07-04"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"
																	data-date="2019-07-05"></td>
																<td class="fc-day fc-widget-content fc-sat fc-future"
																	data-date="2019-07-06"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td
																	class="fc-day-number fc-sun fc-other-month fc-future"
																	data-date="2019-06-30">30</td>
																<td class="fc-day-number fc-mon fc-future"
																	data-date="2019-07-01">1</td>
																<td class="fc-day-number fc-tue fc-future"
																	data-date="2019-07-02">2</td>
																<td class="fc-day-number fc-wed fc-future"
																	data-date="2019-07-03">3</td>
																<td class="fc-day-number fc-thu fc-future"
																	data-date="2019-07-04">4</td>
																<td class="fc-day-number fc-fri fc-future"
																	data-date="2019-07-05">5</td>
																<td class="fc-day-number fc-sat fc-future"
																	data-date="2019-07-06">6</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="height: 80px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-sun fc-future"
																	data-date="2019-07-07"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"
																	data-date="2019-07-08"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"
																	data-date="2019-07-09"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"
																	data-date="2019-07-10"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"
																	data-date="2019-07-11"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"
																	data-date="2019-07-12"></td>
																<td class="fc-day fc-widget-content fc-sat fc-future"
																	data-date="2019-07-13"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td class="fc-day-number fc-sun fc-future"
																	data-date="2019-07-07">7</td>
																<td class="fc-day-number fc-mon fc-future"
																	data-date="2019-07-08">8</td>
																<td class="fc-day-number fc-tue fc-future"
																	data-date="2019-07-09">9</td>
																<td class="fc-day-number fc-wed fc-future"
																	data-date="2019-07-10">10</td>
																<td class="fc-day-number fc-thu fc-future"
																	data-date="2019-07-11">11</td>
																<td class="fc-day-number fc-fri fc-future"
																	data-date="2019-07-12">12</td>
																<td class="fc-day-number fc-sat fc-future"
																	data-date="2019-07-13">13</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="height: 80px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-sun fc-future"
																	data-date="2019-07-14"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"
																	data-date="2019-07-15"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"
																	data-date="2019-07-16"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"
																	data-date="2019-07-17"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"
																	data-date="2019-07-18"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"
																	data-date="2019-07-19"></td>
																<td class="fc-day fc-widget-content fc-sat fc-future"
																	data-date="2019-07-20"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td class="fc-day-number fc-sun fc-future"
																	data-date="2019-07-14">14</td>
																<td class="fc-day-number fc-mon fc-future"
																	data-date="2019-07-15">15</td>
																<td class="fc-day-number fc-tue fc-future"
																	data-date="2019-07-16">16</td>
																<td class="fc-day-number fc-wed fc-future"
																	data-date="2019-07-17">17</td>
																<td class="fc-day-number fc-thu fc-future"
																	data-date="2019-07-18">18</td>
																<td class="fc-day-number fc-fri fc-future"
																	data-date="2019-07-19">19</td>
																<td class="fc-day-number fc-sat fc-future"
																	data-date="2019-07-20">20</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="height: 80px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-sun fc-future"
																	data-date="2019-07-21"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"
																	data-date="2019-07-22"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"
																	data-date="2019-07-23"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"
																	data-date="2019-07-24"></td>
																<td class="fc-day fc-widget-content fc-thu fc-future"
																	data-date="2019-07-25"></td>
																<td class="fc-day fc-widget-content fc-fri fc-future"
																	data-date="2019-07-26"></td>
																<td class="fc-day fc-widget-content fc-sat fc-future"
																	data-date="2019-07-27"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td class="fc-day-number fc-sun fc-future"
																	data-date="2019-07-21">21</td>
																<td class="fc-day-number fc-mon fc-future"
																	data-date="2019-07-22">22</td>
																<td class="fc-day-number fc-tue fc-future"
																	data-date="2019-07-23">23</td>
																<td class="fc-day-number fc-wed fc-future"
																	data-date="2019-07-24">24</td>
																<td class="fc-day-number fc-thu fc-future"
																	data-date="2019-07-25">25</td>
																<td class="fc-day-number fc-fri fc-future"
																	data-date="2019-07-26">26</td>
																<td class="fc-day-number fc-sat fc-future"
																	data-date="2019-07-27">27</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="height: 80px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td class="fc-day fc-widget-content fc-sun fc-future"
																	data-date="2019-07-28"></td>
																<td class="fc-day fc-widget-content fc-mon fc-future"
																	data-date="2019-07-29"></td>
																<td class="fc-day fc-widget-content fc-tue fc-future"
																	data-date="2019-07-30"></td>
																<td class="fc-day fc-widget-content fc-wed fc-future"
																	data-date="2019-07-31"></td>
																<td
																	class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																	data-date="2019-08-01"></td>
																<td
																	class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																	data-date="2019-08-02"></td>
																<td
																	class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																	data-date="2019-08-03"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td class="fc-day-number fc-sun fc-future"
																	data-date="2019-07-28">28</td>
																<td class="fc-day-number fc-mon fc-future"
																	data-date="2019-07-29">29</td>
																<td class="fc-day-number fc-tue fc-future"
																	data-date="2019-07-30">30</td>
																<td class="fc-day-number fc-wed fc-future"
																	data-date="2019-07-31">31</td>
																<td
																	class="fc-day-number fc-thu fc-other-month fc-future"
																	data-date="2019-08-01">1</td>
																<td
																	class="fc-day-number fc-fri fc-other-month fc-future"
																	data-date="2019-08-02">2</td>
																<td
																	class="fc-day-number fc-sat fc-other-month fc-future"
																	data-date="2019-08-03">3</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="fc-row fc-week fc-widget-content"
												style="height: 81px;">
												<div class="fc-bg">
													<table>
														<tbody>
															<tr>
																<td
																	class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																	data-date="2019-08-04"></td>
																<td
																	class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																	data-date="2019-08-05"></td>
																<td
																	class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																	data-date="2019-08-06"></td>
																<td
																	class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																	data-date="2019-08-07"></td>
																<td
																	class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																	data-date="2019-08-08"></td>
																<td
																	class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																	data-date="2019-08-09"></td>
																<td
																	class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																	data-date="2019-08-10"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="fc-content-skeleton">
													<table>
														<thead>
															<tr>
																<td
																	class="fc-day-number fc-sun fc-other-month fc-future"
																	data-date="2019-08-04">4</td>
																<td
																	class="fc-day-number fc-mon fc-other-month fc-future"
																	data-date="2019-08-05">5</td>
																<td
																	class="fc-day-number fc-tue fc-other-month fc-future"
																	data-date="2019-08-06">6</td>
																<td
																	class="fc-day-number fc-wed fc-other-month fc-future"
																	data-date="2019-08-07">7</td>
																<td
																	class="fc-day-number fc-thu fc-other-month fc-future"
																	data-date="2019-08-08">8</td>
																<td
																	class="fc-day-number fc-fri fc-other-month fc-future"
																	data-date="2019-08-09">9</td>
																<td
																	class="fc-day-number fc-sat fc-other-month fc-future"
																	data-date="2019-08-10">10</td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.box-body -->