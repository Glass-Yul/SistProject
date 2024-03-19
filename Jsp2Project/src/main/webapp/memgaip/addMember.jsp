<%@page import="memgaip.model.MemgaipDto"%>
<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="mem_gaip.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
	
	String realPath=getServletContext().getRealPath("/upload"); // 미리 폴더 생성해야 함
    System.out.println(realPath);
    int uploadSize=1024*1024*5; //5mb
    
    MultipartRequest multi=null;
    
    multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
    
    //dao
    MemgaipDao dao=new MemgaipDao();
    
    MemgaipDto dto=new MemgaipDto();
    
    dto.setId(multi.getParameter("id"));
    dto.setPass(multi.getParameter("pass"));
    dto.setHp(multi.getParameter("hp"));
    dto.setName(multi.getParameter("name"));
    dto.setNum(multi.getParameter("num"));
    
        String photo =multi.getFilesystemName("photo");
        
         if(photo==null)
        	dto.setPhoto("../img/17.png"); //사진선택 안한경우
        else
        	dto.setPhoto("../upload/"+photo); //한경우 
        //dto.setM_photo(photo);
        
        dao.insert(dto);
        //성공후 목록이동
        response.sendRedirect("listMember.jsp");

%>
</body>
</html>