<%@page import="java.lang.module.ResolutionException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="quizshop.QuizShopDto"%>
<%@page import="quizshop.QuizShopDao"%>
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
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	System.out.println("넘어온 id "+id);
	
	QuizShopDao dao = new QuizShopDao();
	
	dao.delete(id);
	
	response.sendRedirect("shoplist.jsp");
%>
</body>
</html>