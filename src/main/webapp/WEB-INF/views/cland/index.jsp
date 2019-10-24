<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<!DOCTYPE html>
<div class="clearfix slider">
	<ul class="pgwSlider">

		<c:forEach items="${listLandsLatest}" var="landsLatest">
			<li>
			<a href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(landsLatest.landsName)}-${landsLatest.id }.html">
				<img src="${pageContext.request.contextPath}/uploads/${landsLatest.picture}" alt="Paris, France" data-description="${landsLatest.landsName}" data-large-src="${pageContext.request.contextPath}/uploads/${landsLatest.picture}" />
			</a>
			</li>
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
	<div class="row">
		<div class="col-sm-6" style="text-align: right;">
			<div class="dataTables_paginate paging_simple_numbers"
				id="dataTables-example_paginate">
				<ul class="pagination">
					<c:if test="${numberOfPage > 1 }">
						<c:if test="${currentPage > 1 }">
							<li class="paginate_button previous"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_previous"><a
								href="${pageContext.request.contextPath}/home/${currentPage-1}"><<</a></li>
						</c:if>
						<c:forEach begin="1" end="${numberOfPage }" var="i">
							<c:if test="${currentPage == i }">
								<c:set var="active" value="background: yellow;" />
							</c:if>
							<c:if test="${currentPage != i }">
								<c:set var="active" value="" />
							</c:if>
							<li class="paginate_button ${active }"
								aria-controls="dataTables-example" tabindex="0"><a
								style="${active}"
								href="${pageContext.request.contextPath}/home/${i}">${i }</a></li>
						</c:forEach>
						<c:if test="${currentPage < numberOfPage }">
							<li class="paginate_button next"
								aria-controls="dataTables-example" tabindex="0"
								id="dataTables-example_next"><a
								href="${pageContext.request.contextPath}/home/${currentPage + 1}">>></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>


<!-- Pagination -->
