<%@page import="log.model.LogDao"%>
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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String savechk = request.getParameter("savechk");
	
	LogDao dao = new LogDao();
	boolean flag = dao.loginCheck(id, pwd);
	System.out.println(flag);
	
	// id와 pwd가 맞으면 세션 저장 후 loginMain으로 이동
	if(flag){
		// 로그인 중이라는 세션
		session.setAttribute("loginok", "success");
		// 아이디 값 저장 세션
		session.setAttribute("idok", id);
		// 체크 값 저장 세션
		session.setAttribute("saveok", savechk);
		
		/* if(savechk==null){
			
		} else if(savechk.equals("on")){
			// 체크하면 on, 아니면 null
			// 체크 값 저장 세션
			session.setAttribute("saveok", savechk);
		} */
			
		session.setMaxInactiveInterval(60*60*8); // 8시간
			
		response.sendRedirect("loginMain.jsp");
	} else{%>
		<script type="text/javascript">
		alert("id와 pwd가 존재하지 않음. 다시 입력 하시오.");
		history.back();
		</script>
	<%}
	
	

%>
</body>
</html>