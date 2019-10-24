<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglibs.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title><tiles:insertAttribute name="title" /></title>
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/admin/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/style1.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <tiles:insertAttribute name="stylesheets" />
  </head>
  <body>
  	<tiles:insertAttribute name="header" />
  	
    <div class="page-content">
    	<div class="row">
		  <tiles:insertAttribute name="sidebar" />
		  
		  <tiles:insertAttribute name="content" />
		</div>
    </div>

	<tiles:insertAttribute name="footer" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/custom.js"></script>
    
    <tiles:insertAttribute name="js" />
  </body>
</html>
