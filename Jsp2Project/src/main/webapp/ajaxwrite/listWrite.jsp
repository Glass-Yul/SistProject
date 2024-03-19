<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="ajaxwrite.model.AjaxwriteDto"%>
<%@page import="ajaxwrite.model.AjaxwriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");

	AjaxwriteDao dao = new AjaxwriteDao();
	List<AjaxwriteDto> list = dao.getAjaxList();
	
	JSONArray jsons = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(AjaxwriteDto ajax : list){
		JSONObject ob = new JSONObject();
		ob.put("num", ajax.getNum());
		ob.put("writer", ajax.getWriter());
		ob.put("subject", ajax.getSubject());
		ob.put("story", ajax.getStory());
		ob.put("img", ajax.getImg());
		ob.put("likes", ajax.getLikes());
		ob.put("writeday", sdf.format(ajax.getWriteday()));
			
		jsons.add(ob);
	}
%>
<%=jsons.toString() %>