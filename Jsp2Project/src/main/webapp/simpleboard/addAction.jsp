<%@page import="simpleboard.model.*"%>
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
	a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소로부터 상속받은 글씨색을 유지 */
}
	
</style>
<title>추가 action</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	System.out.println("== add Action ==");
	System.out.println("writer "+writer);
	System.out.println("subject "+subject);
	System.out.println("pwd "+pwd);
	System.out.println("content "+content);
	
	SimpleboardDao dao = new SimpleboardDao();
	
	SimpleboardDto board = new SimpleboardDto();
	board.setWriter(writer);
	board.setSubject(subject);
	board.setPwd(pwd);
	board.setContent(content);
	
	dao.insert(board);
	int max = dao.getMaxNum();
	//response.sendRedirect("listBoard.jsp");
	response.sendRedirect("contentView.jsp?num="+max);
	
	
	
%>
</body>
</html>