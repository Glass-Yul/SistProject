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
<title>list2 form</title>
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
		<div class="row row-cols-1 row-cols-md-4 g-4">
	<%
	int cnt = list.size();
	for(int i=cnt;i>0;i--)
	{
	    UploadBoardDto board = list.get(i-1); 
	%>
	    <div class="col">
	        <div class="card h-100">
	            <img src="../img/<%=board.getImgname() %>" style="width:100px;height: 100px" class="card-img-top" alt="...">
	            <div class="card-body">
	                <h4 class="card-title">제목: <%=board.getSubject() %></h4>
	                <p class="card-text">작성자: <%=board.getWriter() %> <br> 작성일: <%=sdf.format(board.getWriteday()) %> <br> 조회: <%=board.getReadcount() %></p>
	                <a href="detailBoard.jsp?num=<%=board.getNum()%>" class="btn btn-primary">자세히 보기</a>
	            </div>
	        </div>
	    </div>
	<%
	}
	%>
	</div>
		
	</div>
</body>
</html>