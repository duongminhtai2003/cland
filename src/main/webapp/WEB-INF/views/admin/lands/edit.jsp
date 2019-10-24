<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">
	${msg }
	<div class="row">
		<div class="col-md-12 panel-info">
			<div class="content-box-header panel-heading">
				<div class="panel-title ">Sửa tin tức</div>
			</div>
			<div class="content-box-large box-with-header">
				<form
					action="${pageContext.request.contextPath }/admin/lands/edit/${lands.id}"
					method="POST" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Tên tin tức</label> <input type="text"
									class="form-control" placeholder="Nhập tên tin tức" name="name"
									value="${lands.landsName }">
							</div>

							<div class="form-group">
								<label>Danh mục tin</label> <select class="form-control"
									name="cid">
									<option value="${lands.cid }">${lands.catName }</option>
									<c:forEach items="${listCat}" var="cat">
										<c:if test="${cat.id != lands.cid}">
											<option value="${cat.id }">${cat.catName }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>Thêm hình ảnh</label> <input type="file"
									class="btn btn-default" id="exampleInputFile1" name="file">
								<p class="help-block">
									<em>Định dạng: jpg, png, jpeg,...</em>
								</p>
							</div>

							<div class="form-group">
								<label for="name">Diện tích</label> <input type="text"
									class="form-control" placeholder="Nhập diện tích" name="area"
									value="${lands.area }">
							</div>

							<div class="form-group">
								<label for="name">Địa chỉ</label> <input type="text"
									class="form-control" placeholder="Nhập địa chỉ" name="address"
									value="${lands.address }">
							</div>

							<div class="form-group">
								<label>Mô tả</label>
								<textarea class="form-control" rows="3" name="description">${lands.description }</textarea>
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

				</form>
			</div>
		</div>
	</div>
	<!-- /.row col-size -->

</div>
<!-- /.col-md-10 -->