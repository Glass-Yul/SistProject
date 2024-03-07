package myworld.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class MyWorldDao {
	
	DbConnect db = new DbConnect();
	
	public void insert(MyWorldDto my) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into myworld value (null,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, my.getWriter());
			pstmt.setString(2, my.getContent());
			pstmt.setString(3, my.getAvata());
			
			int result = pstmt.executeUpdate();
			
			if(result>0) System.out.println("insert 완료");
			else System.out.println("insert 실패");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void delete(String num) {
		String sql = "delete from myworld where num=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			int result = pstmt.executeUpdate();
			
			if(result>0)System.out.println("delete 완료");
			else System.out.println("delete 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	
	}
	
	public List<MyWorldDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myworld order by num";
		List<MyWorldDto> list = new ArrayList<MyWorldDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyWorldDto my = new MyWorldDto();
				my.setNum(rs.getString("num"));
				my.setWriter(rs.getString("writer"));
				my.setContent(rs.getString("content"));
				my.setAvata(rs.getString("avata"));
				my.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(my);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//수정버튼 누르면 하나의 데이터 조회
	public MyWorldDto getMy(String num)
	{
		MyWorldDto my=new MyWorldDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myworld where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			// 수정하려는 조회
			if(rs.next()) {
				my.setNum(rs.getString("num"));
				my.setWriter(rs.getString("writer"));
				my.setContent(rs.getString("content"));
				my.setAvata(rs.getString("avata"));
				my.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return my;
	}
	
	//수정..이름,주소수정 가능하게 
	public void update(MyWorldDto my)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update myworld set writer=?,content=?,avata=?,writeday=now() where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, my.getWriter());
			pstmt.setString(2, my.getContent());
			pstmt.setString(3, my.getAvata());
			pstmt.setString(4, my.getNum());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("update 성공");
			else System.out.println("update 실패");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}

}
