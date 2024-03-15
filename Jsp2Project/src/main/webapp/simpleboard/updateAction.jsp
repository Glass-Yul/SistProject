<%@page import="simpleboard.model.SimpleboardDto"%>
<%@page import="simpleboard.model.SimpleboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>비번 체크</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	System.out.println("== update action ==");
	System.out.println("num " + num);
	System.out.println("writer " + writer);
	System.out.println("subject " + subject);
	System.out.println("content " + content);
	System.out.println("pwd " + pwd);
	
	SimpleboardDao dao = new SimpleboardDao();
	
	boolean pwdCheck = dao.pwdCheck(num, pwd);
	if(pwdCheck) { // 비번이 맞으면
		SimpleboardDto board = dao.getSelect(num); // 데이터 받음
		board.setNum(num);
		board.setWriter(writer);
		board.setSubject(subject);
		board.setContent(content);
		board.setPwd(pwd);
		
		dao.update(board);
		
	    response.sendRedirect("listBoard.jsp");
	    
	} else {
%>
	<script>
	    alert("비밀번호가 일치하지 않습니다.");
	    history.back(); // 이전 페이지로 이동
	</script>
<%
}

	
%>
<body>

</body>
</html>