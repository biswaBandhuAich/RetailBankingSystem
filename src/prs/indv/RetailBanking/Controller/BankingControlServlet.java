package prs.indv.RetailBanking.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import prs.indv.RetailBanking.DAO.RetailBankingDao2;
import prs.indv.RetailBanking.Services.BankingServices;
import prs.indv.RetailBanking.Services.BankingServices1;
import prs.indv.RetailBanking.Services.EmployeeServices;
import prs.indv.RetailBanking.Util.AccountAlreadyExistsException;
import prs.indv.RetailBanking.Util.AccountCannotBeClosed;
import prs.indv.RetailBanking.Util.AccountsNotAvailableException;
import prs.indv.RetailBanking.Util.BalanceNotSufficientException;
import prs.indv.RetailBanking.Util.CannotDeleteCustomer;
import prs.indv.RetailBanking.Util.CustomerAlreadyExistsException;
import prs.indv.RetailBanking.Util.CustomerDoesnotExistexception;
import prs.indv.RetailBanking.bean.Account;
import prs.indv.RetailBanking.bean.AccountStatus;
import prs.indv.RetailBanking.bean.Customer;
import prs.indv.RetailBanking.bean.CustomerStatus;

/**
 * Servlet implementation class BankingControl
 */
public class BankingControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int i=0;
	/*final static Logger logger=Logger.getLogger(BankingControlServlet.class);*/
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BankingControlServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action=request.getParameter("action");
		BankingServices service = new BankingServices();

		EmployeeServices employeeService=new EmployeeServices();
		

		Customer custCreation=new Customer();
		if(action==null){
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		//For Log-In
		else if(action.equalsIgnoreCase("login"))
		{
			String id=request.getParameter("id");
			String password=request.getParameter("pass");
			String type=request.getParameter("type");
			boolean flag=false;
			String name=service.searchEmployee(id, password,type);
			if(name!=null)
			{
				service.addEmployeeLogin(id, password, type);
				if(type.equalsIgnoreCase("cashier"))
				{
					RequestDispatcher rd = request.getRequestDispatcher("JSP/Intm.jsp");
					session.setAttribute("id", name);
					session.setAttribute("type", type);
					rd.forward(request, response);
				}
				else if(type.equalsIgnoreCase("executive"))
				{
					RequestDispatcher rd = request.getRequestDispatcher("JSP/WelcomeE.jsp");
					session.setAttribute("id", name);
					session.setAttribute("type", type);
					rd.forward(request, response);
				}
			}
			else
			{
				/*logger.error("Login Error");*/
				RequestDispatcher rd = request.getRequestDispatcher("JSP/index.jsp");
				request.setAttribute("error","Check your credentials!!");
				rd.forward(request, response);
			}


		}
		//For_createCustomer
		else if(action.equalsIgnoreCase("createcustomer"))
		{
			response.sendRedirect("CustomerCrudJsp/NewCustomer.jsp");
		}
		//For New Customer Information
		else if(action.equalsIgnoreCase("newcustomer"))
		{


			String customerSSN=request.getParameter("ssnno");
			String customerFirstName=request.getParameter("fname");
			String customerLastName=request.getParameter("lname");
			int age=Integer.parseInt(request.getParameter("age"));
			String addressLine1=request.getParameter("addl1");
			String addressLine2=request.getParameter("addl2");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String phno=request.getParameter("phno");
			String gender=request.getParameter("gender");

			custCreation.setCustomerSSN(customerSSN);
			custCreation.setFirstName(customerFirstName);
			custCreation.setLastName(customerLastName);
			custCreation.setAge(age);
			custCreation.setAddressLine1(addressLine1);
			custCreation.setAddressLine2(addressLine2);
			custCreation.setCity(city);
			custCreation.setState(state);
			custCreation.setNumber(phno);
			custCreation.setGender(gender);

			RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/NewCustomerDisp.jsp");
			request.setAttribute("Customer",custCreation);
			rd.forward(request, response);





		}
		//For New  Customer information Confirmation
		else if(action.equalsIgnoreCase("newcustomercreated")){

			String customerSSN=request.getParameter("ssnno");
			String customerFirstName=request.getParameter("fname");
			String customerLastName=request.getParameter("lname");
			int age=Integer.parseInt(request.getParameter("age"));
			String addressLine1=request.getParameter("addl1");
			String addressLine2=request.getParameter("addl2");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String phno=request.getParameter("phno");
			String gender=request.getParameter("gender");

			custCreation.setCustomerSSN(customerSSN);
			custCreation.setFirstName(customerFirstName);
			custCreation.setLastName(customerLastName);
			custCreation.setAge(age);
			custCreation.setAddressLine1(addressLine1);
			custCreation.setAddressLine2(addressLine2);
			custCreation.setCity(city);
			custCreation.setState(state);
			custCreation.setNumber(phno);
			custCreation.setGender(gender);
			try {
				String custID=service.AddCustomer(custCreation);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation.jsp");
				request.setAttribute("Customer",custID);
				rd.forward(request, response);
				CustomerStatus cstatus=new CustomerStatus();
				cstatus.setCustomerId(custID);
				cstatus.setSsnID(customerSSN);
				cstatus.setMessage("Customer Registered Successfully");
				cstatus.setStatus("Created");
				service.addcustStatus(cstatus);
			} catch (CustomerAlreadyExistsException e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("Error",e.getMessage());
				rd.forward(request, response);
			}


		}
		//To update a customer
		else if(action.equalsIgnoreCase("update")){

			String customerSSN = request.getParameter("ssnid");
			String customerID =  request.getParameter("custid");
			Customer cust = new Customer();
			if(  customerSSN !=null  )
			{

				cust =service.ViewCustomerBySSNID(customerSSN);
				
			}else if( customerID!= null)
			{

				cust= service.ViewCustomer(customerID);
			}
			if(cust.getCustomerId() != null || cust.getCustomerSSN() !=null)
			{
				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/UpdateCustomerDetails.jsp");
				request.setAttribute("Customer",cust);
				rd.forward(request, response);

			}else{

				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/UpdateCustomerSearch.jsp");
				request.setAttribute("msg","Please Enter A Valid Customer Detail!!");
				rd.forward(request, response);
			}

		}
		//For Update
		else if(action.equalsIgnoreCase("updatefromview"))
		{
			String customerID =  request.getParameter("cid");
			Customer cust = new Customer();
			System.out.println(cust.getFirstName());
			cust =service.ViewCustomer(customerID);
			RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/UpdateCustomerDetails.jsp");
			request.setAttribute("Customer",cust);
			rd.forward(request, response);

		}
		//For Updating Details
		else if(action.equalsIgnoreCase("updatedetails")){

			boolean flag = false;
			String CustomerSSN = request.getParameter("ssnID");
			String CustomerID =  request.getParameter("cid");
			String FirstName = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			int age = Integer.parseInt(request.getParameter("age"));
			String address1 = request.getParameter("addressl1");
			String address2 = request.getParameter("addressl2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String phno=request.getParameter("phno");
			String gender=request.getParameter("gender");
		System.out.println(CustomerSSN+CustomerID+FirstName+lastname+age+address1+address2+city+state+phno+gender);

			flag = service.UpdateCustomer(CustomerSSN,CustomerID,FirstName,lastname,age,address1,address2,city,state,phno,gender);
			if(flag)
			{

				RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation.jsp");
				request.setAttribute("message","Customer Update Initiated Successfully with ID:"+CustomerID);
				rd.forward(request, response);
				CustomerStatus cstatus=new CustomerStatus();
				cstatus.setCustomerId(CustomerID);
				cstatus.setMessage("Customer Details Updated");
				cstatus.setStatus("Updated");
				BankingServices1 services=new BankingServices1();
				services.addcustStatusonUpdate(cstatus);
			}else
			{	
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("Error1","Customer Update Unsuccessful!!!!");
				rd.forward(request, response);
			}


		}
		//To Delete Customer
		else if(action.equalsIgnoreCase("deletecustomersearch"))
		{


			String customerSSN = request.getParameter("ssnid");
			String customerID =  request.getParameter("custid");
			Customer cust = new Customer();
			if(customerSSN !=null  )
			{

				cust =service.ViewCustomerBySSNID(customerSSN);

			}else if( customerID!= null)
			{

				cust= service.ViewCustomer(customerID);
			}
			if(cust.getCustomerId() != null)
			{
				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/DeleteCustomerDetails.jsp");
				request.setAttribute("Customer",cust);
				rd.forward(request, response);

			}else{

				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/DeleteCustomerSearch.jsp");
				request.setAttribute("msg","Please Enter Correct Customer Credentials.");
				rd.forward(request, response);
			}


		}
		//To delete a customer
		else if(action.equalsIgnoreCase("delete"))
		{
			String customerId=request.getParameter("CustomerId");
			boolean flag;
			try {
				flag = service.deleteCustomer(customerId);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation.jsp");
				request.setAttribute("ID",customerId );
				rd.forward(request, response);
				CustomerStatus cstatus=new CustomerStatus();
				cstatus.setCustomerId(customerId);
				cstatus.setMessage("Customer Deleted");
				cstatus.setStatus("Deleted");
				BankingServices1 services=new BankingServices1();
				services.addcustStatusonUpdate(cstatus);
			} catch (CannotDeleteCustomer e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("ErrorDel",e.getMessage());
				rd.forward(request, response);
			}
			
			

		}
		//To search for a customer
		else if(action.equalsIgnoreCase("search"))
		{

			String id = request.getParameter("id");
			Customer customer = service.ViewCustomer(id);
			if(customer.getCustomerId()!=null)
			{
				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/ViewCustomer.jsp");
				request.setAttribute("customer",customer);
				rd.forward(request, response);
			}else{

				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/ViewCustomerSearch.jsp");
				request.setAttribute("message","Customer Not Found!!!");
				rd.forward(request, response);


			}
		}
		//To create an account
		else if(action.equalsIgnoreCase("createaccount"))
		{
			String customerId=request.getParameter("id");
			String type=request.getParameter("type");
			int balance=Integer.parseInt(request.getParameter("balance"));

			Account account=new Account();
			account.setCustomerID(customerId);
			account.setAccount_type(type);
			account.setBalance(balance);
			try {
				
				String accId=service.addAccount(account);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation.jsp");
				request.setAttribute("AccountId",accId);
				request.setAttribute("type", type);
				rd.forward(request, response);
				AccountStatus acctstatus=new AccountStatus();
				acctstatus.setAccountId(accId);
				acctstatus.setCustomerId(customerId);
				acctstatus.setAcctype(type);
				acctstatus.setStatus("Active");
				acctstatus.setMessage("Account Created with Initial Balance: Rs"+balance);
				service.addaccountStatus(acctstatus);
			} catch (AccountAlreadyExistsException e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("ErrorAcc",e.getMessage());
				rd.forward(request, response);
			} catch (CustomerDoesnotExistexception e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("ErrorAcc",e.getMessage());
				rd.forward(request, response);
			} 

		}
		//To search to delete any account
		else if(action.equalsIgnoreCase("searchdeleteaccount"))
		{
			String custId=request.getParameter("custid");
			
			try {
				ArrayList<Account> accounts;
				accounts = service.getAccounts(custId);
				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/DeleteAccount.jsp");
				request.setAttribute("accounts",accounts);
				rd.forward(request, response);
			} catch (AccountsNotAvailableException e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("noaccount",e.getMessage());
				rd.forward(request, response);
			} 
			



		}
		//To delete the Account
		else if(action.equalsIgnoreCase("deleteconfirm"))
		{
			String accountID=request.getParameter("accid");
			try {
				service.deleteAccount(accountID);
				AccountStatus acc=new AccountStatus();
				acc.setAccountId(accountID);
				acc.setStatus("Inactive");
				acc.setMessage("Deleted Account");
				BankingServices1 services=new BankingServices1();
				services.addaccountStatusonDelete(acc);
					RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation.jsp");
					request.setAttribute("deleted","Account Deletion initiated Successfully");
					rd.forward(request, response);
					
				
			} catch (AccountCannotBeClosed e) {
				RequestDispatcher rd = request.getRequestDispatcher("JSP/ErrorPage.jsp");
				request.setAttribute("notdeleted",e.getMessage());
				rd.forward(request, response);
			}	
		}

		//To the intermediate page for Teller during Log_in
		else if(action.equalsIgnoreCase("intm"))
		{
			String a=request.getParameter("btnaction");
			if(a.equalsIgnoreCase("update2"))
			{

				String act=request.getParameter("custid");
				String type=request.getParameter("acctype");
				BankingServices1 bs1=new BankingServices1();
				Customer newCust=bs1.GetAccountDetailsCID(act, type);
				if(newCust.getAccount().getAccountId()!=null){
					RequestDispatcher rd=request.getRequestDispatcher("JSP/WelcomeC.jsp");
					request.setAttribute("Customer", newCust);
					rd.forward(request, response);
				}else{


					RequestDispatcher rd = request.getRequestDispatcher("JSP/Intm.jsp");
					request.setAttribute("message","Customer Not found!!!!");
					rd.forward(request, response);


				}

			}
		//To go to next Page after Customer No
			else if(a.equalsIgnoreCase("update1"))
			{
				String accntId=request.getParameter("ssnid");
				BankingServices1 bs1=new BankingServices1();
				Customer newCust=bs1.GetAccountDetailsAID(accntId);

				if(newCust.getAccount().getAccountId()!=null)
				{
					RequestDispatcher rd=request.getRequestDispatcher("JSP/WelcomeC.jsp");
					request.setAttribute("Customer", newCust);
					rd.forward(request, response);
				}else{
					RequestDispatcher rd = request.getRequestDispatcher("JSP/Intm.jsp");
					request.setAttribute("message","Customer Not found!!!!");
					rd.forward(request, response);

				}
			}
		}
		//to search for Account

			else if(action.equalsIgnoreCase("viewaccountsearch")){
				String accno = request.getParameter("accountno");
				String type = request.getParameter("type");
				BankingServices1 service1 = new BankingServices1();

				Customer customer = service1.ViewAccountSearch(accno, type);


				if(customer.getAccount().getAccountId()!=null)
				{
					RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/ViewAccountDetails.jsp");
					request.setAttribute("customer",customer);
					rd.forward(request, response);
				}else if(customer.getAccount().getAccountId()==null)
				{
					RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/ViewAccountSearch.jsp");
					request.setAttribute("message","Account Not Found!!!"+accno);
					rd.forward(request, response);
				}

			}

//For Deposit 
			else if(action.equalsIgnoreCase("deposit")){

				String accountNo=request.getParameter("id");
				String customerId=request.getParameter("cid");
				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/DepositSearch.jsp");
				request.setAttribute("id",accountNo);
				request.setAttribute("cid", customerId);
				rd.forward(request, response);
			}

//For deposit Confirmation
			else if(action.equalsIgnoreCase("depositamount")){
				int amount = Integer.parseInt(request.getParameter("paisa"));
				String aid = request.getParameter("aid");
				BankingServices1 service1 = new BankingServices1();
				Customer customer = service1.GetAccountDetailsAID(aid);
				Account account=service1.depositAmount(aid, amount);

				RequestDispatcher rd= request.getRequestDispatcher("AccountCrudJsp/DepositAmount.jsp");
				request.setAttribute("customer", customer);
				request.setAttribute("account", account);
				rd.forward(request, response);

			}
//For Withdraw Amount
			else if(action.equalsIgnoreCase("withdrawamt"))
			{
				
				String accountid=request.getParameter("id");
				String customerid=request.getParameter("cid");
				
				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/WithdrawalAmount.jsp");
				request.setAttribute("id",accountid);
				request.setAttribute("cid", customerid);
				rd.forward(request, response);
				
			}
//For Withdraw Confirmation
			else if(action.equalsIgnoreCase("withdrawconfirm"))
			{
				String accountid=request.getParameter("accid");
				
				int balance=Integer.parseInt(request.getParameter("paisa"));
			
				BankingServices1 service1 = new BankingServices1();
				Customer customer = service1.GetAccountDetailsAID(accountid);
				 
				try {
				Account	account=service1.withdrawFrom(accountid, balance);
				RequestDispatcher rd= request.getRequestDispatcher("AccountCrudJsp/WithdrawlSearch.jsp");
				request.setAttribute("customer", customer);
				request.setAttribute("account", account);
				rd.forward(request, response);	
				} catch (BalanceNotSufficientException e) {
					RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/WithdrawalAmount.jsp");
					request.setAttribute("id",accountid);
					request.setAttribute("error", e.getMessage());
					rd.forward(request, response);
				}
				
				
				
			}
		//To Transfer Money
else if(action.equalsIgnoreCase("transfer")){
				
				String aid = request.getParameter("id");
				String cid = request.getParameter("cid");
				

				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/Transfer.jsp");
				request.setAttribute("aid",aid);
				request.setAttribute("cid", cid);
				rd.forward(request, response);
				
			}
		//To transform the amount
			else if(action.equalsIgnoreCase("transferamount")){
				BankingServices1 service1 = new BankingServices1();
				String payAccNo= request.getParameter("payAccNo");
				String benAccNo= request.getParameter("benAccNo");
				int amount=Integer.parseInt(request.getParameter("balance"));
				Customer acct = service1.GetAccountDetailsAID(benAccNo);
				if(acct.getAccount().getAccountId()!=null){
					Customer payCustomer = service1.GetAccountDetailsAID(payAccNo);
					
					if(payCustomer.getAccount().getBalance()>amount){
					
					Account payAccount=service1.payeeTransferTransaction(payAccNo, amount);
					Customer benCustomer = service1.GetAccountDetailsAID(benAccNo);
					Account benAccount=service1.beneficiaryTransferTransaction(benAccNo, amount);
					
					RequestDispatcher rd=request.getRequestDispatcher("AccountCrudJsp/TransferSuccess.jsp");
					request.setAttribute("payAccount", payAccount);
					request.setAttribute("benAccount", benAccount);
					request.setAttribute("payCustomer", payCustomer);
					request.setAttribute("benCustomer", benCustomer);
					rd.forward(request, response);
					}
					
					else{
						RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/Transfer.jsp");
						request.setAttribute("aid", payAccNo);
						request.setAttribute("insufficientbal", "Insufficient Balance, Please Choose amount less than Account Balance");
						rd.forward(request, response);
					}
				}else{
				
					RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/Transfer.jsp");
					request.setAttribute("aaid",payAccNo);
					request.setAttribute("message","Please Enter Valid Benificiary AccNo.");
					rd.forward(request, response);
				}
				}
		//For bank Statement
			else if(action.equalsIgnoreCase("statementfinal"))
			{
				String acctid=request.getParameter("id");
				String custtid=request.getParameter("custid");
				int count=Integer.parseInt(request.getParameter("tnumber"));
			if(count==0){
				BankingServices1 bs=new BankingServices1();
				Customer cs=bs.getStatement(custtid,acctid);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/Statement.jsp");
				request.setAttribute("customer", cs);
				rd.forward(request, response);
			}
			else
			{
				BankingServices1 bs=new BankingServices1();
				Customer cs=bs.getStatementbyNo(custtid, acctid, count);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/Statement.jsp");
				request.setAttribute("customer", cs);
				request.setAttribute("number", count);
				rd.forward(request, response);
			}
				
			}
		//To go back
			else if(action.equalsIgnoreCase("GoBack")){
				
				RequestDispatcher rd = request.getRequestDispatcher("JSP/Intm.jsp");
				rd.forward(request, response);
				
			}
		//Show Account status	
			else if(action.equalsIgnoreCase("showaccountstatus"))
			{
				BankingServices1 services=new BankingServices1();
				ArrayList<AccountStatus> accounts=services.getallAccountStatus();
				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/ViewAccountStatus.jsp");
				request.setAttribute("accounts", accounts);
				rd.forward(request, response);
				
			}
		//Show Customer Status	
			else if(action.equalsIgnoreCase("showcustomerstatus"))
			{
				BankingServices1 services=new BankingServices1();
				ArrayList<CustomerStatus> customers=services.getAllCustomersStatus();
				RequestDispatcher rd = request.getRequestDispatcher("CustomerCrudJsp/ViewCustomerStatus.jsp");
				request.setAttribute("customers", customers);
				rd.forward(request, response);
				
			}
				
			else if(action.equalsIgnoreCase("changepassword"))
			{
				
				String email=request.getParameter("email").toString();
				String oldpass=request.getParameter("oldpass").toString();
				String newpass=request.getParameter("newpass").toString();
				String confirmnewpass=request.getParameter("confirmnewpass").toString();
				Boolean flag=employeeService.changePassword(email,oldpass,newpass,confirmnewpass);
				if(flag)
				{
				RequestDispatcher rd = request.getRequestDispatcher("JSP/SuccessInitiation2.jsp");
				request.setAttribute("message", "Password Changed Successfully");
				rd.forward(request, response);
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("JSP/ChangePassword.jsp");
					request.setAttribute("error", "Error Changing Password");
					rd.forward(request, response);
				}
			}
		
			else if(action.equalsIgnoreCase("forgetpasswordsearch")){
				String email=request.getParameter("email");
				
				boolean flag=employeeService.checkEmail(email);
				
				if(flag){
					String securityQuestion=employeeService.fetchSecurityQuestion(email);
					RequestDispatcher rd=request.getRequestDispatcher("JSP/ForgotPassword.jsp");
					request.setAttribute("securityQ", securityQuestion);
					request.setAttribute("email", email);
					rd.forward(request, response);	
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("JSP/ForgetPasswordSearch.jsp");
					request.setAttribute("error", "Email Id not registered");
					rd.forward(request, response);
				}
				
			}
			else if(action.equalsIgnoreCase("validateanswerquestion")){
				String email=request.getParameter("email");
				String answer=request.getParameter("answer");
				String securityQuestion=request.getParameter("securityQ");
				boolean flag=employeeService.validateAnswer(email, answer);
				
				if(flag){
					RequestDispatcher rd=request.getRequestDispatcher("JSP/ForgetPasswordChange.jsp");
					request.setAttribute("email", email);
					rd.forward(request, response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("JSP/ForgotPassword.jsp");
					request.setAttribute("securityQ", securityQuestion);
					request.setAttribute("error", "Answer did not match");
					request.setAttribute("email",email );
					rd.forward(request, response);
				}
			}
		
			else if(action.equalsIgnoreCase("forgetpasswordchange")){
				String email=request.getParameter("email");
				String newPassword=request.getParameter("newpassword");
				String confirmpassword=request.getParameter("confirmnewpassword");
				boolean flag=employeeService.changeForgetPassword(email, newPassword,confirmpassword);
				if(flag)
				{
					RequestDispatcher rd=request.getRequestDispatcher("JSP/SuccessInitiation2.jsp");
					request.setAttribute("message6", "Password Changed Successfully");
					rd.forward(request, response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("JSP/ForgetPasswordChange.jsp");
					request.setAttribute("error", "Password not matched!");
					request.setAttribute("email",email );
					rd.forward(request, response);
				}
				
				
			}else if(action.equalsIgnoreCase("home"))
			{
				if(session.getAttribute("type").toString().equalsIgnoreCase("cashier"))
				{
					response.sendRedirect("JSP/Intm.jsp");
				}
				else if(session.getAttribute("type").toString().equalsIgnoreCase("executive"))
				{
					response.sendRedirect("JSP/WelcomeE.jsp");

				}
			}
			else if(action.equalsIgnoreCase("statement"))
			{
				String acctid=request.getParameter("id");
				String custtid=request.getParameter("custid");
				BankingServices1 bs=new BankingServices1();
				Customer cs=bs.getStatement(custtid,acctid);
				RequestDispatcher rd = request.getRequestDispatcher("JSP/StatementIntm.jsp");
				request.setAttribute("customer", cs);
				rd.forward(request, response);
			}
			else if(action.equalsIgnoreCase("searchstatusbyacc"))
			{
				String accid=request.getParameter("accountno");
				BankingServices1 services=new BankingServices1();
				AccountStatus account=services.getaccountStatusbyID(accid);
				RequestDispatcher rd = request.getRequestDispatcher("AccountCrudJsp/ViewAccountStatus.jsp");
				request.setAttribute("account", account);
				rd.forward(request, response);
				
			}
		
		}
	}

