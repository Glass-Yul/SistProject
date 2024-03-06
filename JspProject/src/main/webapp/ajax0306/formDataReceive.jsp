<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// front에서 보낸 데이터 받아 읽기
	String img = request.getParameter("foodimg");
	String name = request.getParameter("foodname");
	String likeScore1 = request.getParameter("likeScore1");
	String likeScore2 = request.getParameter("likeScore2");
	String likeScore3 = request.getParameter("likeScore3");
	
	// 총점
	int total = Integer.parseInt(likeScore1)
				+ Integer.parseInt(likeScore2)
				+ Integer.parseInt(likeScore3);
	// 평균
	double avg = total/3.0;
	
	// front에서 받을 수 있는 데이터 형식으로 변환
	JSONObject ob = new JSONObject();
	ob.put("foodimg", img);
	ob.put("foodname", name);
	ob.put("total", total);
	ob.put("avg", avg);
%>
<%=ob.toString() %>