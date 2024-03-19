<%@page import="mem_gaip.model.MemgaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   function saveId(id) {
      //alert(id);
      //부모창:opener
      opener.mfrm.id.value=id;
      
      window.close(); //현재창 닫기
   }
</script>
<style type="text/css">
	body{
		margin:50px;
		font-family: 'Nanum Pen Script';
		font-size: 2em;
	}
</style>
</head>
<body>
   <%
      String key=request.getParameter("key"); //처음호출 시 null값
      if(key==null){
         //null값일때는 폼을 나타냄
         %>
            <div style="margin: 10px 30px">
               <form action="idSearch.jsp" method="post">
                  <b>아이디를 입력해주세요</b><br>
                  <div class="d-inline-flex">
                  <input type="text" name="id" class="form-control"
                  style="width: 130px" required="required" placeholder="아이디 입력">
                  <input type="hidden" name="key" value="yes">
                  <button type="submit"class="btn btn-success"
                  style="margin-left: 10px;">중복체크</button>
                  </div>
               </form>
            </div>
      <%}else{
         //idSearch 액션처리
         String id=request.getParameter("id");
         System.out.println("id "+id);
         
         //dao선언 후 아이디가 db에 존재하는지 확인
         MemgaipDao dao=new MemgaipDao();
         boolean b=dao.isIdCheck(id);
         
         if(b){
            //입력된 아이디가 존재하는 경우
            %>
            <div style="margin: 50px 50px;">
               <h5><%=id %>는 이미 가입된 아이디 입니다</h5>
               <img alt="" src="../img/15.png" width="60" align="left">&nbsp;&nbsp;
               <button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시 입력</button>
            </div>
         <%}else{
            //입력된 아이디가 존재하지 않는 경우
            %>
            <div style="margin: 50px 50px;">
               <h5><%=id %>는 사용 가능한 아이디 입니다</h5>
               <img alt="" src="../img/15.png" width="60" align="left">&nbsp;&nbsp;
               <button type="button" class="btn btn-info" onclick="saveId('<%=id%>')">적용하기</button>
               <button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시 입력</button>
            </div>
         <%}
      }
   %>
</body>
</html>