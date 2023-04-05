<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	// 아 이건 로그아웃이구나
	
	// 방법 1: 회원인증정보 속성 삭제 
// removeAttribute
session.removeAttribute("UserId");
session.removeAttribute("UserName");

// 방법 2: 모든 속성 한꺼번에 삭제 
// invalidate() 메서드는 세션 자체를 무효화합니다. 이때 session 영역의 모든 속성을 한꺼번에 삭제합니다
session.invalidate();

// 속성 삭제 후 페이지 이동 
response.sendRedirect("LoginForm.jsp");
%>