<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard_t.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id읽기
	String id=request.getParameter("id");
    //dao
    AjaxBoardDao dao=new AjaxBoardDao();
    //id에 해당 dto얻기
    AjaxBoardDto dto=dao.getData(id);
    
    //dto를 json으로 변환
    JSONObject ob=new JSONObject();
    //날짜타입 문자열 지정
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    
    //json에 데이타 추가
    ob.put("id", dto.getId());
    ob.put("writer", dto.getWriter());
    ob.put("subject", dto.getSubject());
    ob.put("content", dto.getContent());
    ob.put("avata", dto.getAvata());
    ob.put("writeday", sdf.format(dto.getWriteday()));
%>

<%=ob.toString()%>