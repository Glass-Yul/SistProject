<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDto"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	
	SimpleBoardAnswerDao dao = new SimpleBoardAnswerDao();
	List<SimpleBoardAnswerDto> list = new ArrayList();
	
	JSONArray jsons = new JSONArray();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	list = dao.allSelect(num);
	
	for(SimpleBoardAnswerDto answer : list){
		JSONObject ob = new JSONObject();
		ob.put("id", answer.getId());
		ob.put("num", answer.getNum());
		ob.put("nickname", answer.getNickname());
		ob.put("content", answer.getContent());
		ob.put("writeday", answer.getWriteday());
		
		jsons.add(ob);
	}
	
%>
<%=jsons.toString() %>