<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	AjaxBoardDao dao = new AjaxBoardDao();
	List<AjaxBoardDto> boards = dao.allSelect();
	
	JSONArray jsons = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(AjaxBoardDto board : boards){
		JSONObject ob = new JSONObject();
		ob.put("id", board.getId());
		ob.put("writer", board.getWriter());
		ob.put("subject", board.getSubject());
		ob.put("avata", board.getAvata());
		ob.put("content", board.getContent());
		ob.put("writeday", sdf.format(board.getWriteday()));
		
		jsons.add(ob);
	}

%>
<%=jsons.toString() %>

