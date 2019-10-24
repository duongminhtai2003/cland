<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<script type="text/javascript">
	function enable(enable, id) {
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/users/enable",
			type : 'GET',
			dataType : 'html',
			data : {
				id : id,
				enable : enable
			},
			success : function(data) {
				window.location.href = "${pageContext.request.contextPath}/admin/users/index";
			},
			error : function() {
				alert('Có lỗi xảy ra');
			}
		});
	}
</script>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý người dùng</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<a href="${pageContext.request.contextPath}/admin/users/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
			<form action="${pageContext.request.contextPath}/admin/users/search"
				method="get">
				<div class="col-md-2" style="margin-bottom: 0px">
					<div class="form-group">
						<select class="form-control" id="exampleFormControlSelect1"
							name="option">
							<option value="role">Quyền</option>
							<option value="username">username</option>
							<option value="fullname">fullname</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="input-group form">
						<input type="text" name="str" class="form-control" value=""
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
							<th>Username</th>
							<th>Fullname</th>
							<th>Quyền</th>
							<th>Block/Unblock</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty listUsers }">
								<c:forEach items="${listUsers }" var="users">
									<c:set var="urlEdit"
										value="${pageContext.request.contextPath}/admin/users/edit/${users.id}" />
									<c:set var="urlDel"
										value="${pageContext.request.contextPath}/admin/users/del/${users.id}" />
									<tr class="odd gradeX">
										<td>${users.id }</td>
										<td>${users.username }</td>
										<td>${users.fullname }</td>
										<td>${users.roleName }</td>
										<td>
											<div id="enable">
												<c:if test="${users.enable == 0}">
													<a href="javascript:void(0)"
														onclick="return enable(1,${users.id})"><img
														src="${pageContext.request.contextPath}/admin/images/lock.jpg"
														style="width: 40px; height: 40px;"></a>
												</c:if>
												<c:if test="${users.enable == 1}">
													<a href="javascript:void(0)"
														onclick="return enable(0,${users.id})"><img
														src="${pageContext.request.contextPath}/admin/images/unlock.jpg"
														style="width: 40px; height: 40px;"></a>
												</c:if>
											</div>
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
								<p>không có người dùng</p>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
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
											href="${pageContext.request.contextPath}/admin/users/index/${currentPage-1}"><<</a></li>
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
											href="${pageContext.request.contextPath}/admin/users/index/${i}">${i }</a></li>
									</c:forEach>
									<c:if test="${currentPage < numberOfPage }">
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a
											href="${pageContext.request.contextPath}/admin/users/index/${currentPage + 1}">>></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>