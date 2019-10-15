<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<!DOCTYPE html>
	<div class="clearfix content">
		<h1>${landsDTO.landsName }</h1>
		<div class="clearfix post-meta">
			<p>
				<span><i class="fa fa-clock-o"></i> Địa chỉ:
					${landsDTO.address }</span> <span><i class="fa fa-folder"></i> Diện
					tích: ${landsDTO.area }m2</span>
			</p>
		</div>
		<div class="vnecontent">
			<p>${landsDTO.description}</p>
		</div>
		<a class="btn" href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id - 1}.html">Bài trước</a> <a class="btn" href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id +1 }.html">Bài kế</a>
	</div>
	<div class="more_themes">
		<h2>
			Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i>
		</h2>
		<div class="more_themes_container">
			<c:forEach items="${listLands}" var="lands">
				<c:if test="${lands.id != landsDTO.id}">
					<div class="single_more_themes floatleft">
						<img
							src="${pageContext.request.contextPath}/uploads/${lands.picture}"
							alt="" /> <a
							href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id }.html"><h2>${lands.landsName }</h2></a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>