<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard_t.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //post방식
  request.setCharacterEncoding("utf-8");
  
  // id 받아옴
  String id=request.getParameter("id");
  
  AjaxBoardDao dao = new AjaxBoardDao();
  
  // dto
  AjaxBoardDto board = dao.getData(id);
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
  JSONObject ob = new JSONObject();
  ob.put("id", board.getId());
  ob.put("writer", board.getWriter());
  ob.put("subject", board.getSubject());
  ob.put("content", board.getContent());
  ob.put("avata", board.getAvata());
  //ob.put("writeday", sdf.format(board.getWriteday()));

%>
<%=ob.toString() %>