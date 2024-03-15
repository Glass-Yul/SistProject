<%@page import="simpleboard.model.SimpleboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	body{
		font-family: 'Nanum Pen Script';
		font-size: 1.5em;
		margin: 100px;
  		width: 300px;
  		
	}
	a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소로부터 상속받은 글씨색을 유지 */
}
	
</style>
<title>수정 전에 비번으로 확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	String writer = request.getParameter("writer"); 
	String subject = request.getParameter("subject"); 
	String content = request.getParameter("content"); 
	String pwd = request.getParameter("pwd"); 
	
	System.out.println("== pwd update action ==");
	System.out.println("num " + num);
	System.out.println("writer " + writer);
	System.out.println("subject " + subject);
	System.out.println("content " + content);
	System.out.println("pwd " + pwd);
	
	SimpleboardDao dao = new SimpleboardDao();
	
%>
	<div style="width:300px;">
		<form action="updateAction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>">
			<input type="hidden" name="writer" value="<%=writer %>">
			<input type="hidden" name="subject" value="<%=subject %>">
			<input type="hidden" name="content" value="<%=content %>">
			<div class="input-group">
				<h4 >비밀번호 확인</h4>&nbsp;&nbsp;
				<input type="password" class="form-control" required="required" name="pwd"><br>
			</div>
			<br>
			<button type="submit" class="btn btn-outline-warning" style="width:80px">
				<i class="bi bi-pencil-square"></i>수정
			</button>
			<button type="button" class="btn btn-outline-success" style="width:80px"
					onclick="location.href='listBoard.jsp'">
					<i class="bi bi-list-ul"></i>목록</button>
		</form>
	</div>


</body>
</html>