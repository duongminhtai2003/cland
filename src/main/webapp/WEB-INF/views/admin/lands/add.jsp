<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
 <div class="col-md-10">
	  			<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm tin tức</div>
			  			</div>
			  			<div class="content-box-large box-with-header">
			  			<form action="${pageContext.request.contextPath }/admin/lands/add" method="post" enctype="multipart/form-data">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Tên tin tức</label>
											<form:errors path="lands.name" cssStyle="color:red; font-size: 20px"/> <br>
											<input type="text" class="form-control" placeholder="Nhập tên tin tức" name="name">
										</div>
										
										<div class="form-group">
											<label>Danh mục tin</label>
											<select class="form-control" name="cid">
											   	<c:forEach items="${listCat}" var="cat">
											   		<option value="${cat.id }">${cat.catName }</option>
											   	</c:forEach>
											   
											</select>
										</div>

										<div class="form-group">
											<label>Thêm hình ảnh</label>
											<input type="file" class="btn btn-default" id="exampleInputFile1" name="file">
											<p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
										</div>
										
										<div class="form-group">
											<label for="name">Diện tích</label>
											<form:errors path="lands.area" cssStyle="color:red; font-size: 20px"/> <br>
											<input type="text" class="form-control" placeholder="Nhập diện tích" name="area">
										</div>
										
										<div class="form-group">
											<label for="name">Địa chỉ</label>
											<form:errors path="lands.address" cssStyle="color:red; font-size: 20px"/> <br>
											<input type="text" class="form-control" placeholder="Nhập địa chỉ" name="address">
										</div>
										
										<div class="form-group">
										   <label>Mô tả</label>
										   <form:errors path="lands.description" cssStyle="color:red; font-size: 20px"/> <br>
										   <textarea class="form-control" rows="3" name="description"></textarea>
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