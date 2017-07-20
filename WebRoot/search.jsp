<%@ page language="java" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('.allsort').hover(function() {
			$('#div_allsort').show();
		}, function() {
			$('#div_allsort').hide();
		});
	});
</script>
<div class="searchbar">
	<div class="allsort">
		<a href="javascript:void(0);">全部商品分类</a>

		<!--总的商品分类-开始-->
		<ul class="sortlist" id='div_allsort' style='display:none'>
			<li>
				<h2>
					<a href="">手机</a>
				</h2>
			</li>
			<li>
				<h2>
					<a href="">平板</a>
				</h2>
			</li>
		</ul>
	</div>

	<div class="searchbox">
		<form method='get' action=''>
			<input type='hidden' name='controller' value='site' /> <input
				type='hidden' name='action' value='search_list' /> <input
				class="text" type="text" name='word' autocomplete="off"
				value="输入关键字..." /> <input class="btn" type="submit" value="商品搜索"
				onclick="checkInput('word','输入关键字...');" />
		</form>

	</div>
	<div class="hotwords">热门搜索：</div>
</div>