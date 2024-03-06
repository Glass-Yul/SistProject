<%@page import="introduction.model.IntroductionDto"%>
<%@page import="introduction.model.IntroductionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");

	IntroductionDao dao = new IntroductionDao();
	IntroductionDto introduction = dao.selectIntroduction(num);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	body{
		margin: 30px;
		font-family: 'Gaegu';
		font-size: 1.3em;
	}
	th{
		text-align: center;
	}
</style>
<title>introduction addForm</title>
</head>
<body>
	<div>
		<form action="updateAction.jsp" method="post">
			<table class="table table-bordered" style="width:800px;">
				<caption align="top">회원 정보 추가</caption>
				<tr>
					<th class="table-primary">이름</th>
					<td>
						<input type="text" name="name" class="form-control" value="<%=introduction.getName() %>" >
					</td>
				</tr>
				<tr>
					<th class="table-primary">나이</th>
					<td>
						<input type="text" name="age" class="form-control" value="<%=introduction.getAge() %>" >
					</td>
				</tr>
				<tr>
					<th class="table-primary">생일</th>
					<td>
						<input type="date" name="birthday" class="form-control" value="<%=introduction.getBirthday()%>">
					</td>
				</tr>
				<tr>
					<th class="table-primary">거주지역</th>
					<td>
						<label><input type="radio" name="hometown" value="서울" 
								<%=introduction.getHometown().equals("서울")?"checked":""%>>서울</label>
						<label><input type="radio" name="hometown"  value="경기"
								<%=introduction.getHometown().equals("경기")?"checked":""%>>경기</label>
						<label><input type="radio" name="hometown"  value="인천"
								<%=introduction.getHometown().equals("인천")?"checked":""%>>인천</label>
						<label><input type="radio" name="hometown"  value="세종"
								<%=introduction.getHometown().equals("세종")?"checked":""%>>세종</label>
						<label><input type="radio" name="hometown"  value="판교"
								<%=introduction.getHometown().equals("판교")?"checked":""%>>판교</label>
					</td>
				</tr>
				<tr>
					<th class="table-primary">취미</th>
					<td>
						<label><input type="checkbox" name="hobby" value="운동하기" >운동하기</label>
						<label><input type="checkbox" name="hobby" value="그림그리기" >그림그리기</label>
						<label><input type="checkbox" name="hobby" value="운영화감상" >영화감상</label>
						<label><input type="checkbox" name="hobby" value="운코딩하기" >코딩하기</label>
					</td>
				</tr>
				<tr>
					<th class="table-primary">자기소개</th>
					<td>
						<textarea name="memo" placeholder="<%=introduction.getMemo() %>" style="width: 200px; height: 100px" class="form-control">
						
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit"  class="btn btn-outline-success">회원 정보 저장</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>