<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<meta charset="utf-8" />
<title>${goods.name}_${site}</title>
<jsp:include page="base.jsp" />
<script src="js/jquery-2.0.3.js" type="text/javascript"></script>
<script type="text/javascript">
	function buy_now() {
		location.href = "order_add.jsp";
	}
	$(function() {
		$('[name="showButton"]>label').click(
						function() {
							$(this).siblings().removeClass('current');
							if ($(this).hasClass('current') == false) {
								$(this).addClass('current');
							}
							$('[name="showBox"]>div').addClass('hidden');
							$('[name="showBox"]>div:eq('+ $(this).index() + ')').removeClass('hidden');
							if ($(this).index() == 1) {
								$("#commentBox").empty();
								$.getJSON("judgeservlet?opr=list&goodsid=${goods.id}",
												function(pager) {
													for (var i = 0; i < pager.data.length; i++) {
														var html = template(
																'commentTelplate',
																pager.data[i]);
														$("#commentBox")
																.prepend(html);
													}
													$("#p11").empty();
													for (var i = 1; i <= pager.totalPage; i++) {
														var option = new Option(
																i, i);
														$("#p11")
																.append(option);
													}
												});

							}

						});
		
		  $("#add").on("click",function(){
			  $("#buyNums").val(parseInt($("#buyNums").val())+1);
		  });
		  $("#reduce").on("click",function(){
			  if($("#buyNums").val()==1){
				  return;
			  }
			  $("#buyNums").val(parseInt($("#buyNums").val())-1);
		  });

		});


	function order_add() {
		var nums = document.getElementById("buyNums").value;
		location.href = "orderservlet?opr=initadd&id=${goods.id}&nums=" + nums;
	}
	
	//加入购物车
	function joinCart(){
		alert("${goods.id}");
		alert($('#buyNums').val());
	}
</script>

</head>
<body class="index">
	<div id="content"></div>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<div class="summary">
				<h2>${goods.name}</h2>
				<!--基本信息区域-->
				<ul>
					<li><span class="f_r light_gray">商品编号：<label
							id="data_goodsNo">${goods.goodsNo}</label></span></li>
					<li id="priceLi">销售价：<b class="price red2"><span
							class="f30" id="real_price">￥${goods.price2}</span></b></li>
					<li>市场价：<s id="data_marketPrice">￥${goods.price1}</s>
					</li>
					<li>库存：现货<span>(<label id="data_storeNums">${goods.stock}</label>)
					</span></li>
					<li>顾客评分：<span class="grade"><i style="width:0px;"></i></span>(已有0人评价)
					</li>
				</ul>
				<div class="current">
					<dl class="m_10 clearfix">
						<dt>购买数量：</dt>
						<dd>
							<input class="gray_t f_l" type="text" id="buyNums" value="1"
								maxlength="5" />
							<div class="resize">
								<a class="add" id="add"></a> <a class="reduce" id="reduce"></a>
							</div>
						</dd>
					</dl>
					<input class="submit_buy" type="button" id="buyNowButton"
						value="立即购买" onclick="location.href='order_add.jsp'" />

					<div class="shop_cart" style="z-index:1">
						<input class="submit_join" type="button" id="joinCarButton"
							onclick="joinCart();" value="加入购物车" />

						<div class="shopping" id="product_myCart" style='display:none'>
							<dl class="cart_stats">
								<dt class="gray f14 bold">
									<a class="close_2 f_r" href="javascript:closeCartDiv();"
										title="关闭">关闭</a> <img src="images/front/right_s.gif"
										width="24" height="24" alt="" />成功加入购物车
								</dt>
								<dd class="gray">
									目前选购商品共<b class="orange" name='mycart_count'></b>件<span>合计：<b
										name='mycart_sum'></b></span>
								</dd>
								<dd>
									<a class="btn_blue bold" href="">进入购物车</a><a
										class="btn_blue bold" href="javascript:void(0)"
										onclick="">继续购物>></a>
								</dd>
							</dl>
						</div>
					</div>
				</div>

			</div>

			<!--图片放大镜-->
			<div>
				<div class="pic_show"
					style="width:435px;height:435px;position:relative;z-index:5;padding-bottom:5px;">
					<img src="${goods.thumbnail}" title="苹果（Apple）iPhone 6 (A1586) 64GB"
						style="border:none;width:435px;height:435px" />
				</div>
			</div>
		</div>

		<div class="wrapper clearfix container_2">
			<!--左边栏-->
			<div class="sidebar f_l">
				<div class="box m_10">
					<div class="title">热卖商品</div>
					<div class="content">
						<ul class="ranklist">
							<c:forEach begin="1" end="5">
								<li class="current"><a href=""><img width="58px"
										height="58px" alt="苹果（Apple）iPhone 6 (A1586) 64GB"
										src="images/goods/apple.jpg" /></a> <a
									title="苹果（Apple）iPhone 6 (A1586) 64GB" class="p_name" href="">苹果（Apple）iPhone
										6 (A1586) 64GB</a> <b>￥5688.00</b></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<!--滑动面tab标签-->
			<div class="main f_r" style="overflow:hidden">
				<div class="uc_title" name="showButton">
					<label class="current"><span>商品详情</span></label> <label><span>顾客评价(0)</span></label>
					<label><span>购买记录(1)</span></label>
				</div>
				<div name="showBox">
					<!-- 商品详情 start -->
					<div>${goods.description}</div>
					<!-- 商品详情 end -->

					<!-- 顾客评论 start -->
					<div class="hidden comment_list box">
						<div class="title3">
							<span class="f_r f12 light_gray normal"> 只有购买过该商品的用户才能进行评价
							</span> <img src="images/front/comm.gif" width="16px" height="16px" />商品评论<span
								class="f12 normal">（已有<b class="red2">0</b>条）
							</span>
						</div>
						<c:if test="${not empty sessionScope.user}">
							<div>
								<textarea id="judgecontent"></textarea>
								<input type="button" value="发表" id="judge" />
							</div>
						</c:if>
						<div id='commentBox'></div>
					</div>
					<!-- 顾客评论 end -->

					<!-- 购买记录 start -->
					<div class="hidden box">
						<div class="title3">
							<img src="images/front/cart.gif" width="16" height="16" alt="" />
							购买记录<span class="f12 normal">（已有<b class="red2">1</b>购买）
							</span>
						</div>

						<table width="100%" class="list_table m_10 mt_10">
							<col width="150" />
							<col width="120" />
							<col width="120" />
							<col width="150" />
							<col />
							<thead class="thead">
								<tr>
									<th>购买人</th>
									<th>出价</th>
									<th>数量</th>
									<th>购买时间</th>
									<th>状态</th>
								</tr>
							</thead>
						</table>
						<table width="100%" class="list_table m_10">
							<col width="150" />
							<col width="120" />
							<col width="120" />
							<col width="150" />
							<col />
							<tbody class="dashed" id="historyBox"></tbody>
						</table>
					</div>
					<!-- 购买记录 end -->
				</div>
			</div>
		</div>
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>