<%@page import="team.model.TeamDao"%>
<%@page import="team.model.TeamDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	

	TeamDao dao = new TeamDao();

	String name = request.getParameter("name");
	String ckeck = request.getParameter("driver");
	String addr = request.getParameter("addr");
	
	String driver = ckeck==null?"없음":"있음";
	/* if(ckeck.equals("on")) driver = "있음"; 
	else if (ckeck == null) driver="없음"; */
	
	TeamDto team = new TeamDto();
	team.setName(name);
	team.setDriver(driver);
	team.setAddr(addr);
	
	dao.insertTeam(team);
	
	response.sendRedirect("teamList.jsp");
%>

<%-- <%
	request.setCharacterEncoding("utf-8");	
%>
<jsp:useBean id="team" class="team.model.TeamDto"></jsp:useBean>
<jsp:useBean id="dao" class="team.model.TeamDao"></jsp:useBean>

<!-- team의 멤버와 같은 이름의 태그는 자동으로 읽어서 team에 넣어줌 -->
<jsp:setProperty property="*" name="team"/>

<%
	
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>addAction</title>
</head>
<body>
	
</body>
</html>