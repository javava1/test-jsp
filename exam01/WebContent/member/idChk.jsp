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
<%@page import="members.*" %>
<jsp:useBean id="check" class="members.MemberDAO"/>
<jsp:useBean id="dto" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	if(session.getAttribute("userId").equals(request.getParameter("id"))){%>
		<c:redirect url="userInfo.jsp"/>
	<%}else%>
		<script type="text/javascript">
		alert("개인정보는 본인만 열람할 수 있습니다."); 
		history.go(-1);
		</script>
</body>
</html>