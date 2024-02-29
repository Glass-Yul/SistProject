<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>jsp start</title>
</head>
<body>
	<h2>JSP는 HTML5 구조에 자바 코드를 사용 할 수 있는 서버 언어</h2>
	<%
		int age=20;
		String name = "이효효효효리";
	%>
	<h4>표현식 사용</h4>
	<b>이름 : <%=name %></b><br>
	<b>나이 : <%=age %></b>
</body>
</html>