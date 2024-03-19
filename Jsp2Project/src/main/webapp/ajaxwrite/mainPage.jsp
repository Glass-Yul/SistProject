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
  div.board{
    position: absolute;
   left: 7%;
   top: 10%;
   font-family: 'Noto Sans KR';
   font-size: 1.1em;
    
  }
  
  div.list{
     width: 1000px;
  }
  
  td.subject{
   cursor: pointer;
  }

</style>
<script type="text/javascript">
$(function(){
	
	$("div.addform").hide();
	$("div.updateform").hide();
	$("div.detailview").hide();
	list();
	
	
	
	//이미지 선택시
	$("#selimg").change(function(){
		var im=$(this).val();
		
		//이미지명을 현재값에 추가로 더하기
		$("#img").val(im);
		
		//아래 이미지뷰에 추가로 이미지가 보이게
		var s="<img src='"+im+"' width='50'>";
		$("#imgview").html(s);
	})
	
	//글쓰기 버튼 누르면 입력폼나오게
	$(document).on("click",".insert",function(){
		$("div.list").hide();
		$("div.addform").show();
	})
	
	
	// 추가 폼 안에 수정 버튼 클릭 시
	$("#btninsert").click(function(){
		var data = $("#addfrm").serialize();
		alert(data);
		
		$.ajax({
			type:"post",
			dataType:"html",
			data:data,
			url:"insertWrite.jsp",
			success:function(){
				alert("성공")
				$("#addfrm")[0].reset(); // 폼 리셋
            	$("#imgview").empty(); // 이미지 뷰 초기화
            	$("div.addform").hind();
				list();
			}
		});
		
		// 추가폼이 있으면 숨기고 수정폼을 나타낸다
		/* $("div.writeform").hide();
		$("div.updateform").hide(); */
	});

	// 계속 재호출 해줘야 하기 때문에 사용자 함수를 사용함
	function list(){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"listWrite.jsp",
			success:function(data){
				alert(data);
				var s="";
				s+="<button type='button' class='btn btn-info insert'>글쓰기</button><br><br>"
			   if(data.length==0){
				   s+="<button type='button' class='btn btn-info insert'>글쓰기</button>"
				   s+="<h4 class='alert alert-info'>저장된 방명록이 없음</h4>"
			   }
			   $.each(data, function(index, ele) { 
					s+="<table class='table table-bordered' id='addlist'>";
					s+="<tr>"
					s+="<td style='width:20px;'>"+ele.num+"</td>"
					s+="<td style='width:200px;'>작성자: "+ele.writer+"</td>"
					s+="<td style='width:50px;'><img src='"+ele.img+"' width='50'></td>"
					//s+="</tr>"
					//s+="<tr>"
					s+="<td num="+ele.num+" class='subject' style='width:200px;'>제목: "+ele.subject+"</td>"
					//s+="</tr>"
					//s+="<tr>"
					s+="<td >내용: "+ele.story+"</td>"
					//s+="</tr>"
					//s+="<tr>"
					//s+="</tr>"
					//s+="<tr>"
					s+="<td >작성날짜: "+ele.writeday+"</td>"
					//s+="</tr>"
					//s+="<tr>"
					s+="<td align='center' style='width:180px;'>";
					s+="<button type='button' class='btn btn-warning update' value='"+ele.id+"'>수정</button>&nbsp";
					s+="<button type='button' class='btn btn-danger del' value='"+ele.id+"'>삭제</button>";
					s+="</td>"
					s+="</tr>"
					s+="</table><br>"
					});

				$("div.list").html(s);
				
				//$("list").show();
			}
		});
	
	}
	
	
})

</script>
<title>main page</title>
</head>
<body>
  <!-- 추가폼 -->
  <div class="board addform" style=" width: 400px;">
     <form id="addfrm">
       <table class="table table-bordered">
         <caption align="top"><b>글쓰기</b></caption>
         <tr>
           <th width="100" class="table-warning">작성자</th>
           <td>
             <input type="text" name="writer" id="writer"
             class="form-control" required="required" style="width: 130px;">
           </td>
         </tr>
         
         <tr>
           <th width="100" class="table-warning">제목</th>
           <td>
             <input type="text" name="subject" id="subject"
             class="form-control" required="required" style="width: 250px;">
           </td>
         </tr>
         
         <tr>
           <th width="100" class="table-warning">내용</th>
           <td>
             <textarea style="width: 300px; height: 100px;"
             name="story" id="story" required="required"
             class="form-control"></textarea>
           </td>
         </tr>
         
         <tr>
           <th width="100" class="table-warning">이미지</th>
           <td>
             <input type="hidden" name="img" id="img" width="100%">
             <select id="selimg" style="width: 100px;" class="form-control">
                <option value="../img/12.png" selected="selected">야쿠르</option>
                <option value="../img/13.png">하울</option>
                <option value="../img/14.png">하쿠</option>
                <option value="../img/15.png">가오나시</option>
                <option value="../img/16.png">토토로</option>
             </select><br>
             <div id="imgview">
             <img src="../img/12.png" width="50"> <!-- 이미지 기본값 -->
             </div>
           </td>
         </tr>
         <tr>
           <td colspan="2" align="center">
             <button type="button" class="btn btn-success" id="btninsert">추가</button>
           </td>
         </tr>
       </table>
     </form>
  </div>
  <div class="board updateform"></div>
  <div class="board list"></div>
  <div class="board detailview"></div>
  
</body>
</html>