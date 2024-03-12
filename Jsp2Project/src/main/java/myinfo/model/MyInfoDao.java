package myinfo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class MyInfoDao {
	
	DbConnect db = new DbConnect();
	
	//insert
	public void insert(MyInfoDto my) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into myinfo value (null,?,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, my.getName());
			pstmt.setString(2, my.getHp());
			pstmt.setString(3, my.getBirth());
			pstmt.setString(4, my.getBlood());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("insert 성공");
			else System.out.println("insert 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//update
	public void update(MyInfoDto my) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update myinfo set name=?,hp=?,birth=?,blood=?,writeday=now() where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, my.getName());
			pstmt.setString(2, my.getHp());
			pstmt.setString(3, my.getBirth());
			pstmt.setString(4, my.getBlood());
			pstmt.setString(5, my.getNum());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("update 성공");
			else System.out.println("update 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//delete
	public void delete(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from myinfo where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("delete 성공");
			else System.out.println("delete 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//all select
	public List<MyInfoDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myinfo";
		List<MyInfoDto> list = new ArrayList<MyInfoDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyInfoDto my = new MyInfoDto();
				my.setNum(rs.getString("num"));
				my.setName(rs.getString("name"));
				my.setHp(rs.getString("hp"));
				my.setBirth(rs.getString("birth"));
				my.setBlood(rs.getString("blood"));
				my.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(my);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		return list;
	}
	//get select
	public MyInfoDto getSelect(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myinfo where num=?";
		MyInfoDto my = new MyInfoDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				my.setName(rs.getString("name"));
				my.setHp(rs.getString("hp"));
				my.setBirth(rs.getString("birth"));
				my.setBlood(rs.getString("blood"));
				my.setWriteday(rs.getTimestamp("writeday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		return my;
	}

}
