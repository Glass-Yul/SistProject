<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("scode");
	String name = request.getParameter("sname");
	String price = request.getParameter("sprice");
	String color = request.getParameter("scolor");
	
	System.out.println("scode"+code);
	System.out.println("sname"+name);
	System.out.println("sprice"+price);
	System.out.println("scolor"+color);
	
	JSONObject ob = new JSONObject();
	ob.put("scode", code);
	ob.put("sname", name);
	ob.put("sprice", price);
	ob.put("scolor", color);
%>

<%=ob.toString() %>
