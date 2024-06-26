package simpleboardanswer.mode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class SimpleBoardAnswerDao {
	DbConnect db = new DbConnect();
	
	// insert
	public void insert(SimpleBoardAnswerDto answers) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into simpleboardanswer value (null,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answers.getNum());
			pstmt.setString(2, answers.getNickname());
			pstmt.setString(3, answers.getContent());
			
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
	public SimpleBoardAnswerDto getSelect(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboardanswer where id=?";
		SimpleBoardAnswerDto answer = new SimpleBoardAnswerDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				answer.setId(rs.getString("id"));
				answer.setNum(rs.getString("num"));
				answer.setNickname(rs.getString("nickname"));
				answer.setContent(rs.getString("content"));
				answer.setWriteday(rs.getTimestamp("writeday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return answer;
	}
	
	
	// all select 
	public List<SimpleBoardAnswerDto> allSelect(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboardanswer where num=? order by num desc";
		List<SimpleBoardAnswerDto> list = new ArrayList<SimpleBoardAnswerDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SimpleBoardAnswerDto answer = new SimpleBoardAnswerDto();
				answer.setId(rs.getString("id"));
				answer.setNum(rs.getString("num"));
				answer.setNickname(rs.getString("nickname"));
				answer.setContent(rs.getString("content"));
				answer.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(answer);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	// update
	public void update(SimpleBoardAnswerDto answer) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update simpleboardanswer set nickname=?,content=?,writeday=now() where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer.getNickname());
			pstmt.setString(2, answer.getContent());
			pstmt.setString(3, answer.getId());
			
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
	public void delete(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from simpleboardanswer where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("answer delete success");
			else System.out.println("answer delete error");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
