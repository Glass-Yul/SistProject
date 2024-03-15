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

	dao.delete(id);
	
%>