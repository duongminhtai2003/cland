<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<ul class="comment-list">
	<li class="comment">
		<div class="comment-body">
			<c:forEach items="${listComment }" var="comment">
				<p>
					<i style="color: green; margin-right: 10px">${comment.dateCreate }</i>
					<strong>${comment.fullname }:</strong>
					<span> ${comment.content }</span>
				</p>
				<br>
			</c:forEach>
		</div>
	</li>
</ul>
