<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("UserId") == null) {
%>
<script>
	alert("로그인 후 이용하실 수 있습니다.");
	location.href = "../Board/LoginForm.jsp";
</script>
<%
return;
}
%>