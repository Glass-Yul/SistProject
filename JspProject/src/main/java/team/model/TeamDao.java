package team.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class TeamDao {

	DbConnect db = new DbConnect();

	// insert
	public void insertTeam(TeamDto team) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into team value (null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, team.getName());
			pstmt.setString(2, team.getDriver());
			pstmt.setString(3, team.getAddr());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("team insert 성공");
			else
				System.out.println("team insert 실패");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// All select
	public List<TeamDto> getAllTeam() {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from team";
		List<TeamDto> list = new ArrayList<TeamDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDto team = new TeamDto();
				team.setNum(rs.getString("num"));
				team.setName(rs.getString("name"));
				team.setDriver(rs.getString("driver"));
				team.setAddr(rs.getString("addr"));
				team.setWriteday(rs.getTimestamp("writeday"));

				list.add(team);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// delete
	public void delete(String num) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from team where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("team delete 성공");
			else
				System.out.println("team delete 실패");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// update
	public TeamDto update(String num, TeamDto team) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update team set name=?,driver=?,addr=?,writeday=now() where num=?";
		TeamDto updateTeam = new TeamDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, team.getName());
			pstmt.setString(2, team.getDriver());
			pstmt.setString(3, team.getAddr());
			pstmt.setString(4, num);
			
			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("team delete 성공");
			else
				System.out.println("team delete 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return updateTeam;
	}
	
	// select
	public TeamDto selectTeam(String num) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from team where num=?";
		TeamDto team = new TeamDto();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				team.setNum(rs.getString("num"));
				team.setName(rs.getString("name"));
				team.setDriver(rs.getString("driver"));
				team.setAddr(rs.getString("addr"));
				team.setWriteday(rs.getTimestamp("writeday"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return team;
	}

}
