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
		font-family: 'Nanum Pen Script';
		font-size: 1.5em;
		margin: 100px;
  		width: 300px;
  		
	}
	a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소로부터 상속받은 글씨색을 유지 */
}
	
</style>
<title>삭제 시 비번으로 확인</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
%>
<body>
	<div>
		<form action="deletePwdAction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>">
			<div class="input-group">
				<h4 >비밀번호 확인</h4>
				<input type="password" class="form-control" required="required" name="pwd"
						style="width:200px;"><br>
			</div>
			<br>
			<button type="submit" class="btn btn-outline-danger"style="width:80px">
			<i class="bi bi-trash3"></i>삭제</button>
			<button type="button" class="btn btn-outline-success" style="width:80px"
					onclick="location.href='listBoard.jsp'">
					<i class="bi bi-list-ul"></i>목록</button>
		</form>
	</div>
</body>
</html>