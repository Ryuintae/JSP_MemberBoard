<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" src="../resource/js/validation.js"></script>

</head>
<body>
<h3>회원 가입하기</h3>
<form name = "registform" method="post" action="../controller/MemberRegisterProcess.jsp" onsubmit="return sendit(this);">
    <p>아이디</p>
    <input type="text" name="id" placeholder="아이디를 입력해 주세요">
    		<div>
			<button type="button" onclick= "idCheck();">중복 확인</button>
		</div>
 
    <p>비밀번호</p>
    <input type="password" name="pass" placeholder="패스워드를 입력해 주세요">

    <p>비밀번호 중복 확인</p>
    <input type="password" name="re_pass" placeholder="다시 한번 입력해 주세요">

	<p>이름</p>
	<input type="text" name="name" placeholder="이름을 입력해 주세요">
	
	<p></p>
			 <!-- 입력된 경우에 따라서 다르게 액션되면 button으로, 입력 값 상관 없이 무조건 보내기면 submit -->
     		<input type="submit" value="가입하기">
     		<input type="button" value="이전으로 돌아가기"  onclick=history.back()>
</form>
<script>

function idCheck(){
  //새창 만들기
  window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
}
</script>
</body>
</html>