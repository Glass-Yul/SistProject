package info.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oracle.db.DbConnect;

public class InfoDao {
	DbConnect db = new DbConnect();
	
	public void insert(InfoDto dto) {
		String sql = "insert into info values(id_seq.nextval,?,?,sysdate)";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
			int result = pstmt.executeUpdate();
			
			if(result>0)System.out.println("insert 완료");
			else System.out.println("insert 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	
		
	}
	public List<InfoDto> select() {
		List<InfoDto> list = new ArrayList();
		String sql = "select * from info order by id";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InfoDto dto = new InfoDto();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTodate(rs.getTimestamp("todate"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public InfoDto getDto (String id) {
		InfoDto dto = new InfoDto();
		String sql = "select * from info where id=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTodate(rs.getTimestamp("todate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return dto;
	}
	public void update (String id, String name, String addr) {		
		String sql = "update info set name=?, addr=?, todate=sysdate where id=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setString(3, id);
			
			int result = pstmt.executeUpdate();
			
			if(result>0) System.out.println("update 성공");
			else System.out.println("update 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void delete(String id) {
		String sql = "delete from info where id=?";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int result = pstmt.executeUpdate();
			
			if(result>0)System.out.println("delete 완료");
			else System.out.println("delete 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	
		
	}
}
