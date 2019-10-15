<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<!DOCTYPE html>


<div class="clearfix slider">
	<ul class="pgwSlider">

		<c:forEach items="${listLandsLatest}" var="landsLatest">
			<li><img
				src="${pageContext.request.contextPath}/uploads/${landsLatest.picture}"
				alt="Paris, France"
				data-description="${landsLatest.landsName}"
				data-large-src="${pageContext.request.contextPath}/uploads/${landsLatest.picture}" /></li>
		</c:forEach>

	</ul>
</div>

<div class="clearfix content">
	<div class="content_title">
		<h2>Bài viết mới</h2>
	</div>
	<c:if test="${not empty listLands }">
		<c:forEach items="${listLands }" var="lands">
			<fmt:formatDate value="${lands.dateCreate}" var="date" pattern="dd" />
			<fmt:formatDate value="${lands.dateCreate}" var="month" pattern="MM" />
			<div class="clearfix single_content">
				<div class="clearfix post_date floatleft">
					<div class="date">
						<h3>${date}</h3>
						<p>Tháng ${month}</p>
					</div>
				</div>
				<div class="clearfix post_detail">
					<h2>
						<a
							href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id }.html">${lands.landsName }</a>
					</h2>
					<div class="clearfix post-meta">
						<p>
							<span><i class="fa fa-clock-o"></i> Địa chỉ:
								${lands.address }</span> <br> <span><i class="fa fa-folder"></i>
								Diện tích: ${lands.area }</span>
						</p>
					</div>
					<div class="clearfix post_excerpt">
						<img
							src="${pageContext.request.contextPath}/uploads/${lands.picture}"
							alt="" />
						<p>${lands.countViews }</p>
					</div>
					<a
						href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id }.html">Đọc
						thêm</a>
				</div>
			</div>
		</c:forEach>
	</c:if>


</div>

<div class="pagination">
	<nav>
		<ul>
			<li><a href=""> << </a></li>
			<c:forEach begin="1" end="${totalPage }" var="i">
				<li <c:if test="${page == i}"> class='active'</c:if>><a
					href="${pageContext.request.contextPath }/home/${i}">${i }</a></li>
			</c:forEach>
			<li><a href=""> >> </a></li>
		</ul>
	</nav>
</div>


<!-- Pagination -->
