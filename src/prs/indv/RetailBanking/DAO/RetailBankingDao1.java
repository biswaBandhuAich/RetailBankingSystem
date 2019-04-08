package prs.indv.RetailBanking.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import prs.indv.RetailBanking.Util.DatabaseUtil;
import prs.indv.RetailBanking.bean.Account;
import prs.indv.RetailBanking.bean.AccountStatus;
import prs.indv.RetailBanking.bean.Customer;
import prs.indv.RetailBanking.bean.Transaction;

public class RetailBankingDao1 {
	
	long millis=System.currentTimeMillis();  
	Date date=new Date(millis);
	
	Connection con = null;
	PreparedStatement pr = null;
	ResultSet rst = null;

	
	public Customer GetAccountDetailsCID(String id,String acctype)
	{
		Customer customer  = new Customer();
		Account acct=new Account();
		con = DatabaseUtil.getConnection();
		try {
			pr = con.prepareStatement("select A.*, C.firstname,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.customerID=? and A.accounttype=?");
			pr.setString(1,id);
			pr.setString(2,acctype);
			rst = pr.executeQuery();
			while(rst.next())
			{
				acct.setAccountId(rst.getString(1));
				acct.setAccount_type(rst.getString(2));
				acct.setBalance(rst.getInt(3));
				customer.setCustomerId(rst.getString(4));
				customer.setFirstName(rst.getString(7));
				customer.setLastName(rst.getString(8));
				customer.setAccount(acct);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
	}
	
	public Customer GetAccountDetailsAID(String id)
	{
		Customer customer  = new Customer();
		Account account=new Account();
		con = DatabaseUtil.getConnection();
		try {
			pr = con.prepareStatement("select A.*, C.firstname,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo=?");
			pr.setString(1,id);
			rst = pr.executeQuery();
			while(rst.next())
			{
				account.setAccountId(rst.getString(1));
				account.setAccount_type(rst.getString(2));
				account.setBalance(rst.getInt(3));
				customer.setCustomerId(rst.getString(4));
				customer.setFirstName(rst.getString(7));
				customer.setLastName(rst.getString(8));
				customer.setAccount(account);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
	}
	public int getBalance(String acoountID)
	{
		PreparedStatement smt=null;
		ResultSet rs=null;
		int balance=0;
		try {
			con=DatabaseUtil.getConnection();
			smt=con.prepareStatement("select balance from Account_TeamC where accountno=?");
			smt.setString(1, acoountID);
			rs=smt.executeQuery();
			while(rs.next())
			{
				balance=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return balance;
	}
	public Customer ViewAccountSearch(String accountno, String type)
	{
		Customer customer = new Customer();
		con =DatabaseUtil.getConnection();
		try {
			pr = con.prepareStatement("select A.*, C.firstname,C.lastname from Account_TeamC A,Customer_TeamC C where A.customerID = C.customerID and A.AccountNo=? and A.accounttype=?");
			pr.setString(1,accountno);
			pr.setString(2,type);
			rst = pr.executeQuery();
			while(rst.next())
			{
				customer.getAccount().setAccountId(rst.getString(1));
				customer.getAccount().setAccount_type(rst.getString(2));
				customer.getAccount().setBalance(rst.getInt(3));
				customer.getAccount().setCustomerID(rst.getString(4));
				customer.setFirstName(rst.getString(6));
				customer.setMiddleName(rst.getString(7));
				customer.setLastName(rst.getString(8));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return customer;

	}
	public Account depositAmount(String aid, int amount){
		Connection cn=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;

		ResultSet rs=null;
		Account account = new Account();
		try {
			cn=DatabaseUtil.getConnection();
			ps=cn.prepareStatement("update ACCOUNT_TEAMC set balance=balance+? where accountno=?");
			ps.setInt(1, amount);
			ps.setString(2, aid);
			int i=ps.executeUpdate();
			if(i>0)
			{
				registerTransaction("credited",aid, amount);
			}
			
			ps1=cn.prepareStatement("select * from ACCOUNT_TEAMC where accountno=?");
			ps1.setString(1, aid);
			rs=ps1.executeQuery();
			while(rs.next()){
				account.setAccountId(rs.getString(1));
				account.setAccount_type(rs.getString(2));
				account.setBalance(rs.getInt(3));
				account.setCustomerID(rs.getString(4));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(ps1);
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
			
		}
		return account;
	}
	
	public Account withdrawAmount(String accId,int withdraw)
	{
		PreparedStatement smt=null;
		PreparedStatement ps1=null;
		ResultSet rs=null;
	
		Account account = new Account();
		try {
			con=DatabaseUtil.getConnection();
			smt=con.prepareStatement("update Account_TeamC set balance=balance-? where accountno=?");
			smt.setInt(1, withdraw);
			smt.setString(2, accId);
			int i=smt.executeUpdate();
			if(i>0)
			{
				registerTransaction("debited",accId, withdraw);

			}
			ps1=con.prepareStatement("select * from ACCOUNT_TEAMC where accountno=?");
			ps1.setString(1, accId);
			rs=ps1.executeQuery();
			while(rs.next()){
				account.setAccountId(rs.getString(1));
				account.setAccount_type(rs.getString(2));
				account.setBalance(rs.getInt(3));
				account.setCustomerID(rs.getString(4));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
		
		
		
	}
	/*Transfer**/
	public Account payeeTransferTransaction(String payAccNo, int amount){
		Connection cn=null;
		PreparedStatement ps=null;

		ResultSet rs=null;
		
		Account account=new Account();
		
	
		try {
			cn=DatabaseUtil.getConnection();
			ps=cn.prepareStatement("update ACCOUNT_TEAMC set balance=balance-? where accountno=?");
			ps.setInt(1, amount);
			ps.setString(2, payAccNo);
			int i=ps.executeUpdate();
			if(i>0)
			{
				registerTransaction("debited",payAccNo, amount);
			}
			PreparedStatement ps3=cn.prepareStatement("select * from ACCOUNT_TEAMC where accountno=?");
			ps3.setString(1, payAccNo);
			rs=ps3.executeQuery();
			while(rs.next()){
				account.setAccountId(rs.getString(1));
				account.setAccount_type(rs.getString(2));
				account.setBalance(rs.getInt(3));
				account.setCustomerID(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeConnection(cn);
		}
		return account;
	}
	
	public Account beneficiaryTransferTransaction(String benAccNo, int amount){
		Connection cn=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;

		ResultSet rs=null;
		Account account=new Account();
		try {
			cn=DatabaseUtil.getConnection();
			ps=cn.prepareStatement("update ACCOUNT_TEAMC set balance=balance+? where accountno=?");
			ps.setInt(1, amount);
			ps.setString(2,benAccNo);
			int i=ps.executeUpdate();
			if(i>0)
			{
				registerTransaction("credited",benAccNo, amount);
			}
			ps1=cn.prepareStatement("select * from ACCOUNT_TEAMC where accountno=?");
			ps1.setString(1,benAccNo);
			rs=ps1.executeQuery();
			while(rs.next()){
				account.setAccountId(rs.getString(1));
				account.setAccount_type(rs.getString(2));
				account.setBalance(rs.getInt(3));
				account.setCustomerID(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rs);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(cn);
		}
		return account;
	}
	/*Transfer**/
	/*Register transaction*/
	public Boolean registerTransaction(String type,String accId,int amt)
	{
		PreparedStatement ps2=null;		
		try {
			int balance=getBalance(accId);
			con= DatabaseUtil.getConnection();
			ps2=con.prepareStatement("insert into transaction_TeamC values (seq_transaction.nextval,?,?,?,?,?)");
			ps2.setString(1, type);
			ps2.setInt(2, amt);
			ps2.setString(3, accId);
			ps2.setDate(4, date);
			ps2.setInt(5, balance);
			int j=ps2.executeUpdate();
			if(j>0)
			{
				return true;
			}
			else 
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		}

	public ArrayList<Transaction> getTransactions(String acctid) {
		
		PreparedStatement ps2=null;		
		ArrayList<Transaction> ts=new ArrayList<Transaction>();
		try {
			con= DatabaseUtil.getConnection();
			ps2=con.prepareStatement("select * from transaction_TeamC where accountno=? order by transactionid desc");
			ps2.setString(1, acctid);
			ResultSet rs=ps2.executeQuery();
			while(rs.next())
			{
				
			Transaction transaction=new Transaction(rs.getInt(1), acctid, rs.getString(2), rs.getInt(3), rs.getDate(5),rs.getInt(6));
			ts.add(transaction);	
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ts;
			}
public ArrayList<Transaction> getTransactionsbyNo(String acctid,int number) {
		
		PreparedStatement ps2=null;		
		ArrayList<Transaction> ts=new ArrayList<Transaction>();
		try {
			con= DatabaseUtil.getConnection();
			ps2=con.prepareStatement("select * from transaction_TeamC where accountno=? and rownum<? order by transactionid desc ");
			ps2.setString(1, acctid);
			ps2.setInt(2, (number+1));
			ResultSet rs=ps2.executeQuery();
			while(rs.next())
			{
				
			Transaction transaction=new Transaction(rs.getInt(1), acctid, rs.getString(2), rs.getInt(3), rs.getDate(5),rs.getInt(6));
			ts.add(transaction);	
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ts;
			}
public AccountStatus showAccountStatus(String accid)
{
	con=DatabaseUtil.getConnection();
	PreparedStatement smt=null;
	ResultSet rs=null; 
	AccountStatus acct=new AccountStatus();
	try {
		smt=con.prepareStatement("select * from AccountStatus_teamC where accountid=?");
		rs=smt.executeQuery();
		
		
		acct.setCustomerId(rs.getString(1));
		acct.setAccountId(rs.getString(2));
		acct.setAcctype(rs.getString(3));
		acct.setStatus(rs.getString(4));
		acct.setMessage(rs.getString(5));
		acct.setLastupdated(rs.getDate(6));
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return acct;
}
	}
	

