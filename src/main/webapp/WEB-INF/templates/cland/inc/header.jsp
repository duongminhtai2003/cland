<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="wrapper header">
	<div class="clearfix header_top">
		<div class="clearfix logo floatleft">
			<a href="${pageContext.request.contextPath }/home">
				<h1>
					<span>C</span>Land
				</h1>
			</a>
		</div>
		<div class="clearfix search floatright">
			<form action="${pageContext.request.contextPath }/search"
				method="get">
				<select name="option">
					<option value="">--Tìm kiếm theo--</option>
					<option value="landsName">Tên tin tức</option>
					<option value="catName">Danh mục tin</option>
					<option value="address">Địa điểm</option>
				</select> 
				<input type="text" placeholder="Search" name="str" /> 
				<input type="submit" />
			</form>
		</div>
	</div>
	<div class="header_bottom">
		<nav>
			<ul id="nav">
				<li><a href="${pageContext.request.contextPath }/home">Trang
						chủ</a></li>
				<li id="dropdown"><a href="javascript:void(0)">Danh mục</a>
					<ul>
						<c:forEach items="${listCat}" var="cat">
							<li class="cat-item"><a
								href="${pageContext.request.contextPath }/cat/${SlugUtil.makeSlug(cat.catName)}-${cat.id }.html">${cat.catName }
									(${cat.totalCat })</a></li>
						</c:forEach>
					</ul></li>
				<li><a href="${pageContext.request.contextPath }/contact">Liên
						hệ</a></li>
			</ul>
		</nav>
	</div>
</div>