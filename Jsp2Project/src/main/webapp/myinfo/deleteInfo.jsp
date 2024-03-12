<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myinfo.model.MyInfoDto"%>
<%@page import="myinfo.model.MyInfoDao"%>
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
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");

	MyInfoDao dao = new MyInfoDao();
	
	/* dao.delete(num);
	
	response.sendRedirect("listInfo.jsp"); */
	
%>
<script type="text/javascript">
    var confirmDelete = confirm("정말 삭제하시겠습니까?");
    
    if (confirmDelete) {
        <% dao.delete(num); %>
        alert("삭제되었습니다.");
        location.href = "listInfo.jsp"; // 삭제 후 이동할 페이지
    } else {
        alert("취소되었습니다.");
        history.back(); // 이전 페이지로 이동
    }
</script>
</body>
</html>