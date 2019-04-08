package prs.indv.RetailBanking.Services;

import java.util.ArrayList;

import prs.indv.RetailBanking.DAO.RetailBankingDao;
import prs.indv.RetailBanking.DAO.RetailBankingDao1;
import prs.indv.RetailBanking.DAO.RetailBankingDao2;
import prs.indv.RetailBanking.Util.BalanceNotSufficientException;
import prs.indv.RetailBanking.bean.*;

public class BankingServices1 {

	public Customer GetAccountDetailsCID(String id,String acctype)
	{
		
		RetailBankingDao1 dao = new RetailBankingDao1();
		Customer cust=dao.GetAccountDetailsCID(id,acctype);
		return cust;
		
		
		
	}
	public Customer GetAccountDetailsAID(String id)
	{
		RetailBankingDao1 dao = new RetailBankingDao1();
		Customer cust=dao.GetAccountDetailsAID(id);
		return cust ;
			
	}
	
	
	
	public Customer ViewAccountSearch(String accountno, String type)
	{
		RetailBankingDao1 dao = new RetailBankingDao1();
		return dao.ViewAccountSearch(accountno, type);
		
	}
	
	public Account depositAmount(String aid, int amount) {
		RetailBankingDao1 dao = new RetailBankingDao1();
		Account account = dao.depositAmount(aid, amount);
		return account;
	}
	public Account withdrawFrom(String accountId,int balance) throws BalanceNotSufficientException
	{
		RetailBankingDao1 dao = new RetailBankingDao1();
		if(dao.getBalance(accountId)<balance)
			throw new BalanceNotSufficientException("Balance is Not Sufficient");
		else
		return dao.withdrawAmount(accountId, balance);
	}
	public Account payeeTransferTransaction(String payAccNo, int amount){
		RetailBankingDao1 dao = new RetailBankingDao1();
		return dao.payeeTransferTransaction(payAccNo, amount);	
	}
	
	public Account beneficiaryTransferTransaction(String benAccNo, int amount){
		RetailBankingDao1 dao = new RetailBankingDao1();
		return dao.beneficiaryTransferTransaction(benAccNo, amount);
		
	}
	public Customer getStatement(String custtid, String acctid) {
		
		RetailBankingDao1 da1=new RetailBankingDao1();
		ArrayList<Transaction> al=da1.getTransactions(acctid);
		Customer cust=GetAccountDetailsAID(acctid);
		cust.getAccount().setTransacionList(al);;
		return cust;
	}
public Customer getStatementbyNo(String custtid, String acctid,int number) {
		RetailBankingDao1 da1=new RetailBankingDao1();
		ArrayList<Transaction> al=da1.getTransactionsbyNo(acctid, number);
		Customer cust=GetAccountDetailsAID(acctid);
		cust.getAccount().setTransacionList(al);;
		return cust;
	}
	public void addcustStatusonUpdate(CustomerStatus cstatus)
	{
		
		RetailBankingDao2 dao=new RetailBankingDao2();
		dao.addcustStatusonUpdate(cstatus);
		
		
	}
	public void addaccountStatusonDelete(AccountStatus accstatus)
	{
		RetailBankingDao2 dao=new RetailBankingDao2();
		dao.addacctStatusonUpdate(accstatus);
		
	}
	public ArrayList<AccountStatus> getallAccountStatus()
	{
		RetailBankingDao2 dao=new RetailBankingDao2();

		return dao.getallAccountStatus();
	}
	public ArrayList<CustomerStatus> getAllCustomersStatus()
	{
		RetailBankingDao2 dao=new RetailBankingDao2();

		return dao.getallCustomerStatus();
		
	}
	public AccountStatus getaccountStatusbyID(String accid)
	{
		RetailBankingDao1 dao=new RetailBankingDao1();
		return dao.showAccountStatus(accid);
	}
}
