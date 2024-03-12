package quizshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class QuizShopDao {

	DbConnect db = new DbConnect();
	
	// insert
	public void insert(QuizShopDto shop) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into quizshop value (null,?,?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shop.getName());
			pstmt.setString(2, shop.getImg());
			pstmt.setString(3, shop.getPrice());
			pstmt.setString(4, shop.getStartday());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("insert 성공");
			else System.out.println("insert 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// all select
	public List<QuizShopDto> allSelect() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from quizshop";
		List<QuizShopDto> list = new ArrayList<QuizShopDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QuizShopDto shop = new QuizShopDto();
				shop.setId(rs.getString("id"));
				shop.setName(rs.getString("s_name"));
				shop.setImg(rs.getString("s_img"));
				shop.setPrice(rs.getString("s_price"));
				shop.setStartday(rs.getString("s_startday"));
				shop.setFinishday(rs.getTimestamp("s_finishday"));
				
				list.add(shop);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	// get select
	public QuizShopDto getSelect(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from quizshop where id=?";
		QuizShopDto shop = new QuizShopDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				shop.setId(rs.getString("id"));
				shop.setName(rs.getString("s_name"));
				shop.setImg(rs.getString("s_img"));
				shop.setPrice(rs.getString("s_price"));
				shop.setStartday(rs.getString("s_startday"));
				shop.setFinishday(rs.getTimestamp("s_finishday"));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return shop;
	}
	
	// update
	public void update(QuizShopDto shop) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update quizshop set s_name=?,s_price=?,s_img=?,s_finishday=now() where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shop.getName());
			pstmt.setString(2, shop.getPrice());
			pstmt.setString(3, shop.getImg());
			pstmt.setString(4, shop.getId());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("update 성공");
			else System.out.println("update 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// delete
	public void delete(String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from quizshop where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("delete 성공");
			else System.out.println("delete 실패");
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
