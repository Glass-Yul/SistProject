<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleboardDao"%>
<%@page import="simpleboard.model.SimpleboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
	
	span.day{
		color:#ccc;
		
	}
	span.aday{
   float: right;
   font-size: 0.8em;
   color: #bbb;
  }
  
  div.alist{margin-left: 20px;}
  
  i.amod{
    margin-left: 20px;
    color: #FFB400;
  }
  
  i.adel{
    color: red;
  }
	
</style>
<script type="text/javascript">

	$(function(){
		
		list();
		
		//alert(num);
		var num=$("#num").val();
		var id=$("#id").val();
		
		// ajax insert
		// 댓글 추가
		$("#btnsend").click(function(){
			 var nickname=$("#nickname").val().trim();
			  var content=$("#content").val().trim();
	        //var data = "{'num':"+num+",'nickname':'"+nickname+"','content':'"+content+"'}";
	        
	        //alert(num);
	        if(nickname==''){
	        	alert("닉네임 입력 후 저장해주세요.");
	        	return;
	        }
	        if(content==''){
	        	alert("댓글 내용 입력 후 저장해주세요.");
	        	return;
	        }
	        
	        $.ajax({
	            type: "post",
	            dataType: "html",
	            data: {"num":num, "nickname":nickname, "content":content},
	            url: "../simpleboardanswer/insertAnswer.jsp",
	            success: function(){
	                //alert("insert success")
	                
	                // insert 성공 시 폼 초기화
	                $("#nickname").val("");
	                $("#content").val("");
	                
	                list();
	            }
			});
		});
	});
	
	// 댓글 수정 완료 버튼 클릭 시
   $(document).on("click", "#btnupdate", function(){
	   var id = $(".alist").find("div[data-answer-id]").data("answer-id");
	   alert(id); 
	   
	   // 그냥 폼 따로 만들어서 hind() show()로 바꿈
	   
        /* var nickname=$("#nickname").val().trim();
        var content=$("#content").val().trim();
        
        if(nickname==''){
            alert("닉네임을 입력하세요.");
            return;
        }
        if(content==''){
            alert("댓글 내용을 입력하세요.");
            return;
        }
        
        $.ajax({
            type: "post",
            dataType: "html",
            data: {"id": id, "nickname":nickname, "content":content},
            url: "../simpleboardanswer/updateAnswer.jsp",
            success: function(){
                $("#nickname").val("");
                $("#content").val("");
                list();
                // 저장 버튼 보이도록 변경
                $("#btnsend").show();
                $("#btnupdated").hide();
            }
        }); */
    });
	
	
	// 삭제
	$(document).on("click", ".adel", function() {
		var id = $(this).closest("div").data("answer-id"); // 부모 div에 data속성 값 가져옴
	    var confirmation = confirm("정말로 이 댓글을 삭제하시겠습니까?"); // 사용자에게 삭제 확인 메시지 보여주기
	    
	    if (confirmation) {
	        $.ajax({
	            type: "post",
	            url: "../simpleboardanswer/deleteAnswer.jsp",
	            dataType: "html",
	            data: {"id": id},
	            success: function(response) {
	                // 서버로부터 성공적인 응답을 받았을 때 할 일
	                alert("댓글이 성공적으로 삭제되었습니다.");
	                // 여기서 list() 함수를 호출하여 댓글 목록을 다시 불러올 수 있습니다.
	                list(); // 댓글 목록 다시 불러오기
	            },
	            error: function(xhr, status, error) {
	                // 서버와의 통신에서 오류가 발생했을 때 할 일
	                alert("댓글 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
	            }
	        });
	    } else {
	        // 사용자가 삭제를 취소한 경우에 대한 처리
	        // 아무런 작업이 필요 없을 수도 있습니다.
	    }
	});
	
	// 수정 버튼 시 화면에 해당 데이터 출력 해줌
	$(document).on("click", ".amod", function() {
		var id = $(this).closest("div").data("answer-id"); // 부모 div에 data속성 값 가져옴
		//alert(id);
		
        $.ajax({
            type: "post",
            url: "../simpleboardanswer/getAnswer.jsp",
            dataType: "json",
            data: {"id": id},
            success: function(data) {
                // 서버로부터 성공적인 응답을 받았을 때 할 일
                //alert(data.nickname);
                // get 성공 시 폼 초기화
                $("#nickname").val(data.nickname);
                $("#content").val(data.content);
                
                /* // 여기서 list() 함수를 호출하여 댓글 목록을 다시 불러올 수 있습니다.
                list(); // 댓글 목록 다시 불러오기 */
                $("#btnsend").hide();
                $("#btnupdate").show();
            },
            error: function(xhr, status, error) {
                // 서버와의 통신에서 오류가 발생했을 때 할 일
                alert("댓글 정보 가져오는 과정에서 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
	    
	});
	
	
	function list(){
		console.log("list num="+$("#num").val());
		  
		  $.ajax({
			  
			  type:"post",
			  url:"../simpleboardanswer/listAnswer.jsp",
			  dataType:"json",
			  data:{"num":$("#num").val()},
			  success:function(res){
				 //alert(res);
				  //댓글갯수출력
				  $("b.acount>span").text(res.length);
				console.log("count="+res.length);
				  
				  var s="";
				  $.each(res,function(idx,item){
					  
					  s+="<div data-answer-id='"+item.id+"'>"+item.nickname+" : "+item.content;
					  s+="<span class='aday'>"+item.writeday+"</span>";
					  s+="<i class='bi bi-pencil-square amod'></i>";
					  s+="<i class='bi bi-trash adel'></i>";
				  });
				  $("div.alist").html(s);
				  
			  }
			  
		  });
	}
	
	// 댓글 삭제 아이콘 누르면
	function godelete(id){
		alert(id);
	}
 
	
	
</script>
<title>내용 보기/수정/삭제 버튼</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	
	SimpleboardDao dao = new SimpleboardDao();
	SimpleboardDto board = dao.getSelect(num);
	dao.updateCount(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	System.out.println("== View ==");
	System.out.println("num "+num);
	System.out.println("writer "+board.getWriter());
	System.out.println("writeday "+board.getWriteday());
	
%>
<body>
	<div style="width: 800px">
		<table class="table table-bordered">
		<caption align="top"><b><%=board.getSubject() %></b></caption>
		<tr>
			<td>
				<b>작성자 : <%=board.getWriter() %></b><br>
				<span class="day"><%=sdf.format(board.getWriteday()) %></span>&nbsp;&nbsp;&nbsp;
				조회수 : <%=board.getReadcount() %>
			</td>
		</tr>
		<tr>
			<td>
				<%=board.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
		
		<!-- 댓글 창 -->
		<tr>
			<td>
				<b class="acount">댓글&nbsp;<span>0</span></b>
				<!-- 게시글 클릭 시 내용이 아닌 댓글이 바로 보이고 싶을 땐 id 설정해줌 -->
				<div class="alist" id="alist">
					댓글목록
				</div>
				<div class="aform input-group" id="answerinsert">
					<input type="hidden" id="num" name="num" value="<%=num %>">
					<input type="text" id="nickname" class="form-control" style="width:100px; margin-left: 10px" placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width:300px; margin-left: 10px" placeholder="댓글 내용">
					<button type="button" id="btnsend" class="btn btn-outline-info btn-sm">저장</button>
				</div>
				<div class="aform input-group" id="answerupdate">
					<input type="hidden" id="num" name="num" value="<%=num %>">
					<input type="text" id="nickname" class="form-control" style="width:100px; margin-left: 10px" placeholder="닉네임">
					<input type="text" id="content" class="form-control" style="width:300px; margin-left: 10px" placeholder="댓글 내용">
					<button type="button" id="btnsend" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<button type="button" class="btn btn-outline-info" style="width:80px"
						onclick="location.href='addBoard.jsp'">
						<i class="bi bi-pencil"></i>글쓰기</button>
				<button type="button" class="btn btn-outline-warning"
						onclick="location.href='updateBoard.jsp?num=<%=board.getNum() %>'" style="width:80px">
						<i class="bi bi-pencil-square"></i>수정</button>
				<button type="button" class="btn btn-outline-danger" style="width:80px"
						onclick="location.href='deletePwdBoard.jsp?num=<%=board.getNum() %>'">
						<i class="bi bi-trash3"></i>삭제</button>
				<button type="button" class="btn btn-outline-success" style="width:80px"
						onclick="location.href='listBoard.jsp'">
						<i class="bi bi-list-ul"></i>목록</button>
			</td>
		</tr>
		</table>
	</div>
</body>
</html>