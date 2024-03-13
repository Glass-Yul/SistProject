<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.model.UploadBoardDao"%>
<%@page import="uploadboard.model.UploadBoardDto"%>
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
<style type="text/css">
	body{
		/* position: absolute; */
		/* border: 1px solid gray; */
		font-family: 'Nanum Pen Script';
		font-size: 1.5em;
		margin: 50px
	}
	
</style>
<title>detail</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	//입력값 읽기
	String num = request.getParameter("num");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	UploadBoardDao dao = new UploadBoardDao();
	UploadBoardDto board = dao.getSelect(num);
	dao.updateCount(board.getNum());
	board = dao.getSelect(num);
	

%>

	<div style="width: 800px">
		<h4 class="alert alert-info">상세 게시글</h4><br>
		<form action="updateBoard.jsp">
			<input type="hidden" name="num" value="<%= board.getNum()%>">
			<table class="table table-bordered">
				<!-- <caption align="top"><b>상품상세</b></caption> -->
				<tr>
					<td rowspan="5" style="width:300px;">
						<img src="../img/<%=board.getImgname() %>" style="width:200px;height: 200px">
					</td>
					<td>작성자 : <%=board.getWriter() %></td>
				</tr>
				<tr>
					<td>제목 : <%=board.getSubject() %></td>
				</tr>
				<tr>
					<td>내용 : <%= board.getContent().replace("\n", "<br>") %></td>
				</tr>
				<tr>
					<td>등록일 : <%= sdf.format(board.getWriteday()) %></td>
				</tr>
				<tr>
					<td>조회수 : <%= board.getReadcount() %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-warning" style="width:80px">수정</button>
						<button type="button" class="btn btn-outline-danger" style="width:80px"
								onclick="location.href='deleteBoard.jsp?num=<%=board.getNum() %>'">삭제</button>
						<button type="button" class="btn btn-outline-success" style="width:80px"
								onclick="location.href='listBoard.jsp'">목록형</button>
						<button type="button" class="btn btn-outline-success" style="width:80px"
								onclick="location.href='listBoard2.jsp'">앨범형</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>