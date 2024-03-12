<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard_t.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id읽기
	String id=request.getParameter("uid");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String content=request.getParameter("ucontent");
	String avata=request.getParameter("uavata");
	
    //dao
    AjaxBoardDao dao=new AjaxBoardDao();
    
    //dto
    AjaxBoardDto dto=new AjaxBoardDto();
    dto.setId(id);
    dto.setWriter(writer);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setAvata(avata);
    
    dao.update(dto);
    
    
%>