<%@ page import="model1.BoardDAO"%>
<%@ page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num"); // 일련번호 받기 

BoardDAO dao = new BoardDAO(application); // DAO 생성 
dao.updateVisitCount(num); // 조회수 증가 
BoardDTO dto = dao.selectView(num); // 게시물 가져오기 
dao.close(); // DB 연결 해제
%>
<!DOCTYPE html>
<html>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript" src="../resource/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 상세 보기(View)</h2>
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<!-- 공통 링크 -->

		<table class="table table-striped-columns" border="1" width="90%">
			<tr>
				<td>번호</td>
				<td class="table-primary"><%=dto.getNum()%></td>
				<td>작성자</td>
				<td class="table-primary"><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td class="table-primary"><%=dto.getPostdate()%></td>
				<td>조회수</td>
				<td class="table-primary"><%=dto.getVisitcount()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td  class="table-primary" colspan="3"><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td  class="table-primary" colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>")%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%
						if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
					<button type="button"
						onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
						수정하기</button>

					<button type="button" onclick="deletePost(this);">삭제하기</button> <%
 	}
 %>
					<button type="button" class="btn btn-success" onclick="location.href='List.jsp';">
						목록 보기</button>
				</td>
			</tr>
		</table>
	</form>

	<!-- 댓글 폼 -->
	<form action="BoardServlet" method="post" name="check">
		<input type="hidden" name="command" value="comment_write"> <input
			type="hidden" name="pnum" value="${param.num }">
		<table>
			<tr>
				<%
					if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
				%>

				<th>댓글 입력</th>
				<td><textarea rows="3" cols="40" name="c_content"></textarea></td>

				<td><input type="submit" value="댓글달기"
					onclick="return com_check()"></td>
			</tr>
			<%
				}
					else{
						out.print("로그인 시 댓글작성이 가능합니다!");
					}
			%>
		</table>
	</form>
	

	<!-- 댓글 목록 -->

	<button onclick="doAction()">click me</button>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
