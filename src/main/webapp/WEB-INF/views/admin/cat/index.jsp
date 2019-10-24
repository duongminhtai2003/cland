<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý danh mục</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath}/admin/cat/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>

			</div>
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
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty listCat }">
								<c:forEach items="${listCat }" var="cat">
									<c:set var="urlEdit"
										value="${pageContext.request.contextPath}/admin/cat/edit/${cat.id}" />
									<c:set var="urlDel"
										value="${pageContext.request.contextPath}/admin/cat/del/${cat.id}" />
									<tr class="odd gradeX">
										<td>${cat.id }</td>
										<td>${cat.catName }</td>
										<td class="center text-center"><a href="${urlEdit }"
											title="" class="btn btn-primary"> <span
												class="glyphicon glyphicon-pencil "></span> Sửa
										</a> <a href="${urlDel }" title="" class="btn btn-danger"> <span
												class="glyphicon glyphicon-trash"></span> Xóa
										</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>không có danh muc</p>
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
									href="${pageContext.request.contextPath }/admin/cat/index/${i}">${i }</a>
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