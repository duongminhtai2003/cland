<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<!DOCTYPE html>



<div class="clearfix content">

	<div class="contact_us">

		<h1>Liên hệ với chúng tôi</h1>

		<p>
			TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VINAENTER EDU<br /> Trụ sở: 154 Phạm Như
			Xương, Liên Chiểu, Đà Nẵng<br /> Web: <a
				href="http://vinaenter.edu.vn" title="">www.vinaenter.edu.vn</a>
		</p>

		<form action="${pageContext.request.contextPath }/contact/add" method="POST">
			<p>
				<form:errors path="contact.fullname" cssStyle="color:red; font-size: 20px"/> <br>
				<input type="text" name="fullname" class="wpcf7-text" placeholder="Họ tên *" />
			</p>
			<p>
				<form:errors path="contact.email" cssStyle="color:red; font-size: 20px"/> <br>
				<input type="text" name="email" class="wpcf7-email" placeholder="Email *" />
			</p>
			<p>
				<form:errors path="contact.subject" cssStyle="color:red; font-size: 20px"/> <br>
				<input type="text" name="subject" class="wpcf7-text" placeholder="Chủ đề *" />
			</p>
			<p>
				<form:errors path="contact.content" cssStyle="color:red; font-size: 20px"/> <br>
				<textarea class="wpcf7-textarea" name="content" placeholder="Nội dung *"></textarea>
			</p>
			<p>
				<input type="submit" class="wpcf7-submit" value="Gửi liên hệ" />
			</p>
		</form>

	</div>

</div>