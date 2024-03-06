package introduction.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class IntroductionDao {

	DbConnect db = new DbConnect();

	// insert
	public void insertIntroduction(IntroductionDto introduction) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into introduction value (null,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, introduction.getName());
			pstmt.setString(2, introduction.getAge());
			pstmt.setString(3, introduction.getBirthday());
			pstmt.setString(4, introduction.getHometown());
			pstmt.setString(5, introduction.getHobby());
			pstmt.setString(6, introduction.getMemo());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("introduction insert 성공");
			else
				System.out.println("introduction insert 실패");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// All select
	public List<IntroductionDto> getAllIntroduction() {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from introduction";
		List<IntroductionDto> list = new ArrayList<IntroductionDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				IntroductionDto introduction = new IntroductionDto();
				introduction.setNum(rs.getString("num"));
				introduction.setName(rs.getString("name"));
				introduction.setAge(rs.getString("age"));
				introduction.setBirthday(rs.getString("birthday"));
				introduction.setHometown(rs.getString("hometown"));
				introduction.setHobby(rs.getString("hobby"));
				introduction.setMemo(rs.getString("memo"));

				list.add(introduction);
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

		String sql = "delete from introduction where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("introduction delete 성공");
			else
				System.out.println("introduction delete 실패");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// update
	public IntroductionDto update(String num, IntroductionDto introduction) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update introduction set "
					+ "name=?,age=?,birthday=?,hometown=?,hobby=?,memo=? where num=?";
		IntroductionDto updateIntroduction = new IntroductionDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, introduction.getName());
			pstmt.setString(2, introduction.getAge());
			pstmt.setString(3, introduction.getBirthday());
			pstmt.setString(4, introduction.getHometown());
			pstmt.setString(5, introduction.getHobby());
			pstmt.setString(6, introduction.getMemo());
			pstmt.setString(7, num);
			
			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("introduction update 성공");
			else
				System.out.println("introduction update 실패");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return updateIntroduction;
	}
	
	// select
	public IntroductionDto selectIntroduction(String num) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from introduction where num=?";
		IntroductionDto introduction = new IntroductionDto();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				introduction.setNum(rs.getString("num"));
				introduction.setName(rs.getString("name"));
				introduction.setAge(rs.getString("age"));
				introduction.setBirthday(rs.getString("birthday"));
				introduction.setHometown(rs.getString("hometown"));
				introduction.setHobby(rs.getString("hobby"));
				introduction.setMemo(rs.getString("memo"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return introduction;
	}

}
