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
	<jsp:include page="../default/header.jsp"/>
	<jsp:useBean id="mb" class="members.MemberDAO"/>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<div align="center" style="height: 300px;">
	<h1>개인 정보</h1>
	<%
	dto = mb.memberView((String)session.getAttribute("userId"));
	%>
		<table>
		<tr><th width="100">아 이 디</th><td><%=dto.getId()%></td></tr>
		<tr><th width="100">비밀번호</th><td><%=dto.getPwd()%></td></tr>
		<tr><th width="100">이 름</th><td><%=dto.getName()%></td></tr>
		<tr><th width="100">직 급</th><td><%=dto.getRank()%></td></tr>
		<tr><th width="100">부 서</th><td><%=dto.getDep()%></td></tr>
		<tr>
	<td align="center"><input type="button" value="확 인" 
	onclick='location.href="index.jsp"'></td>
</tr>
		
		</table>
	</div>
	<jsp:include page="/default/footer.jsp"/>
</body>

</html>