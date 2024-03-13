<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="uploadboard.model.UploadBoardDao"%>
<%@page import="uploadboard.model.UploadBoardDto"%>
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
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String realFolder = getServletContext().getRealPath("/save");
	System.out.println("realFolder " +realFolder);
	int uploadSize = 1024*1024*5;
	try{
		MultipartRequest multipart = new MultipartRequest(request,realFolder,uploadSize
									, "utf-8", new DefaultFileRenamePolicy());
		
		// 입력값 읽기
		String num = multipart.getParameter("num");
		String writer = multipart.getParameter("writer");
		String subject = multipart.getParameter("subject");
		String pass = multipart.getParameter("pass");
		String content = multipart.getParameter("content");
		
		// 실제 업로드 이미지 이름 읽어오기
		String img = multipart.getFilesystemName("img");
		
		UploadBoardDto board = new UploadBoardDto();

		board.setNum(num);
		board.setWriter(writer);
		board.setSubject(subject);
		board.setPass(pass);
		board.setImgname(img);
		board.setContent(content);
	
		UploadBoardDao dao = new UploadBoardDao();
		dao.update(board);
		
		response.sendRedirect("listBoard.jsp");
		
	} catch(Exception e){
		e.printStackTrace();
	}
	
	

%>
</body>
</html>