<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myinfo.model.MyInfoDto"%>
<%@page import="java.util.List"%>
<%@page import="myinfo.model.MyInfoDao"%>
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
<title>list info</title>
</head>
<%
	MyInfoDao dao = new MyInfoDao();
	List<MyInfoDto> list = dao.allSelect();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	
%>
<body>
	<div>
		<button class="btn btn-info" onclick="location.href='insertInfo.jsp'">데이터 추가</button>
		<hr>
		<table class="table table-bordered" style="width:800px;">
			<caption align="top"><b>개인정보 목록</b></caption>
			<tr>
				<th class="table-info">번호</th>
				<th class="table-info">이름</th>
				<th class="table-info">핸드폰</th>
				<th class="table-info">혈액형</th>
				<th class="table-info">생년월일</th>
				<th class="table-info">작성일</th>
				<th class="table-info">편집</th>
			</tr>
			<%
			for(int i=0;i<list.size();i++)
			{
				MyInfoDto my = list.get(i); %>
				
				<tr>
					<td align="center"><%=i+1 %></td>
					<td align="center"><%=my.getName() %></td>
					<td align="center"><%=my.getHp() %></td>
					<td align="center"><%=my.getBlood() %>형</td>
					<td align="center"><%=my.getBirth() %></td>
					<td align="center"><%=sdf.format(my.getWriteday()) %></td>
					<td>
					<input type="button" class="btn btn-outline-warning btn-sm" value="수정"
							onclick="location.href='updateInfo.jsp?num=<%=my.getNum()%>'">
					<input type="button" class="btn btn-outline-danger btn-sm" value="삭제"
							onclick="location.href='deleteInfo.jsp?num=<%=my.getNum()%>'">
					</td>
					
				</tr>
			<%}
			%>
		</table>
		
	</div>
</body>
</html>