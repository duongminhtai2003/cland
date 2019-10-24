<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý tin tức</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<a href="${pageContext.request.contextPath}/admin/lands/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
			<form action="${pageContext.request.contextPath}/admin/lands/search" method="get">
				<div class="col-md-2" style="margin-bottom: 0px">
					<div class="form-group">
						<select class="form-control" id="exampleFormControlSelect1" name="option">
							<option value="landsName">Tên tin tức</option>
							<option value="catName">Danh mục tin</option>
							<option value="address">Địa điểm</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="input-group form">
						<input type="text" name="str" class="form-control" value="" placeholder="Search..."> <span class="input-group-btn">
						<input class="btn btn-primary" type="submit" value="Search">
						</span>
					</div>
				</div>
			</form>
		</div>
		<h1>${msg }</h1>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên</th>
							<th>Danh mục</th>
							<th>Địa điểm</th>
							<th>Hình ảnh</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty listLands }">
								<c:forEach items="${listLands }" var="lands">
									<c:set var="urlEdit"
										value="${pageContext.request.contextPath}/admin/lands/edit/${lands.id}" />
									<c:set var="urlDel"
										value="${pageContext.request.contextPath}/admin/lands/del/${lands.id}" />
									<tr class="odd gradeX">
										<td>${lands.id }</td>
										<td>${lands.landsName }</td>
										<td>${lands.catName }</td>
										<td class="center">${lands.address }</td>
										<td class="center text-center"><img width="300px"
											height="200px"
											src="${pageContext.request.contextPath}/uploads/${lands.picture}" />
										</td>
										<td class="center text-center"><a href="${urlEdit }"
											title="" class="btn btn-primary"><span
												class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
											href="${urlDel }" title="" class="btn btn-danger"><span
												class="glyphicon glyphicon-trash"></span> Xóa</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>không có tin tức</p>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- Pagination -->
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
											href="${pageContext.request.contextPath}/admin/lands/index/${currentPage-1}"><<</a></li>
									</c:if>
									<c:forEach begin="1" end="${numberOfPage }" var="i">
										<c:if test="${currentPage == i }">
											<c:set var="active" value="active" />
										</c:if>
										<c:if test="${currentPage != i }">
											<c:set var="active" value="" />
										</c:if>
										<li class="paginate_button ${active }"
											aria-controls="dataTables-example" tabindex="0"><a
											href="${pageContext.request.contextPath}/admin/lands/index/${i}">${i }</a></li>
									</c:forEach>
									<c:if test="${currentPage < numberOfPage }">
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a
											href="${pageContext.request.contextPath}/admin/lands/index/${currentPage + 1}">>></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.content-box-large -->
		</div>
	</div>
</div>