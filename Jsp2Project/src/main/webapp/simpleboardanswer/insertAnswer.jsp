<%@page import="org.json.simple.JSONObject"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDto"%>
<%@page import="simpleboardanswer.mode.SimpleBoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String nickname = request.getParameter("nickname");
	String content = request.getParameter("content");
	
	System.out.println("num "+num);
	System.out.println("nickname "+nickname);
	System.out.println("content "+content);
	
	SimpleBoardAnswerDao dao = new SimpleBoardAnswerDao();
	SimpleBoardAnswerDto answer = new SimpleBoardAnswerDto();
	
	answer.setNickname(nickname);
	answer.setNum(num);
	answer.setContent(content);

	dao.insert(answer);
	
%>