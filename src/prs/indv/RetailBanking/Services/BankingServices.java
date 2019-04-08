package prs.indv.RetailBanking.Services;

import java.util.ArrayList;

import prs.indv.RetailBanking.DAO.RetailBankingDao;
import prs.indv.RetailBanking.DAO.RetailBankingDao2;
import prs.indv.RetailBanking.Util.AccountAlreadyExistsException;
import prs.indv.RetailBanking.Util.AccountCannotBeClosed;
import prs.indv.RetailBanking.Util.AccountsNotAvailableException;
import prs.indv.RetailBanking.Util.CannotDeleteCustomer;
import prs.indv.RetailBanking.Util.CustomerAlreadyExistsException;
import prs.indv.RetailBanking.Util.CustomerDoesnotExistexception;
import prs.indv.RetailBanking.bean.Account;
import prs.indv.RetailBanking.bean.AccountStatus;
import prs.indv.RetailBanking.bean.Customer;
import prs.indv.RetailBanking.bean.CustomerStatus;

public class BankingServices {
	public String AddCustomer(Customer customer) throws CustomerAlreadyExistsException
	{
		RetailBankingDao dao=new RetailBankingDao();
		if(dao.checkCustomer(customer))
			throw new CustomerAlreadyExistsException("SSNID already Exits");
		else 
			return dao.AddCustomer(customer);
	}

	public Customer ViewCustomer(String id)
	{
	
		RetailBankingDao dao=new RetailBankingDao();
		return dao.ViewCustomer(id);
		
	}
	public Customer ViewCustomerBySSNID(String id)
	{
	
		RetailBankingDao dao=new RetailBankingDao();
		return dao.ViewCustomerbySSNID(id);
		
	}
	/*
	public boolean UpdateCustomer(int CustomerSSN,int CustomerID,String CustomerName,String Address1,String Address2,int age)
	{
		RetailBankingDao dao=new RetailBankingDao();
		return dao.UpdateCustomer(CustomerSSN,CustomerID,CustomerName,Address1,Address2,age);
		
	}
	public boolean deleteCustomer(int id) throws AccountActivateException
	{
		RetailBankingDao dao=new RetailBankingDao();
		if(dao.AccountStatus(id).equalsIgnoreCase("activate"))
		{
			throw new AccountActivateException("account actived!!!");
		}
			return dao.deleteCustomer(id);
		
	}*/
	public String searchEmployee(String id,String password,String type)
	{
		RetailBankingDao dao=new RetailBankingDao();
		return dao.searchEmployee(id, password,type);
		
	}

	public boolean UpdateCustomer(String customerSSN, String customerID, String firstName,
			String lastname, int age, String address1, String address2, String city, String state,String phno,String gender) {

		RetailBankingDao dao=new RetailBankingDao();
		return dao.UpdateCustomer(customerSSN, customerID, firstName, lastname, age, address1, address2, city, state,phno,gender);
		

	}
	public boolean deleteCustomer(String customerId) throws CannotDeleteCustomer
	{
		RetailBankingDao dao=new RetailBankingDao();
		RetailBankingDao2 dao2=new RetailBankingDao2();
		if(dao2.searchAccountStatus(customerId))
		{
			throw new CannotDeleteCustomer("Customer Still Have Active Account! Cannot Deregister Customer");
		}
		return dao.deleteCustomerbyId(customerId);
	}
	public String addAccount(Account account) throws AccountAlreadyExistsException, CustomerDoesnotExistexception 
	{
		RetailBankingDao dao=new RetailBankingDao();
		if(!dao.checkcustomerId(account.getCustomerID()))
			throw new CustomerDoesnotExistexception("Customer Not Registered");
		if(dao.checkAccount(account))
			throw new AccountAlreadyExistsException("Account Already Exists");
		else 
			return dao.createAccount(account);
	}
	public ArrayList<Account> getAccounts(String customerId) throws AccountsNotAvailableException
	{
		RetailBankingDao dao=new RetailBankingDao();
		if(!dao.checkAccountbyCID(customerId))
			throw new AccountsNotAvailableException("There are no active accounts for this Customer.");
		return dao.getAccounts(customerId);
		
	}
	public boolean deleteAccount(String accountId) throws AccountCannotBeClosed
	{
		
		RetailBankingDao dao=new RetailBankingDao();
		if(dao.checkzeroBalance(accountId))
			throw new AccountCannotBeClosed("Account Cannot be Closed With Balance.");
		else
			return dao.deleteAccount(accountId);
		
	}
	public void addcustStatus(CustomerStatus cstatus)
	{
		
		RetailBankingDao2 dao=new RetailBankingDao2();
		dao.addCustomerStatus(cstatus);
		
		
	}
	public void addaccountStatus(AccountStatus accstatus)
	{
		RetailBankingDao2 dao=new RetailBankingDao2();
		dao.addAccountStatus(accstatus);
		
	}
	public void addEmployeeLogin(String id,String pass,String type)
	{
		RetailBankingDao2 dao=new RetailBankingDao2();

		dao.addEmployeeLogin(id, pass, type);
	}
}
