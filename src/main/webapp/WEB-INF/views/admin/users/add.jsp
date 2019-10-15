<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
 <div class="col-md-10">
		<h1>${msg }</h1>
	  			<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm người dùng</div>
			  			</div>
			  			<div class="content-box-large box-with-header">
			  			<form action="${pageContext.request.contextPath }/admin/users/add" method="post">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Fullname</label>
											<input type="text" class="form-control" placeholder="Nhập họ tên" name="fullname">
										</div>
										
										<div class="form-group">
											<label for="name">Username</label>
											<input type="text" class="form-control" placeholder="Nhập username" name="username">
										</div>
										
										<div class="form-group">
											<label for="name">Password</label>
											<input type="password" class="form-control" placeholder="Nhập password" name="password">
										</div>
										
										<div class="form-group">
											<label for="name">Nhập lại Password</label>
											<input type="password" class="form-control" placeholder="Nhập lại password" name="password1">
										</div>
										
									</div>
								</div>
								
								<hr>

								<div class="row">
									<div class="col-sm-12">
										<input type="submit" value="Thêm" class="btn btn-success" />
										<input type="reset" value="Nhập lại" class="btn btn-default" />
									</div>
								</div>

							</div>
							</form>
						</div>
			  		</div>
	  			</div><!-- /.row col-size -->
	  		
		  </div><!-- /.col-md-10 -->