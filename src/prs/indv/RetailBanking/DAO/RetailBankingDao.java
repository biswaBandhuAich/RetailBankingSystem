package prs.indv.RetailBanking.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import prs.indv.RetailBanking.Util.DatabaseUtil;
import prs.indv.RetailBanking.bean.Account;
import prs.indv.RetailBanking.bean.Customer;

public class RetailBankingDao {
	long millis=System.currentTimeMillis();  
	Date date=new Date(millis);
	
	Connection con = null;

	ResultSet rst = null;

	public String AddCustomer(Customer customer)
	{
		
		con = DatabaseUtil.getConnection();
		Random rnd = new Random();
		int rand_var= 100 + rnd.nextInt(900);
		int sequence=0;
		String result=null;
		ResultSet rs=null;
		PreparedStatement pr = null;
		PreparedStatement pr1=null;
		try {
			pr1=con.prepareStatement("select seq_customer_1513329.nextval from dual");
			rs=pr1.executeQuery();
			while(rs.next())
			{
				sequence=rs.getInt(1);
			}
			String cId=Integer.toString(sequence)+Integer.toString(0)+Integer.toString(rand_var);
			pr = con.prepareStatement("insert into Customer_TeamC values(?,?,?,?,?,?,?,?,?,?,?)");
			pr.setString(1,cId);
			pr.setString(2,customer.getCustomerSSN());
			pr.setString(3,customer.getFirstName());
			pr.setString(4,customer.getLastName());
			pr.setInt(5,customer.getAge());
			pr.setString(6,customer.getAddressLine1());
			pr.setString(7,customer.getAddressLine2());
			pr.setString(8,customer.getCity());
			pr.setString(9,customer.getState());
			pr.setString(10, customer.getNumber());
			pr.setString(11, customer.getGender());
			int k =pr.executeUpdate();
			if(k>0)
			{
				result=cId;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(pr);
			DatabaseUtil.closeConnection(con);

		}

		return result;

	}

	public boolean checkCustomer(Customer customer)
	{
		boolean flag=false;
		PreparedStatement ps=null;
		con=DatabaseUtil.getConnection();
		try {


			ps=con.prepareStatement("select * from Customer_TeamC WHERE customerSSn=?");
			ps.setString(1, customer.getCustomerSSN());
			rst=ps.executeQuery();
			if(rst.next())
			{
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rst);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);

		}

		return flag;
	}
	public Customer ViewCustomer(String id)
	{
		Customer customer = new Customer();
		PreparedStatement ps = null;
		con = DatabaseUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from Customer_TeamC where customerID=?");
			ps.setString(1,id);
			rst = ps.executeQuery();
			while(rst.next())
			{
				
				customer.setCustomerId(rst.getString(1));
				customer.setCustomerSSN(rst.getString(2));
				customer.setFirstName(rst.getString(3));
				customer.setLastName(rst.getString(4));
				customer.setAge(rst.getInt(5));
				customer.setAddressLine1(rst.getString(6));
				customer.setAddressLine2(rst.getString(7));
				customer.setCity(rst.getString(8));
				customer.setState(rst.getString(9));
				customer.setNumber(rst.getString(10));
				customer.setGender(rst.getString(11));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rst);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);

		}


		return customer;


	}
	public boolean UpdateCustomer(String CustomerSSN,String CustomerID,String FirstName,String lastname,int age,String address1,String address2,String city,String state,String phno,String gender)
	{
		boolean val= false;
		con = DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement("update Customer_TeamC set firstname=?,lastname=?,age=?,addressline1=?,addressline2=?,city=?,state=?,phonenumber=?,gender=? where customerID=?");
			ps.setString(1,FirstName);
			ps.setString(2,lastname);
			ps.setInt(3,age);
			ps.setString(4,address1);
			ps.setString(5,address2);
			ps.setString(6,city);
			ps.setString(7,state);
			ps.setString(10,CustomerID);
			ps.setString(8, phno);
			ps.setString(9, gender);
			int k = ps.executeUpdate();
			if(k>0)
			{
				val = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rst);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);

		}
		
		return val;
		
	}/*
	public boolean deleteCustomer(int id)
	{
		boolean flag=false;
		con =DatabaseUtil.getConnection();
		PreparedStatement ps = null;
		try {
			ps=con.prepareStatement("delete from Table_Name where CustID=?");
			ps.setInt(1,id);
			int k=ps.executeUpdate();
			if(k>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeResult(rst);
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);

		}
		
		return flag;
	}
	public String AccountStatus(int CustID)
	{
		String status="";
		PreparedStatement ps = null;
		con = DatabaseUtil.getConnection();
		try {
			ps = con.prepareStatement("select status from Account_Status where CustId=?");
			ps.setInt(1,CustID);
			rst = ps.executeQuery();
			while(rst.next())
			{
				status=rst.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeResult(rst);
			DatabaseUtil.closeConnection(con);
		}
		return status;
	}*/
public String searchEmployee(String id,String password,String type)
{
	PreparedStatement ps = null;
	ResultSet rst=null;
	boolean flag=false;
	String name=null;
	con=DatabaseUtil.getConnection();
	try {
		ps=con.prepareStatement("select username,password,name from user1 where username=? and password=? and usertype=?");
		ps.setString(1, id);
		ps.setString(2, password);
		ps.setString(3, type);
		rst=ps.executeQuery();
		if(rst.next())
		{
			flag=true;
			name=rst.getString(3);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeResult(rst);
		DatabaseUtil.closeConnection(con);
	}
	return name;
}
public boolean deleteCustomerbyId(String customerId)
{
	PreparedStatement ps=null;
	PreparedStatement ps1=null;

	boolean flag=false;
	con=DatabaseUtil.getConnection();
	
	try {
	
		ps=con.prepareStatement("delete from Customer_TeamC where customerID=?");
		ps.setString(1, customerId);
		int i=ps.executeUpdate();
		if(i>0)
			flag=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeResult(rst);
		DatabaseUtil.closeConnection(con);
	}
	return flag;
}public String createAccount(Account account)
{
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs=null;
	con=DatabaseUtil.getConnection();
	Random rnd = new Random();
	int rand_var= 10 + rnd.nextInt(90);
	int sequence=0;String result=null;
	try {
		ps1=con.prepareStatement("select seq_account_1513329.nextval from dual");
		rs=ps1.executeQuery();
		while(rs.next())
		{
			sequence=rs.getInt(1);
		}
		 
		String acId=Integer.toString(sequence)+Integer.toString(000)+Integer.toString(rand_var);
		ps=con.prepareStatement("insert into Account_TeamC(accountno,accounttype,balance,customerID) values(?,?,?,?)");
		ps.setString(1, acId);
		ps.setString(2, account.getAccount_type());
		ps.setInt(3, account.getBalance());
		ps.setString(4, account.getCustomerID());
		int k =ps.executeUpdate();
		if(k>0)
		{
			result=acId;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeStatement(ps1);
		DatabaseUtil.closeConnection(con);
	}
	return result;
	
}
public boolean checkAccount(Account account)
{
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	int count=0;
	boolean flag=false;
	try {
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("Select count(accountno) from Account_TeamC where accounttype=? and customerID=?");
		ps.setString(1, account.getAccount_type());
		ps.setString(2, account.getCustomerID());
		rs=ps.executeQuery();
		while(rs.next()){
			count=rs.getInt(1);
		}
		if(count>0){
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeResult(rs);
		DatabaseUtil.closeConnection(con);
	}
	return flag;
}
public ArrayList<Account> getAccounts(String custId)
{
	ArrayList<Account> accs=new ArrayList<Account>();
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	
	try {
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from Account_TeamC where customerID=?");
		ps.setString(1, custId);
		rs=ps.executeQuery();
		while(rs.next())
		{
			Account account=new Account();
			account.setAccountId(rs.getString(1));
			account.setAccount_type(rs.getString(2));
			account.setBalance(rs.getInt(3));
			account.setCustomerID(rs.getString(4));
			accs.add(account);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return accs;
}
public boolean checkzeroBalance(String accountId)
{
	
	PreparedStatement smt=null;
	ResultSet rs=null;
	int balance=0;
	try {
		con=DatabaseUtil.getConnection();
		smt=con.prepareStatement("select  balance from Account_TeamC where accountno=?");
		smt.setString(1, accountId);
		rs=smt.executeQuery();
		while(rs.next())
		{
			balance=rs.getInt(1);
		}
	if(balance>0)
		return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
	
}
public boolean deleteAccount(String accountId)
{
	
	PreparedStatement smt=null;
	PreparedStatement smt1=null;
	boolean flag=false;
	
	try {
		con=DatabaseUtil.getConnection();
		smt1=con.prepareStatement("delete from transaction_TeamC where accountno=?");
		smt1.setString(1, accountId);
		int j=smt1.executeUpdate();
		smt=con.prepareStatement("delete from Account_TeamC where accountno=?");
		smt.setString(1, accountId);
		int i=smt.executeUpdate();
			return true;
		
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return flag;
	
}
public Customer ViewCustomerbySSNID(String id)
{
	Customer customer = new Customer();
	PreparedStatement ps = null;
	con = DatabaseUtil.getConnection();
	try {
		ps = con.prepareStatement("select * from Customer_TeamC where  customerSSn=?");
		ps.setString(1,id);
		rst = ps.executeQuery();
		while(rst.next())
		{
			
			customer.setCustomerId(rst.getString(1));
			customer.setCustomerSSN(rst.getString(2));
			customer.setFirstName(rst.getString(3));
			customer.setLastName(rst.getString(4));
			customer.setAge(rst.getInt(5));
			customer.setAddressLine1(rst.getString(6));
			customer.setAddressLine2(rst.getString(7));
			customer.setCity(rst.getString(8));
			customer.setState(rst.getString(9));
			customer.setNumber(rst.getString(10));
			customer.setGender(rst.getString(11));
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DatabaseUtil.closeResult(rst);
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);

	}


	return customer;


}
public boolean checkAccountbyCID(String CustomerID)
{
	boolean flag=false;
	PreparedStatement pr=null;
	ResultSet rs=null;
	try {
		con=DatabaseUtil.getConnection();
		pr=con.prepareStatement("select * from Account_TeamC where customerID=?");
		pr.setString(1, CustomerID);
		rs=pr.executeQuery();
		if(rs.next())
			return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return flag;
}
public boolean checkcustomerId(String customerID)
{
	boolean flag=false;
	PreparedStatement smt=null;
	ResultSet rs=null;
	con=DatabaseUtil.getConnection();
	try {
		smt=con.prepareStatement("select * from Customer_TeamC where customerid=?");
		smt.setString(1, customerID);
		rs=smt.executeQuery();
		if(rs.next())
			flag= true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return flag;
	
}
}
