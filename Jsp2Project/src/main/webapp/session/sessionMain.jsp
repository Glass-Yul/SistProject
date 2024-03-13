<%@page import="java.util.Date"%>
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
<title>main</title>
</head>
<body>
<%
	// 세션 저장 방법
	session.setAttribute("msg", "test");
	
	// 초 단위로 유지시간 지정
	session.setMaxInactiveInterval(10);
	
%>

<h4>10초 안에 클릭</h4>
<form action="sessionAction.jsp" method="post">
	<h5>받고 싶은 생일 선물은?</h5>
	<input type="radio" value="그램" name="gift">그램 &nbsp;
	<input type="radio" value="갤럭시북" name="gift">갤럭시북 &nbsp;
	<input type="radio" value="맥북" name="gift" checked="checked">맥북 &nbsp;
	<input type="radio" value="아수스" name="gift">아수스 &nbsp;
	
	<input type="submit" value="전송">
</form>

</body>
</html>