package prs.indv.RetailBanking.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import prs.indv.RetailBanking.Util.DatabaseUtil;
import prs.indv.RetailBanking.bean.AccountStatus;
import prs.indv.RetailBanking.bean.Customer;
import prs.indv.RetailBanking.bean.CustomerStatus;

public class RetailBankingDao2 {
	long millis=System.currentTimeMillis();  
	Date date=new Date(millis);
	
	Connection con = null;
	PreparedStatement pr = null;
	ResultSet rst = null;

	public void addCustomerStatus(CustomerStatus cstatus)
	{
		
		
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("insert into CustomerStatus_TeamC values(?,?,?,?,?)");
			pr.setString(1, cstatus.getSsnID());
			pr.setString(2, cstatus.getCustomerId());
			pr.setString(3, cstatus.getStatus());
			pr.setString(4, cstatus.getMessage());
			pr.setDate(5, date);
			int i=pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(pr);
			DatabaseUtil.closeConnection(con);
		}
		
	}
	public void addAccountStatus(AccountStatus accstatus)
	{
			
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("insert into AccountStatus_TeamC values(?,?,?,?,?,?)");
			pr.setString(1, accstatus.getCustomerId());
			pr.setString(2, accstatus.getAccountId());
			pr.setString(3, accstatus.getAcctype());
			pr.setString(4, accstatus.getStatus());
			pr.setString(5, accstatus.getMessage());
			pr.setDate(6, date);
			int i=pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(pr);
			DatabaseUtil.closeConnection(con);
		}
		
	}
	public void addcustStatusonUpdate(CustomerStatus cstatus)
	{
		
		
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("update CustomerStatus_TeamC set status=?,message=?,lastupdated=? where customerid=?");
			pr.setString(1, cstatus.getStatus());
			pr.setString(2, cstatus.getMessage());
			pr.setDate(3, date);
			pr.setString(4, cstatus.getCustomerId());
			int i=pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public void addacctStatusonUpdate(AccountStatus accstatus)
	{
		
		
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("update AccountStatus_TeamC set status=?,message=?,lastupdated=? where accountid=?");
			pr.setString(1, accstatus.getStatus());
			pr.setString(2, accstatus.getMessage());
			pr.setDate(3, date);
			pr.setString(4, accstatus.getAccountId());
			int i=pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public boolean searchAccountStatus(String customerId)
	{
		
		con=DatabaseUtil.getConnection();
		ResultSet rs=null;
		try {
			pr=con.prepareStatement("select status from AccountStatus_TeamC where customerid=?");
			pr.setString(1, customerId);
			rs=pr.executeQuery();
			while(rs.next())
			{
				String str=rs.getString(1);
				if(str.equalsIgnoreCase("active")){
				return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<AccountStatus> getallAccountStatus()
	{
	
		ResultSet rs=null;
		
		ArrayList<AccountStatus> account=new ArrayList<AccountStatus>();
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("select * from AccountStatus_TeamC");
			rs=pr.executeQuery();
			while(rs.next())
			{
				AccountStatus acct=new AccountStatus();
				acct.setCustomerId(rs.getString(1));
				acct.setAccountId(rs.getString(2));
				acct.setAcctype(rs.getString(3));
				acct.setStatus(rs.getString(4));
				acct.setMessage(rs.getString(5));
				acct.setLastupdated(rs.getDate(6));
				account.add(acct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
		
	}
	public ArrayList<CustomerStatus> getallCustomerStatus()
	{
	
		ResultSet rs=null;
		
		ArrayList<CustomerStatus> customers=new ArrayList<CustomerStatus>();
		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("select * from CustomerStatus_TeamC");
			rs=pr.executeQuery();
			while(rs.next())
			{
				CustomerStatus cust=new CustomerStatus();
				cust.setSsnID(rs.getString(1));
				cust.setCustomerId(rs.getString(2));
				cust.setStatus(rs.getString(3));
				cust.setMessage(rs.getString(4));
				cust.setLastupdated(rs.getDate(5));
				customers.add(cust);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customers;
		
	}
	public void addEmployeeLogin(String id,String pasword,String type)
	{

		try {
			con=DatabaseUtil.getConnection();
			pr=con.prepareStatement("insert into userstore_Teamc values(?,?,?,current_timestamp)");
			pr.setString(1, id);
			pr.setString(2, pasword);
			pr.setString(3, type);
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}

