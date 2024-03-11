<%@page import="ajaxboard.model.*"%>
<%@page import="org.json.simple.JSONObject"%>
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
	
	String id = request.getParameter("uid");
	String writer = request.getParameter("uwriter");
	String subject = request.getParameter("usubject");
	String content = request.getParameter("ucontent");
	String avata = request.getParameter("uavata");
	
	AjaxBoardDao dao = new AjaxBoardDao();
	
	// 하나의 객체만을 얻어옴
	AjaxBoardDto board = dao.getBoard(id); 
	board.setWriter(writer);
	board.setSubject(subject);
	board.setContent(content);
	board.setAvata(avata);

	dao.update(board);
%>

</body>
</html>