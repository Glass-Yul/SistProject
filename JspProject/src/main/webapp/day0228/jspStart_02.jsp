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
	<%!
		String name="홍길동";
		String hp="000-999-888";
		int age=22;
		
		public String getCheck(int age){
			
			if(age>=20)
				return "성인임";
			else
				return "미성년임";
			
		}
	%>
	
	<%=name %>님의 나이는 <%=age %>세 입니다.
	<%getCheck(age); %>
</body>
</html>