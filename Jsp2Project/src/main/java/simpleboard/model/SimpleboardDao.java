package simpleboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class SimpleboardDao {
	DbConnect db = new DbConnect();
	
	// insert
	public void insert(SimpleboardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into simpleboard value (null,?,?,?,?,0,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPwd());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("insert success");
			else System.out.println("insert error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// get select
	public SimpleboardDto getSelect(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard where num=?";
		SimpleboardDto board = new SimpleboardDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setNum(rs.getString("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPwd(rs.getString("pwd"));
				board.setReadcount(rs.getString("readcount"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return board;
	}
	
	// 조회수 증가 시키기
	public void updateCount(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update simpleboard set readcount=readcount+1 where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			int result = pstmt.executeUpdate();
			if(result>0)System.out.println("updateCount success");
			else System.out.println("updateCount error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	// all select => 페이징 처리 후 필요 없음
	public List<SimpleboardDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard order by num desc";
		List<SimpleboardDto> list = new ArrayList<SimpleboardDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SimpleboardDto board = new SimpleboardDto();
				board.setNum(rs.getString("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPwd(rs.getString("pwd"));
				board.setReadcount(rs.getString("readcount"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(board);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// 제일 최근 저장된 num 값 알아오기 => 저장 후 해당 데이터로 contentView로 이동 할 거임
	public int getMaxNum() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select max(num) as max from simpleboard";
		int max = 0; 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("max");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return max;
	}
	
	/* 
	 * 페이징 메소드 
	 * 1.전체 갯수 반환 
	 * 2.부분 조회(startNum ~ 페이지 갯수 만큼 반환) 
	 */
	// 1. 전체 갯수 반환
	public int getTotalCount() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) total from simpleboard";
		int total = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt("total");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return total;
	}
	// 2.부분 조회(startNum ~ 페이지 갯수 만큼 반환) 
	public List<SimpleboardDto> getPagingList(int startPage, int perPage) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard order by num desc limit ?,?";
		List<SimpleboardDto> list = new ArrayList<SimpleboardDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, perPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SimpleboardDto board = new SimpleboardDto();
				board.setNum(rs.getString("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPwd(rs.getString("pwd"));
				board.setReadcount(rs.getString("readcount"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(board);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	// pwd 확인
	public boolean pwdCheck(String num, String pwd) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard where num=? and pwd=?";
		boolean check = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check=true;
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return check;
	}
	
	// update
	public void update(SimpleboardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update simpleboard set writer=?,subject=?,content=?,pwd=?,writeday=now() where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPwd());
			pstmt.setString(5, board.getNum());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("update success");
			else System.out.println("update error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	// delete
	public void delete(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from simpleboard where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("delete success");
			else System.out.println("delete error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
