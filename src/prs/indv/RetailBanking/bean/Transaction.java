package prs.indv.RetailBanking.bean;

import java.sql.Date;

public class Transaction {

	private int transactionid;// Not in constructor need to fetched from database
	private String accountId;
	private String transactionType;
	private int amount;	
	private int ledgerBalance;	
	
	public int getLedgerBalance() {
		return ledgerBalance;
	}

	public void setLedgerBalance(int ledgerBalance) {
		this.ledgerBalance = ledgerBalance;
	}
	private Date date;
	
	public int getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(int transactionid) {
		this.transactionid = transactionid;
	}

	public String getTransactionType() {
		return transactionType;
	}
	

	public Transaction(int transactionid,String accountId, String transactionType, int amount, Date date,int ledgerbalance) {
		super();
		this.transactionid=transactionid;
		this.accountId = accountId;
		this.transactionType = transactionType;
		this.amount = amount;
		this.date=date;
		this.ledgerBalance=ledgerbalance;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	

	

}
