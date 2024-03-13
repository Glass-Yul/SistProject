<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.model.UploadBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.model.UploadBoardDao"%>
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
	a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소로부터 상속받은 글씨색을 유지 */
}
	
</style>
<title>list form</title>
</head>
<%
	UploadBoardDao dao = new UploadBoardDao();
	List<UploadBoardDto> list = dao.allSelect();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="width:800px;">
		<button type="button" class="btn btn-info"
				onclick="location.href='addForm.jsp'">게시글 추가</button><br><br>
		<h4 class="alert alert-info">총 <%=list.size() %>개의 게시글이 존재함</h4>
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th style="width:400px;">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<%
			int cnt = list.size();
			for(int i=cnt;i>0;i--)
			{
				UploadBoardDto board = list.get(i-1); %>
				<tr>
					<td><%=i %></td>
					<td>
						<a href="detailBoard.jsp?num=<%=board.getNum()%>">
						<img src="../img/<%=board.getImgname() %>" style="width:70px;height: 70px">
						<%=board.getSubject() %>
						</a>
					</td>
					<td><%=board.getWriter() %></td>
					<td><%=sdf.format(board.getWriteday()) %></td>
					<td><%=board.getReadcount() %></td>
				</tr>
			<%
				//cnt--;
			}
			%>
		</table>
	</div>
</body>
</html>