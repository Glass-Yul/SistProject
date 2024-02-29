<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title></title>
</head>
<body>
	<form action="infoPrint.jsp" method="post">
		<table class="table table-bordered" style="width:50%">
			<caption align="top">
			Radio & check
			</caption>
			<tr height="30">
				<td>
					<b>최종 학력 선택</b>
					<input type="radio" name="grade" value="고등학교">고등학교&nbsp;
					<input type="radio" name="grade" value="전문대학교">전문대학교&nbsp;
					<input type="radio" name="grade" value="대학교">대학교&nbsp;
					<input type="radio" name="grade" value="대학원">대학원&nbsp;
				</td>
			</tr>
			<tr height="30">
				<td>
					<b>가능한 컴퓨터 언어</b>
					<input type="checkbox" name="lang" value="C++">C++&nbsp;
					<input type="checkbox" name="lang" value="java">java&nbsp;
					<input type="checkbox" name="lang" value="파이썬">파이썬&nbsp;
					<input type="checkbox" name="lang" value="Vue">Vue&nbsp;
				</td>
			</tr>
			<tr height="30">
				<td>
					<b>같은 조 하고 싶은 사람</b>
					<select name="like">
						<option value="가" selected="selected">가</option>
						<option value="나">나</option>
						<option value="다">다</option>
						<option value="라">라</option>
					</select>
				</td>
			</tr>
			<tr height="30">
				<td>
					<b>당신의 키</b>
					<input type="number" name="height">cm
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="전송">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>