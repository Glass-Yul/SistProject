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
<title>add board</title>
</head>
<body>
	<div style="width:800px">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered">
				<tr>
					<th class="table-info">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-info">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-info">비밀번호</th>
					<td>
						<input type="password" name="pwd" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" class="form-control" style="height: 200px" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<!-- type이 image와 submit일 경우 기본기능이 submit임 -->
						<input type="submit" value="저장" class="btn btn-outline-success">
						<button type="button" class="btn btn-outline-info"
								onclick="location.href='listBoard.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>