<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var x_timer;
		$("#username").keyup(function(e) {
			clearTimeout(x_timer);
			var user_name = $(this).val();
			x_timer = setTimeout(function() {
				check_username_ajax(user_name);
			}, 500);
		});

		function check_username_ajax(username) {
			$.post('${pageContext.request.contextPath }/admin/users/checkUsername', {
				'username' : username
			}, function(data) {
				$("#user-result").html(data);
			});
		}
	});
</script>
<div class="col-md-10">
	<h1>${msg }</h1>
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Thêm người dùng</div>
			</div>
			<div class="content-box-large box-with-header">
				<form action="${pageContext.request.contextPath }/admin/users/add"
					method="post">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="name">Fullname</label>
									<form:errors path="users.fullname" cssStyle="color:red" />
									<br> <input type="text" class="form-control"
										placeholder="Nhập họ tên" name="fullname">
								</div>

								<div class="form-group">
									<div id="user-result"></div>
									<label for="name">Username</label>
									<form:errors path="users.username" cssStyle="color:red" />
									<br> <input type="text" class="form-control"
										placeholder="Nhập username" name="username" id="username">
								</div>

								<div class="form-group">
									<label for="name">Password</label>
									<form:errors path="users.password" cssStyle="color:red" />
									<br> <input type="password" class="form-control"
										placeholder="Nhập password" name="password">
								</div>

								<div class="form-group">
									<label for="name">Nhập lại Password</label> <input
										type="password" class="form-control"
										placeholder="Nhập lại password" name="password1">
								</div>

								<div class="form-group">
									<label>Quyền</label> <select class="form-control" name="roleid">
										<option value="">Lựa chọn quyền cho tài khoản</option>
										<option value="1">ADMIN</option>
										<option value="2">USER</option>
									</select>
								</div>

							</div>
						</div>

						<hr>

						<div class="row">
							<div class="col-sm-12">
								<input type="submit" value="Thêm" class="btn btn-success" /> <input
									type="reset" value="Nhập lại" class="btn btn-default" />
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /.row col-size -->

</div>
<!-- /.col-md-10 -->