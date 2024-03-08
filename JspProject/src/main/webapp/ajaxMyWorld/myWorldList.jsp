<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="myworld.model.MyWorldDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myworld.model.MyWorldDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//== json db와 연동?? ajax로==//
	
	// db 데이터 받기 위해
	MyWorldDao dao = new MyWorldDao();
	
	// 데이터 받아옴
	List<MyWorldDto> mys = dao.allSelect();
	
	// json 파싱을 위한 객체
	JSONArray arr = new JSONArray(); // 리스트를 받아야 하기 때문
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(MyWorldDto my : mys){
		JSONObject json = new JSONObject();
		json.put("num", my.getNum());
		json.put("writer", my.getWriter());
		json.put("content", my.getContent());
		json.put("avata", my.getAvata());
		json.put("writeday", sdf.format(my.getWriteday()));
		
		arr.add(json); // 리스트에 추가
	}
	
%>    
<%=arr.toString() %>
