<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	알림 테스트 폼<br>
	
	
	<input type='text' id='name' name='name'><br>
	<input type="date" id='reserveDate' name='reserveDate'><br>
	<textarea id='memo' name='memo'></textarea><br>
	<input type='text' id='brandNo' name='brandNo'><br>
	<input type='text' id='storeNo' name='storeNo'><br>
	<button onclick='sendToAdminReserve()'>예약</button>
	
</body>

<script src="${context}/resources/theme/js/send-notice.js"></script>
</html>