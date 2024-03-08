<%@page import="myworld.model.MyWorldDto"%>
<%@page import="myworld.model.MyWorldDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyWorldDao dao = new MyWorldDao();	
	
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	
	dao.delete(num);
	
	//response.sendRedirect("myWorld.html"); => 이거는 ajax가 아님
	
%>