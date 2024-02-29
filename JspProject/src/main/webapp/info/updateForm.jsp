<%@page import="info.model.InfoDto"%>
<%@page import="info.model.InfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>추가</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		InfoDao dao = new InfoDao();
		InfoDto dto = dao.getDto(id);
		
	%>
	<div style="margin:50px 100px;">
		<form action="updateAction.jsp" method="post">
			<table class="table table-bordered" style="width:350px">
				<tr>
					<th class="table-success" style="width:350px;">이름</th>
					<td>
						<input type="text" name="name" value="<%=dto.getName() %>"
								required="required" class="form-control" style="width:250px;">
					</td>
				</tr>
				<tr>
					<th class="table-success" style="width:80px;">주소</th>
					<td>
						<input type="text" name="addr" value="<%=dto.getAddr() %>"
								required="required" class="form-control" style="width:250px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="id" value="<%=id%>">
						<input type="submit" value="수정" class="btn btn-outline-success"
								onclick="location.href='updateAction.jsp'">
						<input type="button" value="목록" class="btn btn-outline-warning"
								onclick="location.href='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>