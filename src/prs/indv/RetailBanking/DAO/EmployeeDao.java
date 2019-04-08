package prs.indv.RetailBanking.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import prs.indv.RetailBanking.Util.DatabaseUtil;

public class EmployeeDao {
	Connection con = DatabaseUtil.getConnection();
	PreparedStatement ps = null;

	public Boolean getValidation(String email, String oldpass) {
		System.out.println("In DAO VAL" + email + oldpass);
		String query = "select * from user1 where email=? and password=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, oldpass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Boolean changePassword(String email, String newpass) {

		String query = "update user1 set password=? where email=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, newpass);
			ps.setString(2, email);
			int rs = ps.executeUpdate();
			if (rs > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public String fetchSecurityQuestion(String email) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String securityQuestion = null;

		try {
			cn = DatabaseUtil.getConnection();
			ps = cn.prepareStatement("select securityquestion from user1 where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				securityQuestion = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
		}
		return securityQuestion;
	}

	public boolean validateAnswer(String email, String answer) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String answerDB = null;

		try {
			cn = DatabaseUtil.getConnection();
			ps = cn.prepareStatement("select answer from user1 where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				answerDB = rs.getString(1);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
		}

		if (answer.equalsIgnoreCase(answerDB)) {
			return true;
		} else {
			return false;
		}

	}

	public boolean changeForgetPassword(String email, String newPassword) {
		Connection cn = null;
		PreparedStatement ps = null;
		int res = 0;

		try {
			cn = DatabaseUtil.getConnection();
			ps = cn.prepareStatement("update user1 set password=? where email=?");
			ps.setString(1, newPassword);
			ps.setString(2, email);
			res = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
		}

		if (res > 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean checkEmail(String email) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean flag=false;
		try {
			cn = DatabaseUtil.getConnection();
			ps = cn.prepareStatement("select * from user1 where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()){
				flag=true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
		}
		return flag;
	}
}