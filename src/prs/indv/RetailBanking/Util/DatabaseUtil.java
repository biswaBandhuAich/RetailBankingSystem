package prs.indv.RetailBanking.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseUtil {

	private static final String DRIVERNAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/banking";
	private static final String PASSWORD ="root";
	private static final String USERNAME ="root";

	// get a database connection
	public static Connection getConnection() {
		Connection con = null;
		try {
			//Registering Driver
			Class.forName(DRIVERNAME);  //throws ClassNotFoundException (Checked Exception)
			
			//Creating Connection
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD); //throws SQLException (Checked Exception)
		} catch (ClassNotFoundException ex) {

			System.out.println("connection not establisted" + ex);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println(e1);
		}
		return con;
	}

	// close database connection
	public static void closeConnection(Connection con) {

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}

	// close statements
	public static void closeStatement(Statement smt) {

		if (smt != null) {
			try {
				smt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}

	public static void closeResult(ResultSet rs)
	{
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}
	
	
}
