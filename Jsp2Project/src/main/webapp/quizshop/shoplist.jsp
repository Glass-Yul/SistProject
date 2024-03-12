<%@page import="java.text.SimpleDateFormat"%>
<%@page import="quizshop.QuizShopDto"%>
<%@page import="java.util.List"%>
<%@page import="quizshop.QuizShopDao"%>
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
<title>shop list</title>
<%
	request.setCharacterEncoding("utf-8");

	QuizShopDao dao = new QuizShopDao();
	List<QuizShopDto> list = dao.allSelect();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
%>
<script>
        $(document).ready(function () {
        	// 각 행의 상품명 클릭 이벤트 설정
            $("table").on("click", "tr.product-row", function () {
                // 해당 상품의 번호 가져오기
                var productId = $(this).find("td:first").text();

                // 상품 상세 페이지로 이동
                window.location.href = "productDetail.jsp?productId=" + productId;
            });
        });
    </script>
</head>
<body>

	<div style="width: 800px;">
		<h4 class="alert alert-info">QuizShop 입고 목록</h4><br>
		<button type="button" class="btn btn-info"
				onclick="location.href='addform.jsp'">상품추가</button><br><br>
		<table class="table table-bordered" >
			<tr class="table-info">
				<th>번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>입고일</th>
				<th>등록일</th>
			</tr>
			<%
			for(int i=0;i<list.size();i++)
			{
				QuizShopDto shop = list.get(i); %>
			<tr>
				<td><%=shop.getId() %></td>	
				<td onclick="location.href='detailpage.jsp?id=<%= shop.getId() %>'"
					style="cursor: pointer;"><%=shop.getName() %></td>	
				<td><%=shop.getPrice() %></td>	
				<td><%=shop.getStartday() %></td>	
				<td><%=sdf.format(shop.getFinishday()) %></td>	
			</tr>
			<%}
			%>
		</table>
	</div>
</body>
</html>