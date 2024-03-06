<%@page import="introduction.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	

	IntroductionDao dao = new IntroductionDao();

	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String birthday = request.getParameter("birthday");
	String hometown = request.getParameter("hometown");
	String[] hobby = request.getParameterValues("hobby");
	String memo = request.getParameter("memo");
	
	String str = "";
	for(String s : hobby){
		str+=s+", ";
	}
	str = str.substring(0, str.length()-2);
	
	IntroductionDto introduction = new IntroductionDto();
	introduction.setName(name);
	introduction.setAge(age);
	introduction.setBirthday(birthday);
	introduction.setHometown(hometown);
	introduction.setHobby(str);
	introduction.setMemo(memo);
	
	dao.update(num, introduction);
	
	response.sendRedirect("introductionList.jsp");
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