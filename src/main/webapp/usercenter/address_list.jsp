<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>地址管理_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript" src="js/address.js"></script>
<script type="text/javascript">
	$(function() {
		setSelectedClass("usercenter/address_list.jsp");
		for (var i = 0; i < provinceList.length; i++) {
			var option=$("<option>"+provinceList[i].name+"</option>");
			option.prop("cities",provinceList[i].cityList);
			$("#province").append(option);
		}
		changeProvince();
		changeCity();
		$("#province").on("change", changeProvince); 
		$("#city").on("change",changeCity);
	});
	function changeProvince(){
		$("#city").empty();
		var cities=$("#province").find("option:selected").prop("cities");
		for(var i=0;i<cities.length;i++){
			var option=$("<option>"+cities[i].name+"</option>");
			option.prop("area",cities[i].areaList);
			$("#city").append(option);
		}
		changeCity();
	}
	function changeCity(){
		$("#area").empty();
		var area=$("#city").find("option:selected").prop("area");
		for(var i=0;i<area.length;i++){
			var option=$("<option>"+area[i]+"</option>");
			$("#area").append(option);
		}
	}
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="main f_r">
				<div class='tabs'>
					<div class="uc_title m_10 tabs_menu">
						<label class="current node"><span>地址管理</span></label>
					</div>
					<div class='tabs_content'>
						<div id="address_list" class="form_content m_10 node">
							<div class="uc_title2 m_10">
								<strong>已保存的有效地址</strong>
							</div>
							<table class="list_table" width="100%" cellpadding="0"
								cellspacing="0">
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col />
								<thead>
									<tr>
										<th>收货人</th>
										<th>所在地区</th>
										<th>街道地址</th>
										<th>电话/手机</th>
										<th>邮编</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${addresses}" var="address">
									<tr>
										<td>${address.accept}</td>
										<td>${address.province}${address.city}${address.area}</td>
										<td>${address.address}</td> 
										<td>${address.mobile}</td>
										<td>${address.zip}</td>
										<td><a class="blue" href='javascript:void(0)' onclick=''>修改</a>|
											<a class="blue" href="javascript:void(0)" onclick="">删除</a>|
											<c:if test="${address.isdefault eq 1}"><a class="red2" href="address_setDefault?address.id=${address.id}&address.isdefault=2">取消默认</a></c:if>
											<c:if test="${address.isdefault eq 2}"><a class="blue" href="address_setDefault?address.id=${address.id}&address.isdefault=1">设为默认</a></c:if></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!--表单修改-->
				<div class="orange_box" id='address_form'>
					<form action='address_add' method='post' name='form'>
						<table class="form_table" width="100%" cellpadding="0"
							cellspacing="0">
							<col width="120px" />
							<col />
							<caption>收货地址</caption>
							<tr>
								<th><span class="red">*</span> 收货人姓名：</th>
								<td><input name='address.accept' class="normal" type="text" /><label>收货人真实姓名，方便快递公司联系。</label></td>
							</tr>
							<tr>
								<th><span class="red">*</span> 所在地区：</th>
								<td><select name="address.province" id="province"></select> <select
									name="address.city" id="city"></select> <select name="address.area" id="area"></select>
								</td>
							</tr>
							<tr>
								<th><span class="red">*</span> 街道地区：</th>
								<td><input name='address.address' class="normal" type="text" /><label>真实详细收货地址，方便快递公司联系。</label></td>
							</tr>
							<tr>
								<th>邮政编码：</th>
								<td><input name='address.zip' class="normal" type="text" /><label>邮政编码,如250000。</label></td>
							</tr>
							<tr>
								<th>电话号码：</th>
								<td><input name='address.phoneNum' class="normal" type="text" /><label>电话号码,如010-12345688。</label></td>
							</tr>
							<tr>
								<th>手机号码：</th>
								<td><input name='address.mobile' class="normal" type="text" /><label>手机号码，如：13588888888</label></td>
							</tr>
							<tr>
								<th>设为默认：</th>
								<td><label><input name='address.isdefault' type='checkbox'
										value='1'></label></td>
							</tr>
							<tr>
								<th></th>
								<td><label class="btn"><input type="submit"
										value="保存" /></label> <label class="btn"><input type="reset"
										value="取消" /></label></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
