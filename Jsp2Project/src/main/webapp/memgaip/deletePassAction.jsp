<%@page import="java.io.File"%>
<%@page import="memgaip.model.MemgaipDao"%>
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

	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	System.out.println("num "+num);
	System.out.println("pass "+pass);
	
	MemgaipDao dao = new MemgaipDao();
	
	boolean check = dao.checkPass(num, pass);
	
	if(check)
	{

	  //게시글 지우기전 업로드된 이미지 지우기
	  String imgName = dao.getMem(num).getPhoto();
	  //업로드경로
	  String uploadPath = getServletContext().getRealPath("/upload");
	  
	  //파일생성
	  File file=new File(uploadPath+"\\"+imgName);
	  
	  //파일삭제
	  if(file.exists()) //파일이 존재하면
		  file.delete(); //파일을 삭제
	  
		//db삭제
	  dao.delete(num);
	  response.sendRedirect("listMember.jsp");
  }else{
	  %>
	  <script type="text/javascript">
	    alert("비밀번호가 맞지않습니다");
	    history.back();
	  </script>
  <%}
%>
</body>
</html>