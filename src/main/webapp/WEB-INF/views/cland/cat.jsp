<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="clearfix content">
	<div class="content_title">
		<h2>Our Works</h2>
	</div>
	<div class="clearfix single_work_container">
		<c:forEach items="${listLands }" var="lands">
			<div class="clearfix single_work">
				<img src="${pageContext.request.contextPath}/uploads/${lands.picture}" alt="" />
				<h2>${lands.landsName}</h2>
				<a href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id }.html"><p class="caption">${lands.landsName }</p></a>
				</p>
			</div>
		</c:forEach>
		<div class="clearfix work_pagination">
			<nav>
				<a class="newer floatleft" href="">-- Trang trước</a> <a
					class="older floatright" href="">Trang kế -- ></a>
			</nav>
		</div>

	</div>
</div>