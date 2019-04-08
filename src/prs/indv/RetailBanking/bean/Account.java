package prs.indv.RetailBanking.bean;

import java.util.ArrayList;
import java.util.Date;

public class Account 
{
	private String accountId;
	private int balance;
	private String account_type;
	private String status;
	private String message;
	private Date lastUpdated;
	private String customerID;
	private ArrayList<Transaction> transacionList;
	
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Account(String accountId, int balance, String account_type, String status, String message, Date lastUpdated,
			Customer customerId, ArrayList<Transaction> transacionList) {
		super();
		this.accountId = accountId;
		this.balance = balance;
		this.account_type = account_type;
		this.status = status;
		this.message = message;
		this.lastUpdated = lastUpdated;
		this.transacionList = transacionList;
		
	}







	public ArrayList<Transaction> getTransacionList() {
		return transacionList;
	}


	public void setTransacionList(ArrayList<Transaction> transacionList) {
		this.transacionList = transacionList;
	}


	public int getBalance() {
		return balance;
	}



	public void setBalance(int balance) {
		this.balance = balance;
	}



	public String getAccount_type() {
		return account_type;
	}



	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}


	public String getAccountId() {
		return accountId;
	}


	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Date getLastUpdated() {
		return lastUpdated;
	}


	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}


	public String getCustomerID() {
		return customerID;
	}


	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}


	

	
	
	
}
