<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myinfo.model.MyInfoDto"%>
<%@page import="myinfo.model.MyInfoDao"%>
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
	
	String name = request.getParameter("name");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String hp = hp1+"-"+hp2+"-"+hp3;
	String birth = request.getParameter("birth");
	String blood = request.getParameter("blood");
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	MyInfoDao dao = new MyInfoDao();
	MyInfoDto my = new MyInfoDto();
	my.setName(name);
	my.setHp(hp);
	my.setBirth(birth);
	my.setBlood(blood);
	
	dao.insert(my);
	
	
	response.sendRedirect("listInfo.jsp");
	
%>
</body>
</html>