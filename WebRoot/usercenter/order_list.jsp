<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>我的订单_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript">
	$(function() {
		setSelectedClass("usercenter/order_list.jsp");
	});
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">
				<div class="uc_title m_10">
					<label class="current"><span>我的订单</span></label>
				</div>
				<div class="box m_10">
					<table class="list_table" width="100%" cellpadding="0"
						cellspacing="0">
						<col width="140px" />
						<tr>
							<th>订单编号</th>
							<th>下单日期</th>
							<th>收货人</th>
							<th>支付方式</th>
							<th>总金额</th>
							<th>订单状态</th>
						</tr>
						<c:forEach begin="1" end="5">
							<tr>
								<td><a href="usercenter/order_view.jsp" class="orange">20150501201339443240</a></td>
								<td>2015-05-01 20:13:39</td>
								<td>谭岚</td>
								<td>预存款支付</td>
								<td>￥5800.00</td>
								<td><b class="orange">等待付款</b></td>
							<tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="6" class="t_l"><div class='pages_bar'>
										<a href=''>首页</a><a class='current_page' href=''>1</a><a
											href=''>尾页</a><span>当前第1页/共1页</span>
									</div></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp" />
		<jsp:include page="../footer.jsp" />
	</div>

</body>
</html>
