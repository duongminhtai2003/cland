<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">
	<script type="text/javascript">
		function myFunction() {
		  alert(${enable});
		}
	</script>
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý danh mục</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath}/admin/lands/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
			<form action="${pageContext.request.contextPath}/admin/lands/search"
				method="get">
				<div class="col-md-4">
					<div class="input-group form">
						<input type="text" name="str" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<input class="btn btn-primary" type="submit" value="Search">
						</span>
					</div>
				</div>
			</form>
		</div>
		<h1>${msg }</h1>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên</th>
							<th>Danh mục</th>
							<th>Lượt đọc</th>
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
										<td class="center">${lands.countViews }</td>
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
				<c:if test="${not empty totalPage}">
					<nav class="text-center" aria-label="...">
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous"><span
									aria-hidden="true">«</span></a></li>
							<c:forEach begin="1" end="${totalPage }" var="i">
								<li <c:if test="${page == i}"> class='active'</c:if>><a
									href="${pageContext.request.contextPath }/admin/lands/index/${i}">${i }</a>
								</li>
							</c:forEach>
							<li><a href="#" aria-label="Next"><span
									aria-hidden="true">»</span></a></li>
						</ul>
					</nav>
				</c:if>
				<!-- /.pagination -->

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->



</div>