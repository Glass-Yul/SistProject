
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	DbConnect db = new DbConnect();
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from info order by num";
	
	String s="["; // 끝나고 닫기를 추가 해줄거임
	
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String num = rs.getString("num");
			String name = rs.getString("name");
			String hp = rs.getString("hp");
			String age = rs.getString("age");
			String photo = rs.getString("photo");
			
			// json 파싱 : "num":num
			s+="{";
			s+="\"num\":"+num+", \"name\":"+"\""+name+"\""+", \"hp\":"+"\""+hp+"\"";
			s+=", \"age\":"+age+", \"photo\":"+"\""+photo+"\"";
			s+="},";
		}
		// 마지막 콤마 제거
		s = s.substring(0, s.length()-1);
		
		
	} catch(SQLException e){
		e.printStackTrace();	
	} finally {
		db.dbClose(rs, pstmt, conn);
	}
	s+="]";
			
%>

	<%=s %>
