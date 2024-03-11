<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="ajaxboard.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//== json db와 연동?? ajax로==//

	// db 데이터 받기 위해
	AjaxBoardDao dao = new AjaxBoardDao();

	// 쿼리스트링으로 넘어온 num 받아옴
	String id = request.getParameter("id");	
	
	// 수정할 객체 가져옴
	AjaxBoardDto board = dao.getBoard(id);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	// json 파싱을 위한 객체
	JSONObject json = new JSONObject();
	json.put("id", board.getId());
	json.put("writer", board.getWriter());
	json.put("subject", board.getSubject());
	json.put("content", board.getContent());
	json.put("avata", board.getAvata());
	json.put("writeday", sdf.format(board.getWriteday()));
	
%>    
<%=json.toString() %>