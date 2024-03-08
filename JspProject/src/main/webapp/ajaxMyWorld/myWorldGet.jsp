<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="myworld.model.MyWorldDto"%>
<%@page import="myworld.model.MyWorldDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//== json db와 연동?? ajax로==//

	// db 데이터 받기 위해
	MyWorldDao dao = new MyWorldDao();

	// 쿼리스트링으로 넘어온 num 받아옴
	String num = request.getParameter("num");	
	
	// 수정할 객체 가져옴
	MyWorldDto my = dao.getMy(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	// json 파싱을 위한 객체
	JSONObject json = new JSONObject();
	json.put("num", my.getNum());
	json.put("writer", my.getWriter());
	json.put("content", my.getContent());
	json.put("avata", my.getAvata());
	json.put("writeday", sdf.format(my.getWriteday()));
	
%>    
<%=json.toString() %>