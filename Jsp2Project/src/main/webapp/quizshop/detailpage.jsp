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
<title>detail page</title>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	System.out.println("넘어온 id "+id);
	
	QuizShopDao dao = new QuizShopDao();
	// 하나 얻어옴
	QuizShopDto shop = dao.getSelect(id);
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
	<!-- 이미지 크게와 옆에 설명 추가(상품명, 가격, 입고일) -->
	<div style="width: 800px">
		<h4 class="alert alert-info">QuizShop 상품상세</h4><br>
		<form action="updateform.jsp">
			<input type="hidden" name="id" value="<%= shop.getId()%>">
			<table class="table table-bordered">
				<!-- <caption align="top"><b>상품상세</b></caption> -->
				<tr>
					<td rowspan="4" style="width:300px;">
						<img src="../img/<%=shop.getImg() %>.png" style="width:200px;height: 200px">
					</td>
					<td>이름 : <%=shop.getName() %></td>
				</tr>
				<tr>
					<td>가격 : <%=shop.getPrice() %></td>
				</tr>
				<tr>
					<td>입고일 : <%= shop.getStartday() %></td>
				</tr>
				<tr>
					<td>등록일 : <%= writeday %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-warning" style="width:80px">수정</button>
						<button type="button" class="btn btn-outline-danger" style="width:80px"
								onclick="location.href='deleteshop.jsp?id=<%= shop.getId()%>'">삭제</button>
						<button type="button" class="btn btn-outline-success" style="width:80px"
								onclick="location.href='shoplist.jsp'">목록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>