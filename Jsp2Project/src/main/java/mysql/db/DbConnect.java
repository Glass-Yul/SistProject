package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	static final String MYSQLDRIVER = "com.mysql.cj.jdbc.Driver";
	static final String MYSQLURL = "jdbc:mysql://localhost:3306/coffee";
	
	public DbConnect() {
		try {
			Class.forName(MYSQLDRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("MYSQL 드라이버 실패 " + e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(MYSQLURL, "root", "1234");
			System.out.println("MYSQL 계정 연결 성공");
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MYSQL 드라이버 실패 " + e.getMessage());
		}
		return conn;
	}
	
	public void dbClose(ResultSet rs, PreparedStatement ps, Connection conn) {
		if (rs != null) try { rs.close(); } catch(Exception e) {}
        if (ps != null) try { ps.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
	}
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) try { rs.close(); } catch(Exception e) {}
		if (stmt != null) try { stmt.close(); } catch(Exception e) {}
		if (conn != null) try { conn.close(); } catch(Exception e) {}
	}
	public void dbClose(Statement stmt, Connection conn) {
		if (stmt != null) try { stmt.close(); } catch(Exception e) {}
		if (conn != null) try { conn.close(); } catch(Exception e) {}
	}
	public void dbClose(PreparedStatement ps, Connection conn) {
		if (ps != null) try { ps.close(); } catch(Exception e) {}
		if (conn != null) try { conn.close(); } catch(Exception e) {}
	}
}
