package ajaxboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class AjaxBoardDao {
	DbConnect db = new DbConnect();
	
	// insert
	public void insert (AjaxBoardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into ajaxboard value (null,?,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getAvata());
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("insert 성공");
			else System.out.println("insert 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// all select
	public List<AjaxBoardDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from ajaxboard order by id";
		List<AjaxBoardDto> list = new ArrayList<AjaxBoardDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				AjaxBoardDto board = new AjaxBoardDto();
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setAvata(rs.getString("avata"));
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
	
	// select
	public AjaxBoardDto getBoard(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from ajaxboard where id=?";
		AjaxBoardDto board = new AjaxBoardDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);;
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setId(rs.getString("id"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setAvata(rs.getString("avata"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return board;
	}
	
	// update
	public void update (AjaxBoardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update ajaxboard set writer=?,subject=?,content=?,avata=?,writeday=now() where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getAvata());
			pstmt.setString(5, board.getId());
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("update 성공");
			else System.out.println("update 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// delete
	public void delete(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from ajaxboard where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);;
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("delete 성공");
			else System.out.println("delete 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
