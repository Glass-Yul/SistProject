<%@page import="team.model.TeamDto"%>
<%@page import="java.util.List"%>
<%@page import="team.model.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8");
	
	TeamDao dao = new TeamDao();
	List<TeamDto> teams = dao.getAllTeam();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
body {
	margin: 30px;
	font-family: 'Gaegu';
	font-size: 1.3em;
}
</style>
<title>teamList</title>
</head>
<body>
	<button type="button" class="btn btn-light"
			onclick="location.href='addForm.jsp'">팀회원 정보 추가</button>
	<br>
	<table class="table table-borderd" style="width: 1000px;">
		<caption align="top">해당 팀회원 정보 리스트</caption>
		<tr>
			<th class="table-primary">no</th>
			<th class="table-primary">이름</th>
			<th class="table-primary">면허여부</th>
			<th class="table-primary">주소</th>
			<th class="table-primary">작성일</th>
			<th class="table-primary">편집</th>
		</tr>
		<%
			for(int i=0;i<teams.size();i++)
			{
				TeamDto team = teams.get(i);
				%>
				<tr>
					<td><%=team.getNum() %></td>
					<td><%=team.getName() %></td>
					<td><%=team.getDriver() %></td>
					<td><%=team.getAddr() %></td>
					<td><%=team.getWriteday() %></td>
					<td>
						<button type="button" class="btn btn-warning"
								onclick="location.href='updateForm.jsp?num=<%=team.getNum()%>'">수정</button>
						<button type="button" class="btn btn-danger"
								onclick="location.href='teamDelete.jsp?num=<%=team.getNum()%>'">삭제</button>
					</td>					
				</tr>
				<%
			}
		%>
	</table>
</body>
</html>