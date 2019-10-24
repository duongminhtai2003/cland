<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp"%>
<div class="col-md-10">
	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title ">Quản lý liên hệ</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6"></div>
			<form
				action="${pageContext.request.contextPath}/admin/contact/search"
				method="get">
				<div class="col-md-2" style="margin-bottom: 0px">
					<div class="form-group">
						<select class="form-control" id="exampleFormControlSelect1"
							name="option">
							<option value="fullname">fullname</option>
							<option value="email">email</option>
							<option value="subject">subject</option>
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
		<hr>
		<h1>${msg }</h1>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Fullname</th>
							<th>Email</th>
							<th>Subject</th>
							<th>Content</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty listContact }">
								<c:forEach items="${listContact }" var="contact">
									<c:set var="urlEdit"
										value="${pageContext.request.contextPath}/admin/contact/edit/${contact.id}" />
									<c:set var="urlDel"
										value="${pageContext.request.contextPath}/admin/contact/del/${contact.id}" />
									<tr class="odd gradeX">
										<td>${contact.id }</td>
										<td>${contact.fullname }</td>
										<td>${contact.email }</td>
										<td>${contact.subject }</td>
										<td>${contact.content }</td>
										<td class="center text-center"><a href="${urlDel }"
											title="" class="btn btn-danger"><span
												class="glyphicon glyphicon-trash"></span> Xóa</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>không có liên hệ</p>
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
											href="${pageContext.request.contextPath}/admin/contact/index/${currentPage-1}"><<</a></li>
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
											href="${pageContext.request.contextPath}/admin/contact/index/${i}">${i }</a></li>
									</c:forEach>
									<c:if test="${currentPage < numberOfPage }">
										<li class="paginate_button next"
											aria-controls="dataTables-example" tabindex="0"
											id="dataTables-example_next"><a
											href="${pageContext.request.contextPath}/admin/contact/index/${currentPage + 1}">>></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>