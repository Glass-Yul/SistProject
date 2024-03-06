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
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered" style="width:800px;">
				<caption align="top">회원 정보 추가</caption>
				<tr>
					<th class="table-primary">이름</th>
					<td>
						<input type="text" name="name" class="form-control" >
					</td>
				</tr>
				<tr>
					<th class="table-primary">나이</th>
					<td>
						<input type="text" name="age" class="form-control" >
					</td>
				</tr>
				<tr>
					<th class="table-primary">생일</th>
					<td>
						<input type="date" name="birthday" class="form-control" value="2000-01-01" >
					</td>
				</tr>
				<tr>
					<th class="table-primary">거주지역</th>
					<td>
						<label><input type="radio" name="hometown" value="서울" checked="checked">서울</label>
						<label><input type="radio" name="hometown"  value="경기">경기</label>
						<label><input type="radio" name="hometown"  value="인천">인천</label>
						<label><input type="radio" name="hometown"  value="세종">세종</label>
						<label><input type="radio" name="hometown"  value="판교">판교</label>
					</td>
				</tr>
				<tr>
					<th class="table-primary">취미</th>
					<td>
						<label><input type="checkbox" name="hobby" value="운동하기">운동하기</label>
						<label><input type="checkbox" name="hobby" value="그림그리기">그림그리기</label>
						<label><input type="checkbox" name="hobby" value="운영화감상">영화감상</label>
						<label><input type="checkbox" name="hobby" value="운코딩하기">코딩하기</label>
					</td>
				</tr>
				<tr>
					<th class="table-primary">자기소개</th>
					<td>
						<textarea name="memo" style="width: 200px; height: 100px" class="form-control">
						
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit"  class="btn btn-outline-success">회원 정보 저장</button>
						<button type="button"  class="btn btn-outline-success"
								onclick="location.href='introductionList.jsp'">회원 목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>