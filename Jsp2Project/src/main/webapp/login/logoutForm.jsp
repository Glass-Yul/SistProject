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
<title>logout form</title>
</head>
<body>
<%
	// 세션으로 아이디 읽어옴
	String id = (String)session.getAttribute("idok");

	//아이디에 해당하는 이름 얻어옴
	LogDao dao = new LogDao();
	String name = dao.getName(id);
%>
<img alt="" src="../img/16.png">
<h3><%=name %>님이 로그인 하셨습니다.</h3>
<input type="button" value="로그아웃" class="btn btn-danger"
		onclick="location.href='logoutAction.jsp'">
</body>
</html>