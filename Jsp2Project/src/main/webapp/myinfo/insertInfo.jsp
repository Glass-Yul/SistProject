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
			frm.hp3.focus(); //name이 frm 안에 name이 hp3인 곳에 포커스
	}
</script>
<title></title>
</head>
<body>
	<div>
		<form action="insertAction.jsp" method="post" name="frm">
			<table class="table table-bordered" style="width:800px">
			<caption align="top"><b>개인신상정보</b></caption>
			<tr>
				<th class="table-info">이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-info">혈액형</th>
				<td>
					<select name="blood" class="form-control">
						<option value="A">A형</option>
						<option value="B">B형</option>
						<option value="O">O형</option>
						<option value="AB">AB형</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="table-info">연락처</th>
				<td class="d-inline-flex">
					<select name="hp1" class="form-select">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
					</select>
					<b>-</b>
					<input type="text" name="hp2" class="form-control" required="required" onkeyup="goFocus(this)">
					<b>-</b>
					<input type="text" name="hp3" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th class="table-info">생년월일</th>
				<td>
					<input type="date" name="birth" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장" class="btn btn-outline-info" style="width:100px;">
					<input type="button" value="목록" class="btn btn-outline-success" style="width:100px;">
				</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>