<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleboardDto"%>
<%@page import="simpleboard.model.SimpleboardDao"%>
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
	#preshow{
		position:absolute;
		left:900px;
		top:100px
	}
	
</style>
<script type="text/javascript">

</script>
<title>update board</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	
	SimpleboardDao dao = new SimpleboardDao();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	SimpleboardDto board = dao.getSelect(num); // 데이터 받음
%>
	<div style="width:800px">
		<form action="updatePwdBoard.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
			<table class="table table-bordered">
				<tr>
					<th class="table-info">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" value="<%=board.getWriter() %>">
					</td>
				</tr>
				<tr>
					<th class="table-info">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" value="<%=board.getSubject() %>">
					</td>
				</tr>
				<tr>
					<th class="table-info">비밀번호</th>
					<td>
						<input type="password" name="pwd" class="form-control" value="<%=board.getPwd() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" class="form-control" style="height: 200px" required="required"><%=board.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<!-- type이 image와 submit일 경우 기본기능이 submit임 -->
						<input type="submit" value="수정" class="btn btn-outline-warning">
						<button type="button" class="btn btn-outline-info"
								onclick="location.href='listBoard.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
		
</body>
</html>