<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<div class="container">
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="admin_left">
			<ul class="submenu">
				<jsp:include page="left.jsp"></jsp:include>
			</ul>
			<div id="copyright"></div>
		</div>

		<div id="admin_right">
			<div class="headbar">
				<div class="searchbar">
					<form action="/iwebshop/index.php" method="get" name="order_list">
						<input type="hidden" name="controller" value="order"> <input
							type="hidden" name="action" value="order_list"> <select
								name="pay_status" class="auto">
									<option value="">选择支付状态</option>
									<option value="0">未支付</option>
									<option value="1">已支付</option>
									<option value="2">退款成功</option>
							</select> <select name="distribution_status" class="auto">
									<option value="">选择发货状态</option>
									<option value="0">未发货</option>
									<option value="1">已发货</option>
									<option value="2">退货成功</option>
							</select> <select name="status" class="auto">
									<option value="">选择订单状态</option>
									<option value="1">新订单</option>
									<option value="2">确认订单</option>
									<option value="3">取消订单</option>
									<option value="4">作废订单</option>
									<option value="5">完成订单</option>
							</select>
								<button class="btn" type="submit">
									<span class="sel">筛 选</span>
								</button>
					</form>
				</div>
				<div class="field">
					<table class="list_table">
						<colgroup>
							<col width="30px">
								<col width="155px">
									<col width="75px">
										<col width="75px">
											<col width="75px">
												<col width="105px">
													<col width="80px">
														<col>
						</colgroup>
						<thead>
							<tr>
								<th class="t_c">选择</th>
								<th>订单号</th>
								<th>收货人</th>
								<th>支付状态</th>
								<th>发货状态</th>
								<th>配送方式</th>
								<th>支付方式</th>
								<th>用户名</th>
								<th>下单时间</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form name="orderForm" id="orderForm" action="" method="post">
				<div class="content">
					<table class="list_table">
						<colgroup>
							<col width="30px" />
							<col width="155px" />
							<col width="75px" />
							<col width="75px" />
							<col width="75px" />
							<col width="105px" />
							<col width="80px" />
							<col />
						</colgroup>
						<tbody>
							<c:forEach begin="1" end="10">
								<tr>
									<td class="t_c"><input name="" type="checkbox" value="1" /></td>
									<td title="20150502222352850558">20150502222352850558</td>
									<td title="谭岚">谭岚</td>
									<td><b class='green'>已付款</b></td>
									<td>未发货</td>
									<td title="快递">快递</td>
									<td title="预存款支付">预存款支付</td>
									<td title="谭岚">谭岚</td>
									<td title="2015-05-02 22:23:52">2015-05-02 22:23:52</td>
									<td><a href="admin/order_view.jsp"><img
											class="operator" src="images/admin/icon_check.gif" title="查看" /></a><a
										href=""><img class="operator"
											src="images/admin/icon_edit.gif" title="编辑" /></a><a
										href="javascript:void(0)" onclick=""><img class="operator"
											src="images/admin/icon_del.gif" title="删除" /></a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="pages_bar">
					<a href="">首页</a><a href="">尾页</a><span>当前第1页/共0页</span>
				</div>
			</form>
		</div>
		<div id="separator"></div>
	</div>
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>