<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="clearfix sidebar">
	<div class="clearfix single_sidebar category_items">
		<h2>Danh mục bất động sản</h2>
		<ul>
			<c:forEach items="${listCat}" var="cat">
				<li class="cat-item">
					<a href="${pageContext.request.contextPath }/cat/${SlugUtil.makeSlug(cat.catName)}-${cat.id }.html">${cat.catName }</a>(${cat.totalCat })
				</li>
			</c:forEach>
		</ul>
	</div>

	<div class="clearfix single_sidebar">
		<div class="popular_post">
			<div class="sidebar_title">
				<h2>Xem nhiều</h2>
			</div>
			<ul>
				
				<c:forEach items="${listLandsHot}" var="listLandsHot">
					<li>
					<a href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(listLandsHot.landsName)}-${listLandsHot.id }.html">${listLandsHot.landsName }</a>
						</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div class="clearfix single_sidebar">
		<h2>Danh mục hot</h2>
		<ul>
		
			<c:forEach items="${listCatHot}" var="catHot">
					<li>
						<a href="${pageContext.request.contextPath }/cat/${SlugUtil.makeSlug(catHot.catName)}-${catHot.id }.html">${catHot.catName } <span>(${catHot.totalCat })</span></a>
					</li>
				</c:forEach>
			
			
		</ul>
	</div>
</div>