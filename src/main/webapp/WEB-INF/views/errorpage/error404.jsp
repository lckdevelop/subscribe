<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>현대백화점 | 404에러</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="${context}/resources/errorpage/css/style.css" />
</head>
<body>
<div id="notfound">
	<div class="notfound">
		<div class="notfound-404"></div>
		<h1>404</h1>
		<h2>Oops! Page Not Be Found</h2>
		<p>Sorry but the page you are looking for does not exist, have been removed. name changed or is temporarily unavailable</p>
		<a href="${context}">Back to homepage</a>
	</div>
</div>
</body>
</html>