<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDto"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	System.out.println("id "+id);
	
	SimpleBoardAnswerDao dao = new SimpleBoardAnswerDao();
	SimpleBoardAnswerDto answer = dao.getSelect(id);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	System.out.println("id "+answer.getId());
	System.out.println("num "+answer.getNum());
	System.out.println("nickname "+answer.getNickname());
	System.out.println("content "+answer.getContent());
	System.out.println("writeday "+sdf.format(answer.getWriteday()));
	
	JSONObject ob = new JSONObject();
	ob.put("id", answer.getId());
	ob.put("num", answer.getNum());
	ob.put("nickname", answer.getNickname());
	ob.put("content", answer.getContent());
	ob.put("writeday", sdf.format(answer.getWriteday()));

%>
<%=ob.toString() %>