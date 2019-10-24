<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.vinaenter.utils.SlugUtil"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<script type="text/javascript">
	function comment() {
		var lid = $('#lid').val();
		var fullname = $('#fullname').val();
		var content = $('#content').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/comment/add",
			type : 'POST',
			dataType : 'html',
			data : {
				fullname : fullname,
				content : content,
				lid : lid
			},
			success : function(data) {
				$('.comment-list').html(data);
			},
			error : function() {
				alert('Có lỗi xảy ra');
			}
		});
	}
</script>
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
</div>
<div class="clearfix content">
	<div class="contact_us">
		<br>
		<h1>Bình luận</h1>
		<form action="javascript:void(0)" onsubmit="comment()">
			<input type="text" id="lid" name="lid" value="${landsDTO.id}"
				hidden="" />
			<p>
				<form:errors path="comment.fullname" cssStyle="color:red; font-size: 20px"/> <br>
				<input type="text" id="fullname" name="fullname" class="wpcf7-text"
					placeholder="Họ tên *" />
			</p>
			<p>
				<form:errors path="comment.content" cssStyle="color:red; font-size: 20px"/> <br>
				<textarea class="wpcf7-textarea" id="content" name="content"
					placeholder="Nội dung *"></textarea>
			</p>
			<p>
				<input type="submit" class="wpcf7-submit" value="Gửi" />
			</p>
		</form>
	</div>
</div>
<div class="clearfix content">
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
</div>
<h2>
	Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i>
</h2>
<div class="more_themes_container">
	<c:forEach items="${listLands}" var="lands">
		<div class="single_more_themes floatleft">
			<img
				src="${pageContext.request.contextPath}/uploads/${lands.picture}"
				alt="" /> <a
				href="${pageContext.request.contextPath }/detail/${SlugUtil.makeSlug(lands.landsName)}-${lands.id }.html"><h2>${lands.landsName }</h2></a>
		</div>
	</c:forEach>
</div>
