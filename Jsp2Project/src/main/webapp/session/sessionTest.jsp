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
<title></title>
</head>
<body>
<%
	// 세션 저장 방법
	session.setAttribute("msg", "happy day");
	
	// 초 단위로 유지시간 지정
	session.setMaxInactiveInterval(60);
	
%>
<h4>세션 얻기</h4>
세션 값 : <%=session.getAttribute("msg") %> <br>
세션 유지 시간 : <%=session.getMaxInactiveInterval() %>초 <br>
세션 생성 시간 : <%=session.getCreationTime() %> <br>
세션 생성 기간 : <%=new Date(session.getCreationTime()) %> <br>
</body>
</html>