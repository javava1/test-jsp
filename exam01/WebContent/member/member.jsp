<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  <script src="login.js"></script> </head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/default/header.jsp"/>
<div align="center">
<h1>회원등록</h1>
<table>
<tr><td>
	<form name="form" action="memberChk.jsp" method='post'>
	<input type="text" id="id" name="id" placeholder="아이디">(*필수 항목)<br>
	<input type="text" id="pwd1" name="pwd" placeholder="비밀번호"><br>
	<input type="text" id="pwd2" onchange="pwchk();" placeholder="비밀번호 확인">
	<label id="label">(*필수 체크)</label><br>
	<input type="text" id="id" name="name" placeholder="이름">(*필수 항목)<br>
	<input type="text" id="id" name="rank" placeholder="직급">(*필수 항목)<br>
	<input type="text" id="id" name="dep" placeholder="부서"><br>
	<input type="button" value="회원가입" onclick="chkValidate();"><br>
	</form>
</td></tr>
</table>
</div>
<jsp:include page="/default/footer.jsp"/>
</body>
</html>