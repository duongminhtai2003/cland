<%@page import="edu.vinaenter.constants.UrlConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2">
  	<div class="sidebar content-box" style="display: block;">
              <!-- Nav-bar -->
		<ul class="nav">
		    <!-- Main menu -->
		    <li class="current"><a href="${pageContext.request.contextPath }/admin/index"><i class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
		    <li><a href="${pageContext.request.contextPath }/admin/cat/index"><i class="glyphicon glyphicon-list"></i> Danh mục</a></li>
		    <li><a href="${pageContext.request.contextPath }/admin/lands/index"><i class="glyphicon glyphicon-book"></i> Tin tức</a></li>
		    <li><a href="${pageContext.request.contextPath }/admin/users/index" onclick="myFunction()"><i class="glyphicon glyphicon-user"></i> Người dùng</a></li>
		    <li><a href="${pageContext.request.contextPath }/admin/contacts/index"><i class="glyphicon glyphicon-envelope"></i> Liên hệ</a></li>
		    <li class="submenu">
		         <a href="#">
		            <i class="glyphicon glyphicon-list"></i> Pages
		            <span class="caret pull-right"></span>
		         </a>
		         <!-- Sub menu -->
		         <ul>
		            <li><a href="login.html">Login</a></li>
		            <li><a href="javascript:void(0)">Signup</a></li>
		        </ul>
		    </li>
		</ul>
		<!-- /.nav-bar -->
           </div>
  </div>