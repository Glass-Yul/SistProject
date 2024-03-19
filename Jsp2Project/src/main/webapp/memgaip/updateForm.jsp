<%@page import="memgaip.model.MemgaipDao"%>
<%@page import="memgaip.model.MemgaipDto"%>
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
		margin:50px;
		font-family: 'Nanum Pen Script';
		font-size: 2em;
	}
</style>
<title>update form</title>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	System.out.println("update form num "+num);
	
	MemgaipDao dao = new MemgaipDao();
	MemgaipDto mem = dao.getMem(num);
%>
<script type="text/javascript">
  function openId(){
	  window.open("idSearch.jsp","idcheck","left='100px',top='100px',width='400px',height='200px'")
  }
$(function(){
	  
	  $("#btnsubmit").click(function(){
		  if(mfrm.m_id.value.length==0){
			  alert("아이디 입력버튼을 눌러주세요");
			  return false; //form action호출 안됨
		  }
	  })
  })
</script>
</head>
<body>
	<div style="width:500px">
		<form action="updateMember.jsp" method="post" enctype="multipart/form-data" name="mfrm">
			<input type="hidden" name="num" value="<%=mem.getNum() %>"> 
			<table class="table table-bordered">
				<caption align="top"><b>회원수정</b></caption>
				<tr>
  			  <td width="120" class="table-primary">아이디</td>
  			  <td >
  			    <div class="d-inline-flex">
	  			    <input type="text" class="form-control" style="width: 120px;" 
	  			    	name="id" required="required" readonly="readonly" value="<%=mem.getId() %>">
	  			    <button type="button" class="btn btn-danger btn-sm" 
	  			    style="margin-left: 20px;" onclick="openId()">아이디 입력</button>
  			    </div>
  			  </td>
  			</tr>
  			
  			<tr>
  			  <td width="120" class="table-primary">비밀번호</td>
  			  <td>
  			    <input type="password" class="form-control"
  			    style="width: 120px;" name="pass" value="<%=mem.getPass() %> %>" required="required" readonly="readonly">
  			  </td>
  			</tr>
  			
  			<tr>
  			  <td width="120" class="table-primary">회원명</td>
  			  <td>
  			    <input type="text" class="form-control"
  			    style="width: 120px;" name="name" required="required" value="<%=mem.getName() %>">
  			  </td>
  			</tr>
  			
  			<tr>
  			  <td width="120" class="table-primary">사진</td>
  			  <td>
  			    <input type="file" class="form-control"
  			    style="width: 200px;" name="photo" value="<%=mem.getPhoto() %>">
  			  </td>
  			</tr>
  			
  			<tr>
  			  <td width="120" class="table-primary">핸드폰</td>
  			  <td>
  			    <input type="text" class="form-control"
  			    style="width: 180px;" name="hp" required="required" value="<%=mem.getHp() %>">
  			  </td>
  			</tr>
  			
  			<tr>
  			  <td colspan="2" align="center">
  			    <button type="submit" class="btn btn-warning">회원수정</button>
  			    <button type="button" class="btn btn-info"
  			    		onclick="location.href='listMember.jsp'">목록</button>
  			  </td>
  			</tr>
			</table>

		</form>
	</div>
</body>
</html>