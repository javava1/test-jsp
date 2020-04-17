<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<fmt:requestEncoding value="utf-8"/>
	<jsp:include page="/default/header.jsp"/>
	<div align="center">
	<h1>로그인 성공</h1>
	</div>
	<jsp:include page="/default/footer.jsp"/>
</body>
</html>
