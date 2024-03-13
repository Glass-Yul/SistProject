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
<title>action</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String msg = (String)session.getAttribute("msg");
	String gift = request.getParameter("gift");
	
	// 세션 존재 확인
	if(msg==null || !msg.equals("test")){%>
		<h4>세션 종료로 선물은 없습니다.</h4>
	<%}else if(msg.equals("test")){%>
		<h4>축하합니다. <%=gift %> 경품에 당첨입니다.</h4>
	<%}
	
%>

<a href="sessionMain.jsp">다시 선택</a>

</body>
</html>