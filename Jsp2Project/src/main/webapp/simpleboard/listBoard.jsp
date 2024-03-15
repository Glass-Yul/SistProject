<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleboardDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboard.model.SimpleboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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
	a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소로부터 상속받은 글씨색을 유지 */
}
	
</style>
<title>목록</title>
</head>

<%
	/* 
	SimpleboardDao dao = new SimpleboardDao();
	//List<SimpleboardDto> list = dao.allSelect();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//int cnt = list.size(); => total 로 따로 구함
	
			///////////////////////////////////////////////////
	// 전체 게시글 수
	int total = dao.getTotalCount();
	
	int perPage = 3; // 한 페이지에 보일 게시글 갯수
	int perBlock = 5; // 밑에 몇 개의 숫자를 나열할 것인가를 정하는 갯수
	
	int startNum; // db에서 가져올 글의 시작 번호 => mySQL은 0부터 오라클은 1부터
	int startPage; // 각 페이당 보여질 첫 게시글 번호
	int endPage; // 각 페이당 보여질 마지막 게시글 번호
	int currentPage; // 현재 페이지
	int totalPage; // 총 페이지
			///////////////////////////////////////////////////
	
	// 각 페이지 당 해당 게시글 인덱스 가져옴
	int no; // 해당 페이지에 시작하는 인덱스
	
	// 현재 페이지를 읽는데 단, null일 경우는 1페이지로 줌
	if(request.getParameter("currentPage")==null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // 계산 땜시 형변환
		
	// 총 페이지
	// 총 게시글 갯수 / 한 페이지 당 보여질 갯수로 나눔
	// 나머지는 1이라도 있으면 무조건 1페이지 추가
	totalPage = total / perPage + (total % perPage == 0 ? 0:1);
		
	// 각 페이지 당 보여질 시작 페이지
	// perBlock = 5일 경우 현재 페이지가 1~5일 경우 첫페이지가 1, 끝페이지가 5
	// ex) 현재가 13이면 시작 = 11, 끝 = 15
	startPage = (currentPage - 1) / perBlock*perBlock+1;
	endPage = startPage + perBlock - 1;
	
	// 총 게시글이 23일 경우 마지막 페이지는 끝페이지 25가 아니라 23으로 끝남
	if(endPage > totalPage)
		endPage = totalPage;
	
	// 각 페이지에서 보여질 시작 인덱스
	// 1페이지:0, 2페이지:5, 3페이지:10......
	startPage = (currentPage - 1) * perPage;
	
	// 각 페이지 당 출력할 시작 번호
	// 총 게시글 갯수가 23일 때, 1페이지:23 2페이지:18 3페이지:13
	no = total - (currentPage - 1) * perPage;
	
	// 페이지에서 보여질 게시글만 가져오기
	List<SimpleboardDto> list = dao.getPagengList(startPage, perPage);
	 */
	 
	 SimpleboardDao dao=new SimpleboardDao();

	//전체갯수
	int totalCount=dao.getTotalCount();
	int perPage=3; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
	int startPage; //각블럭당 보여질 시작페이지
	int endPage; //각블럭당 보여질 끝페이지
	int currentPage;  //현재페이지
	int totalPage; //총페이지수
	int no; //각페이지당 출력할 시작번호

	//현재페이지 읽는데 단 null일경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));

	//총페이지수 구한다
	//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

	//각블럭당 보여질 시작페이지
	//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
	//현재가 13일경우 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;

	//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage)
		endPage=totalPage;

	//각페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5 3페이지: 10.....
	startNum=(currentPage-1)*perPage;

	//각페이지당 출력할 시작번호 구하기
	//총글개수가 23  , 1페이지:23 2페이지:18  3페이지:13
	no=totalCount-(currentPage-1)*perPage;

	//페이지에서 보여질 글만 가져오기
	List<SimpleboardDto>list=dao.getPagingList(startNum, perPage);

	//List<SimpleBoardDto>list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//int count=list.size();
	
%>	
<body>
	<div style="width:800px">
		<button type="button" class="btn btn-outline-info" style="width:80px;margin-left: 700px"
				onclick="location.href='addBoard.jsp'">
		<i class="bi bi-pencil"></i>글쓰기
		</button><br>
		<h5><b>총 <%=totalCount %>개의 게시글이 있습니다.</b></h5><br>
		<table class="table table-bordered">
			<caption align="top"><b>간단 목록 게시판</b></caption>
			<tr>
				<th class="form-info">번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%
			if(totalCount==0)
			{%>
				<tr>
					<td colspan="5" align="center">
					<h5><b>등록된 게시글이 없습니다.</b></h5>
				</tr>
			<%} else {
				for(int i=0;i<list.size();i++)
				{
					SimpleboardDto board = list.get(i); 
					%>
					<tr>
						<td align="center"><%=no-- %></td>
						<td>
							<a href="contentView.jsp?num=<%=board.getNum() %>">
								<%=board.getSubject() %>
							</a>
						</td>
						<td><%=board.getWriter() %></td>
						<td><%=sdf.format(board.getWriteday()) %></td>
						<td><%=board.getReadcount()%></td>
					</tr>
				<%}
			}
			%>
		</table>
		
		<!-- 페이지 번호 출력 -->
  <ul class="pagination justify-content-center">
  <%
  //이전
  if(startPage>1)
  {%>
	  <li class="page-item ">
	   <a class="page-link" href="listBoard.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
	  </li>
  <%}
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    		<li class="page-item active">
    		<a class="page-link" href="listBoard.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}else
    	{%>
    		<li class="page-item">
    		<a class="page-link" href="listBoard.jsp?currentPage=<%=pp%>"><%=pp %></a>
    		</li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
    	<li class="page-item">
    		<a  class="page-link" href="listBoard.jsp?currentPage=<%=endPage+1%>"
    		style="color: black;">다음</a>
    	</li>
    <%}
  %>
  
  </ul>


	</div>
</body>
</html>