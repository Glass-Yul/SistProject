<%@page import="introduction.model.*"%>
<%@page import="team.model.TeamDto"%>
<%@page import="java.util.List"%>
<%@page import="team.model.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8");
	
	IntroductionDao dao = new IntroductionDao();
	List<IntroductionDto> introductions = dao.getAllIntroduction();
	
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
	margin: 50px;
	font-family: 'Gaegu';
	font-size: 1.3em;
}
</style>
<title>introductionList</title>
</head>
<body>
	<button type="button" class="btn btn-light"
			onclick="location.href='addForm.jsp'">회원 정보 추가</button>
	<br>
	<table class="table table-borderd" >
		<caption align="top">회원 정보 리스트</caption>
		<tr>
			<th class="table-primary">no</th>
			<th class="table-primary">이름</th>
			<th class="table-primary">나이</th>
			<th class="table-primary">생일</th>
			<th class="table-primary">주소</th>
			<th class="table-primary">취미</th>
			<th class="table-primary">자기소개</th>
			<th class="table-primary">편집</th>
		</tr>
		<%
			for(int i=0;i<introductions.size();i++)
			{
				IntroductionDto introduction = introductions.get(i);
				%>
				<tr>
					<td><%=introduction.getNum() %></td>
					<td><%=introduction.getName() %></td>
					<td><%=introduction.getAge() %></td>
					<td><%=introduction.getBirthday() %></td>
					<td><%=introduction.getHometown() %></td>
					<td><%=introduction.getHobby() %></td> 
					<td><%=introduction.getMemo() %></td> 
					<td>
						<button type="button" class="btn btn-warning"
								onclick="location.href='updateForm.jsp?num=<%=introduction.getNum()%>'">수정</button>
						<button type="button" class="btn btn-danger"
								onclick="location.href='introductionDelete.jsp?num=<%=introduction.getNum()%>'">삭제</button>
					</td>					
				</tr>
				<%
			}
		%>
	</table>
</body>
</html>