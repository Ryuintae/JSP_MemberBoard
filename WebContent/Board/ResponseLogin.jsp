<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>내장 객체 - Response</title>
</head>
<body>
	<%
	String id = request.getParameter("user_id");
	//request 객체로 전송된 매개변수를 얻어온 다음에 if 문을 통해 검증
	String pwd = request.getParameter("user_pwd");
	if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
		response.sendRedirect("ResponseWelcome.jsp"); //로그인 성공 페이지로 이동하기
	} //Redirect 방식은 forward 방식은 페이지를 이동한다는 점은 같지만 
		//redirect는 전환주체가 클라이언트이고 forward는 서버이다.
	else {
		
		request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response); //RequestDispatcher내장객체를 사용한다
	}
	%>
</body>
</html>