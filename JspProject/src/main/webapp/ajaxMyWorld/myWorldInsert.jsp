<%@page import="myworld.model.MyWorldDto"%>
<%@page import="myworld.model.MyWorldDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title></title>
</head>
<body>
<%
	MyWorldDao dao = new MyWorldDao();	
	
	request.setCharacterEncoding("utf-8");
	
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String avata = request.getParameter("avata");
	
	MyWorldDto my = new MyWorldDto();
	my.setWriter(writer);
	my.setContent(content);
	my.setAvata(avata);
	
	dao.insert(my);
	
	// ajax는 리다이렉트 안 해줌
	
%>
</body>
</html>