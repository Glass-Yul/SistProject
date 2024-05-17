<%@page import="java.text.SimpleDateFormat"%>
<%@page import="memgaip.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>list mem</title>
<style type="text/css">
	body{
		margin:50px;
		font-family: 'Nanum Pen Script';
		font-size: 2em;
	}	
  img{
    width: 50px;
    height: 50px;
    border: 1px solid gray;
  }
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
  MemgaipDao dao = new MemgaipDao();
  List<MemgaipDto> list = dao.getMemList();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
  <div  style="width: 1000px;">
     <b>총 <%=list.size() %>명의 회원이 가입되었습니다</b>
     <button type="button" class="btn btn-warning"
     onclick="location.href='addForm.jsp'" style="float: right; margin-right: 50px;">회원가입</button>
     <br>
     <table class="table table-bordered">
        <caption align="top"><b>전체 회원 명단</b></caption>
         <tr class="table-success">
           <th width="80">번호</th>
           <th width="180">아이디</th>
           <th width="180">회원명</th>
           <th width="200">핸드폰</th>
           <th width="200">가입일</th>
           <th width="150">편집</th>
         </tr>
         
         <%
         int i=1;
           for(MemgaipDto dto:list)
           {%>
        	   <tr>
        	     <td align="center" valign="middle"><%=i++ %></td>
        	     <td align="center" valign="middle"><%=dto.getId() %></td>
        	     <td align="center">
        	       <%-- <%
        	         if(dto.getM_photo()==null)
        	         {%>
        	        	 <img alt="" src="../image/연예인사진/noimage.png" class="rounded-circle">
        	         <%}else{
        	        	 %>
        	        	  <img alt="" src="../upload/<%=dto.getM_photo() %>" class="rounded-circle">
        	        	  
        	        	  
        	         <%}
        	       %> --%>
        	       
        	       <img src="<%=dto.getPhoto()%>" class="rounded-circle">
        	     
        	       <br>
        	       <b><%=dto.getName() %></b>
        	     </td>
        	     <td align="center" valign="middle"><%=dto.getHp() %></td>
        	     <td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
        	     <td align="center" valign="middle">
        	       <button type="button" class="btn btn-success btn-sm"
        	       onclick="location.href='updatePassForm.jsp?num=<%=dto.getNum() %>'">수정</button>
        	       <button type="button" class="btn btn-danger btn-sm"
        	       onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum() %>'">삭제</button>
        	     </td>
        	   </tr>
           <%}
         %>
         
     </table>
  </div>

</body>
</html>