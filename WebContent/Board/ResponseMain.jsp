<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>내장 객체 - response</title>
</head>
<body>
	<h2>1. 로그인 폼</h2>
	<%
	String loginErr = request.getParameter("loginErr");
	if (loginErr.equals(new String("1")))
		out.print("로그인 실패");
	%>
	<form action="./ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id" /><br /> 패스워드 : <input
			type="text" name="user_pwd" /><br /> <input type="submit"
			value="로그인" />
	</form>

</body>
</html>