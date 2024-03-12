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
	}/* 
	td{
		width: 700px
	} */
	
</style>
<script type="text/javascript">
    $(document).ready(function(){
        // 페이지 로드시 초기 선택 값에 따라 이미지 설정
        var selectedImg = $("#img").val();
        showImage(selectedImg);

        // 셀렉트 박스 값이 변경될 때마다 이미지 설정
        $("#img").change(function(){
            var selectedValue = $(this).val();
            showImage(selectedValue);
        });

        // 이미지를 보여주는 함수
        function showImage(imgValue) {
            // 이미지 경로를 선택된 값에 따라 설정
            var imgSrc = "../img/" + imgValue + ".jpg";
            // 이미지 출력
            $("#myimg").attr("src", imgSrc);
        }
    });
</script>
<title>addform</title>
</head>
<body>
	<div style="width:800px">
		<form action="addaction.jsp">
			<table class="table table-bordered">
				<caption align="top"><b>상품등록</b></caption>
				<tr>
					<th class="table-success">상품명</th>
					<td>
						<input type="text" name="name" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-success">상품이미지</th>
					<td style="display: flex; align-items: center;">
						<select name="img" id="img" class="torm-control">
							<option value="11">산</option>
							<option value="12">야쿠르</option>
							<option value="13">하울</option>
							<option value="14">하쿠</option>
							<option value="15">가오나시</option>
							<option value="16">토토로</option>
							<option value="17">도륵이</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<!-- 클릭 시 이미지 출력 -->
						<img src="" width="30" id="myimg">
					</td>
				</tr>
				<tr>
					<th class="table-success">가격</th>
					<td>
						<input type="text" name="price" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-success">입고일</th>
					<td>
						<input type="date" name="startday" class="form-control" value="2024-03-12" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info" style="width:80px">등록</button>
						<button type="button" class="btn btn-outline-success" style="width:80px"
								onclick="location.href='shoplist.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>