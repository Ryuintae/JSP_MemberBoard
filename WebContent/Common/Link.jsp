<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

</head>
<body>

	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<!-- 로그인 여부에 따른 메뉴 변화 --> <%
 if (session.getAttribute("UserId") == null) {
 %> <a href="../Board/LoginForm.jsp">로그인</a> <%
 } else {
 %> <a href="../Board/Logout.jsp">로그아웃</a> &nbsp; <a
				href="../Board/Logout.jsp">로그아웃</a> <%
 }
 %> <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 --> &nbsp;&nbsp;&nbsp; <a
				href="../Board/List.jsp">게시판</a> <!-- 로그인 여부에 따른 메뉴 변화 --> <%
 if (session.getAttribute("UserId") == null) {
 %> &nbsp;&nbsp;&nbsp; <a href="../Board/MemberRegister.jsp">회원가입</a> <%
 }
 %>
			</td>
		</tr>
	</table>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
