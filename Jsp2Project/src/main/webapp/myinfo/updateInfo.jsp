<%@page import="myinfo.model.MyInfoDto"%>
<%@page import="myinfo.model.MyInfoDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	td{
		width: 700px
	}
	
</style>
<script type="text/javascript">
	function goFocus(hp){
		if(hp.value.length==4)
			frm.hp3.focus(); // name이 frm 안에 name이 hp3인 곳에 포커스
        	frm.hp3.value = ''; // hp3 필드 초기화
	}
</script>
<title>Update Info</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	MyInfoDao dao = new MyInfoDao();
	MyInfoDto my = dao.getSelect(num);
	
	String hp = my.getHp();
	String[] split = hp.split("-");
	String hp1 = split[0];
	String hp2 = split[1];
	String hp3 = split[2];
	
	String blood = my.getBlood();
	String writeday = sdf.format(my.getWriteday());
	
%>
<body>
	<div>
		<form action="updateAction.jsp" method="post" name="frm">
			<input type="hidden" name="num" value="<%= num%>">
			<table class="table table-bordered" style="width:800px">
			<caption align="top"><b>개인신상정보</b></caption>
			<tr>
				<th class="table-info">이름</th>
				<td>
					<input type="text" name="name" class="form-control" value="<%=my.getName() %>">
				</td>
			</tr>
			<tr>
				<th class="table-info">혈액형</th>
				<td>
					<select name="blood" class="form-control">
						<option value="A" <%= blood.equals("A") ? "selected" : "" %>>A형</option>
						<option value="B" <%= blood.equals("B") ? "selected" : "" %>>B형</option>
						<option value="O" <%= blood.equals("O") ? "selected" : "" %>>O형</option>
						<option value="AB" <%= blood.equals("AB") ? "selected" : "" %>>AB형</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="table-info">연락처</th>
				<td class="d-inline-flex">
					<select name="hp1" class="form-select">
						<option value="010" <%= hp1.equals("010") ? "selected" : "" %>>010</option>
						<option value="011" <%= hp1.equals("011") ? "selected" : "" %>>011</option>
						<option value="017" <%= hp1.equals("017") ? "selected" : "" %>>017</option>
					</select>
					<b>-</b>
					<input type="text" name="hp2" value="<%=hp2 %>" class="form-control" required="required" onkeyup="goFocus(this)">
					<b>-</b>
					<input type="text" name="hp3" value="<%=hp3 %>" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-info">생년월일</th>
				<td>
					<input type="date" name="birth" class="form-control" value="<%=writeday %>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정" class="btn btn-outline-warning" style="width:100px;">
					<input type="button" value="목록" class="btn btn-outline-success" style="width:100px;"
							onclick="location.href='listInfo.jsp'">
				</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>