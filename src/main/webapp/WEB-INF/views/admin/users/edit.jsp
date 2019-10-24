<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">
	<h1>${msg }</h1>
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Sửa người dùng</div>
			</div>
			<div class="content-box-large box-with-header">
				<form
					action="${pageContext.request.contextPath }/admin/users/edit/${users.id}"
					method="post">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="name">Fullname</label> <input type="text"
										class="form-control" placeholder="Nhập họ tên" name="fullname"
										value="${users.fullname }">
								</div>

								<div class="form-group">
									<label for="name">Username</label> <input type="text"
										class="form-control" placeholder="Nhập username"
										name="username" required="required" value="${users.username }">
								</div>

								<div class="form-group">
									<label for="name">Password</label> <input type="password"
										class="form-control" placeholder="Nhập password"
										name="password" value="${users.password}">
								</div>

								<div class="form-group">
									<label>Quyền</label> <select class="form-control" name="roleid">
										<option value="${users.roleid}">${users.roleName }</option>
										<c:if test="${users.roleid == 1}">
											<option value="2">USER</option>
										</c:if>
										<c:if test="${users.roleid == 2}">
											<option value="1">ADMIN</option>
										</c:if>
									</select>
								</div>


							</div>
						</div>

						<hr>

						<div class="row">
							<div class="col-sm-12">
								<input type="submit" value="Sửa" class="btn btn-success" /> <input
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