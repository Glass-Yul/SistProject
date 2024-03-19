<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxwrite.model.AjaxwriteDto"%>
<%@page import="ajaxwrite.model.AjaxwriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String story = request.getParameter("story");
	String img = request.getParameter("img");
	
	AjaxwriteDao dao = new AjaxwriteDao();
	AjaxwriteDto ajax = new AjaxwriteDto();
	ajax.setWriter(writer);
	ajax.setSubject(subject);
	ajax.setStory(story);
	ajax.setImg(img);
	
	dao.insert(ajax);
	
	/* JSONObject ob = new JSONObject();
	ob.put("writer", ajax.getWriter());
	ob.put("subject", ajax.getSubject());
	ob.put("story", ajax.getStory());
	ob.put("img", ajax.getImg()); */
	
%>
<%-- <%=ob.toString() %> --%>