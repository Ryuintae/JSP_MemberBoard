<%@page import="utils.JSFunction"%>
<%@ page import="model1.MemberDAO"%>
<%@ page import="model1.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	MemberDTO dto = new MemberDTO(); // DTO 객체 생성
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

dto.setId(id);
dto.setPass(pass);
dto.setName(name);

MemberDAO dao = new MemberDAO(application); // DAO 객체 생성
int result = dao.insertMember(dto); // insertMember의 반환타입이 int
dao.close();
if (result == 1) {
	response.sendRedirect("../Board/List.jsp");
}
%>