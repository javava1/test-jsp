<%@page import="java.util.ArrayList"%>
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
<%@page import="members.MemberDTO"%>
<jsp:include page="/default/header.jsp"/>
<div align="center" >
<h1>회원 목록</h1>
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
ArrayList<MemberDTO> memberList = mb.memberView();
if(memberList == null || memberList.size() == 0 ){
	out.print("<h1>등록된 값이 없습니다.</h1>");
}else{%>
	<table border='1'>
	<tr>
	<th width="100">이름</th><th width="100">직급</th><th width="100">부서</th>
	</tr>
	<%	for(MemberDTO dto:memberList){	%>
	<tr>
	<td style="cursor:pointer" align="center"
	onclick="location.href='idChk.jsp?id=<%=dto.getId()%>'">
	<%=dto.getName()%>
	</td>
	
	
	<td align="center"><%=dto.getRank()%></td><td align="center"><%=dto.getDep()%></td>
	</tr>
	<%	}out.print("</table>"); } %>
</div>
<jsp:include page="/default/footer.jsp"/>

</body>
</html>