<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="model1.BoardDAO"%>
<%@ page import="model1.BoardDTO"%>
<%@ page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
int totalCount = dao.selectCount(param); // 게시물 수 확인

/*** 페이지 처리 start ***/
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수

//현재 페이지 확인
int pageNum = 1; // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

//목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 end ***/

List<BoardDTO> boardLists = dao.selectListPage(param); // 게시물 목록 받기
dao.close(); // DB 연결 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="../Common/Link.jsp" />

	<!-- 공통 링크 -->

	<h2>
		목록 보기(List) - 현재 페이지 :
		<%=pageNum%>
		(전체 :
		<%=totalPage%>)
	</h2>
	<!-- 검색폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 테이블(표) -->
	<div class="bd-example-snippet bd-code-snippet"></div>
	<div class="bd-example"></div>
	<table class="table">
		<!-- 각 칼럼의 이름 -->
		<tr class="table-primary">
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!-- 목록의 내용 -->
		<%
		if (boardLists.isEmpty()) {
			// 게시물이 하나도 없을 때
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		<%
		} else {
		// 게시물이 있을 때
		int virtualNum = 0; // 화면상에서의 게시물 번호
		int countNum = 0;
		for (BoardDTO dto : boardLists) {
			// virtualNumber = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소 (기존 코드)
			virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
			%>
			<tr align="center">
			<td><%=virtualNum%></td>
			<!--게시물 번호-->
			<td align="left">
				<!--제목(+ 하이퍼링크)--> <a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
			</td>
			<td align="center"><%=dto.getId()%></td>
			<!--작성자 아이디-->
			<td align="center"><%=dto.getVisitcount()%></td>
			<!--조회수-->
			<td align="center"><%=dto.getPostdate()%></td>
			<!--작성일-->
		</tr>
		<%
		}
		}
		%>
	</table>
	<!--목록 하단의 [글쓰기] 버튼-->
	<table border="1" width="90%">
		<tr align="center" >
			<!--페이징 처리-->
			<td><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%></td>
			<!--글쓰기 버튼-->
			<td><button type="button"class="btn btn-primary" onclick="location.href='Write.jsp';">글쓰기
				</button></td>
		</tr>
	</table>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>


</body>
</html>