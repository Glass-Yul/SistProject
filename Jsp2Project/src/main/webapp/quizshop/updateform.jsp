<%@page import="java.text.SimpleDateFormat"%>
<%@page import="quizshop.QuizShopDto"%>
<%@page import="quizshop.QuizShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	/* position: absolute; */
	/* border: 1px solid gray; */
	font-family: 'Nanum Pen Script';
	font-size: 1.5em;
	margin: 50px
} /* 
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
            var imgSrc = "../img/" + imgValue + ".png";
            // 이미지 출력
            $("#myimg").attr("src", imgSrc);
        }
    });
</script>
<title>update form</title>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	System.out.println("넘어온 id "+id);
	
	QuizShopDao dao = new QuizShopDao();
	// 하나 얻어옴
	QuizShopDto shop = dao.getSelect(id);
	String img = shop.getImg();
	
	System.out.println("id "+shop.getId());
	System.out.println("name "+shop.getName());
	System.out.println("price "+shop.getPrice());
	System.out.println("day1 "+shop.getStartday());
	System.out.println("day2 "+shop.getFinishday());
	System.out.println("img "+shop.getImg());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeday = sdf.format(shop.getFinishday());
%>
</head>
<body>
	<div style="width:800px">
		<form action="updateaction.jsp">
			<input type="hidden" name="id" value="<%= shop.getId()%>">
			<table class="table table-bordered">
				<caption align="top"><b>상품수정</b></caption>
				<tr>
					<th class="table-success">상품명</th>
					<td>
						<input type="text" name="name" class="form-control" value="<%=shop.getName() %>">
					</td>
				</tr>
				<tr>
					<th class="table-success">상품이미지</th>
					<td style="display: flex; align-items: center;">
						<select name="img" id="img" class="torm-control">
							<option value="11" <%= img.equals("11") ? "selected" : "" %>>산</option>
							<option value="12" <%= img.equals("12") ? "selected" : "" %> >야쿠르</option>
							<option value="13" <%= img.equals("13") ? "selected" : "" %>>하울</option>
							<option value="14" <%= img.equals("14") ? "selected" : "" %>>하쿠</option>
							<option value="15" <%= img.equals("15") ? "selected" : "" %>>가오나시</option>
							<option value="16" <%= img.equals("16") ? "selected" : "" %>>토토로</option>
							<option value="17" <%= img.equals("17") ? "selected" : "" %>>도륵이</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<!-- 클릭 시 이미지 출력 -->
						<img src="" width="30" id="myimg">
					</td>
				</tr>
				<tr>
					<th class="table-success">가격</th>
					<td>
						<input type="text" name="price" class="form-control" value="<%=shop.getPrice() %>">
					</td>
				</tr>
				<tr>
					<th class="table-success">입고일</th>
					<td>
						<input type="date" name="startday" class="form-control" value="<%=shop.getStartday() %>" readonly>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info" style="width:80px">수정완료</button>
						<button type="button" class="btn btn-outline-success" style="width:80px"
								onclick="location.href='shoplist.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>