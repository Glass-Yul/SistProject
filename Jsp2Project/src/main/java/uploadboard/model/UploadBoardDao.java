package uploadboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import log.model.LogDto;
import mysql.db.DbConnect;

public class UploadBoardDao {

	DbConnect db = new DbConnect();
	
	// insert
	public void insert(UploadBoardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into uploadboard value (null,?,?,?,?,?,0,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getImgname());
			pstmt.setString(5, board.getPass());
			
			int result = pstmt.executeUpdate();
			if(result>0)System.out.println("insert success");
			else System.out.println("insert error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// get select
	public UploadBoardDto getSelect(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from uploadboard where num=?";
		UploadBoardDto board = new UploadBoardDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board.setNum(rs.getString("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setImgname(rs.getString("imgname"));
				board.setReadcount(rs.getString("readcount"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return board;
	}
	
	// all select
	public List<UploadBoardDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from uploadboard";
		List<UploadBoardDto> list = new ArrayList<UploadBoardDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UploadBoardDto board = new UploadBoardDto();
				board.setNum(rs.getString("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setImgname(rs.getString("imgname"));
				board.setReadcount(rs.getString("readcount"));
				board.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(board);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return list;
	}
	
	// 조회수 증가 시키기
	public void updateCount(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update uploadboard set readcount=readcount+1 where num=?";
		
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
	
	// update
	public void update(UploadBoardDto board) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update uploadboard set writer=?,subject=?,content=?,imgname=?,pass=?,writeday=now() where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getImgname());
			pstmt.setString(5, board.getPass());
			pstmt.setString(6, board.getNum());
			
			int result = pstmt.executeUpdate();
			if(result>0)System.out.println("update success");
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
		
		String sql = "delete from uploadboard where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			int result = pstmt.executeUpdate();
			if(result>0)System.out.println("delete success");
			else System.out.println("delete error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
