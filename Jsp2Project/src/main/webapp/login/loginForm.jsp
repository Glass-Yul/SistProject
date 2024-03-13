<%@page import="log.model.LogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	body{
		/* position: absolute; */
		/* border: 1px solid gray; */
		font-family: 'Nanum Pen Script';
		font-size: 1.5em;
		margin: 50px
	}
	
</style>
<title>login form</title>
</head>
<%
	// 아이디 세션에서 id 값 받아옴
	String myid = (String)session.getAttribute("idok");
	// 체크박스 세션에서 check 값 받아옴
	String savecheck = (String)session.getAttribute("saveok");
	
	boolean save = true;
	LogDao dao = new LogDao();
	
	if(savecheck==null)
	{
		myid = ""; // input id에 줄거임 // id 저장 체크 안 함
		save=false;
		
	} else{ // null이 아니면 on 값으로 잘 넘어온 것임
		
	}
%>
<body>
	<div style="width:400px" class="logform">
		<h3>회원 로그인</h3>
		<form action="loginAction.jsp" method="post">
			<input type="text" name="id" value="<%=myid %>" placeholder="아이디를 입력하시오" class="form-control"><br>
			<input type="password" name="pwd" placeholder="비밀번호를 입력하시오" class="form-control"><br>
			<button type="submit" class="btn btn-info" style="height: 40px;width:80px">로그인</button><br>
			<input type="checkbox" name="savechk" <%=save?"checked" : "" %>>&nbsp;아이디 저장<br>
		</form>
	</div>
</body>
</html>