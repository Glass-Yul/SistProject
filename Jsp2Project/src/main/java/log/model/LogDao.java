package log.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mysql.db.DbConnect;

public class LogDao {
	DbConnect db = new DbConnect();
	
	//아이디를 통해 name 값 얻어오기
	public String getName(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select name from log where id=?";
		String name = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) name = rs.getString("name");
			else System.out.println("해당 id에 대한 name이 존재하지 않음");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
	
	// pwd 확인
	public boolean loginCheck(String id, String pwd) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean flag = false;
		
		String sql="select name from log where id=? and pwd=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) flag = true;
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
}
