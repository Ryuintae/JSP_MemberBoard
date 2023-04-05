<%@ page import="model1.BoardDAO"%>
<%@ page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num"); // 일련번호 받기 
BoardDAO dao = new BoardDAO(application); // DAO 생성
BoardDTO dto = dao.selectView(num); // 게시물 가져오기 
String sessionId = session.getAttribute("UserId").toString(); // 로그인 ID 얻기 
dao.close(); // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>회원제 게시판</title>
<script type="text/javascript" src="../resource/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 수정하기(Edit)</h2>
	<form name="editFrm" method="post"
		action="../controller/EditProcess.jsp"
		onsubmit="return editForm(this);">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		<!-- hidden을 쓰는 이유는 수정하기를 누군가 접근하는것을 방지하기 위한것이다.(post방식으로만 사용) -->
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"
					value="<%=dto.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>