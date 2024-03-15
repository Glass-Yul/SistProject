<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleboardDao"%>
<%@page import="simpleboard.model.SimpleboardDto"%>
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
		/* position: absolute; */
		/* border: 1px solid gray; */
		font-family: 'Nanum Pen Script';
		font-size: 1.5em;
		margin: 50px
	}
	
	span.day{
		color:#ccc;
		
	}
	
</style>
<title>내용 보기/수정/삭제 버튼</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	SimpleboardDao dao = new SimpleboardDao();
	SimpleboardDto board = dao.getSelect(num);
	dao.updateCount(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	System.out.println("== View ==");
	System.out.println("num "+num);
	System.out.println("writer "+board.getWriter());
	System.out.println("writeday "+board.getWriteday());
	
%>
<body>
	<div style="width: 800px">
		<table class="table table-bordered">
		<caption align="top"><b><%=board.getSubject() %></b></caption>
		<tr>
			<td>
				<b>작성자 : <%=board.getWriter() %></b><br>
				<span class="day"><%=sdf.format(board.getWriteday()) %></span>&nbsp;&nbsp;&nbsp;
				조회수 : <%=board.getReadcount() %>
			</td>
		</tr>
		<tr>
			<td>
				<%=board.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-outline-info" style="width:80px"
						onclick="location.href='addBoard.jsp'">
						<i class="bi bi-pencil"></i>글쓰기</button>
				<button type="button" class="btn btn-outline-warning"
						onclick="location.href='updateBoard.jsp?num=<%=board.getNum() %>'" style="width:80px">
						<i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" class="btn btn-outline-danger" style="width:80px"
						onclick="location.href='deletePwdBoard.jsp?num=<%=board.getNum() %>'">
						<i class="bi bi-trash3"></i>삭제</button>
				<button type="button" class="btn btn-outline-success" style="width:80px"
						onclick="location.href='listBoard.jsp'">
						<i class="bi bi-list-ul"></i>목록</button>
			</td>
		</tr>
		</table>
	</div>
</body>
</html>