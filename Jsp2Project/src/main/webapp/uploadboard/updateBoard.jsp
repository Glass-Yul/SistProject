<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.model.UploadBoardDao"%>
<%@page import="uploadboard.model.UploadBoardDto"%>
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
	}
	#preshow{
		position:absolute;
		left:900px;
		top:100px
	}
	
</style>
<script type="text/javascript">
/* function readURL(input) { =====>>>> oniy 자바스크립트
	
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preshow').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preshow').src = "";
	  }
	} */
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                $('#preshow').attr('src', e.target.result);
                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                //(아래 코드에서 읽어들인 dataURL형식)
            }                   
            reader.readAsDataURL(input.files[0]);
            //File내용을 읽어 dataURL형식의 문자열로 저장
        }
    }//readURL()--

    //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
    $("#preshow").change(function(){
        //alert(this.value); //선택한 이미지 경로 표시
        readURL(this);
    });
</script>
<title>update form</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	UploadBoardDao dao = new UploadBoardDao();
	UploadBoardDto board = dao.getSelect(num);
	System.out.println("num "+num);
	System.out.println("writer "+board.getWriter());
	System.out.println("subject "+board.getSubject());
	System.out.println("img "+board.getImgname());
	System.out.println("pass "+board.getPass());
	System.out.println("content "+board.getContent());
%>
<body>
	<div style="width:800px">
		<form action="updateAction.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%= board.getNum()%>">
			<table class="table table-bordered">
				<tr>
					<th class="table-info">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" value="<%=board.getWriter() %>">
					</td>
				</tr>
				<tr>
					<th class="table-info">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" value="<%=board.getSubject() %>">
					</td>
				</tr>
				<tr>
					<th class="table-info">이미지 업로드</th>
					<td>
						<%-- <input type="file" name="img" class="form-control" value="<%=board.getImgname() %>" onchange="readURL(this);"> --%>
						<input type="file" name="img" class="form-control" onchange="readURL(this);">
	                    <!-- 이미지 파일이 선택된 경우에만 미리보기 이미지 표시 -->
	                    <img alt="" src="<%= board.getImgname() != null ? "../img/" + board.getImgname() : "" %>" id="preshow" style="max-width: 200px; max-height: 200px; display: <%= board.getImgname() != null ? "block" : "none" %>;">
					</td>
				</tr>
				<tr>
					<th class="table-info">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control" value="<%=board.getPass() %>">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" class="form-control" style="height: 200px" ><%=board.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정" class="btn btn-outline-warning">
						<button type="button" class="btn btn-outline-info"
								onclick="location.href='listBoard.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>
		
		<!-- 미리 보기 이미지 -->
		<img alt="" src="" id="preshow">
	</div>
</body>
</html>