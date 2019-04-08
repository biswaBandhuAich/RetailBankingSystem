<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("/JSP/ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}
%>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
%>
<%@page import="prs.indv.RetailBanking.bean.Customer"%>
<%@page import="prs.indv.RetailBanking.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/JSP/Intm.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<title>ABC BANK | Transfer Success</title>
</head>
<body>
	<%
		Customer payCustomer = (Customer) request.getAttribute("payCustomer");
		Account payAccount = (Account) request.getAttribute("payAccount");
		Customer benCustomer = (Customer) request.getAttribute("benCustomer");
		Account benAccount = (Account) request.getAttribute("benAccount");
	%>
<div class="site">
<div class="header"><%@include file="/JSP/Header.jsp"%></div>
<div class="main">
<center><h1>Transfer Successful</h1>
										<h2>Redirecting please wait dont refresh</h2>
</center>
<table id="customers" align="center">
			<tr>
				<td>Payee Customer Id:</td>
				<td><%=payCustomer.getCustomerId()%></td>
			</tr>
			<tr>
				<td>Payee Customer Name:</td>
				<td><%=payCustomer.getFirstName() + " " + payCustomer.getLastName()%></td>
			</tr>
			<tr>
				<td>Payee Account Id:</td>
				<td><%=payAccount.getAccountId()%></td>
			</tr>
			<tr>
				<td>Payee Account Type:</td>
				<td><%=payAccount.getAccount_type()%></td>
			</tr>
			<tr>
				<td>Balance Before Transfer:</td>
				<td>Balance After Transfer</td>
			</tr>
			<tr>
				<td name="search">Rs <%=payCustomer.getAccount().getBalance()%></td>
				<td name="search">Rs <%=payAccount.getBalance()%></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<table id="customers" align="center">
			<tr>
				<td>Beneficiary Customer Id:</td>
				<td><%=benCustomer.getCustomerId()%></td>
			</tr>
			<tr>
				<td>Beneficiary Customer Name:</td>
				<td><%=benCustomer.getFirstName() +" " + benCustomer.getLastName()%></td>
			</tr>
			<tr>
				<td>Beneficiary Account Id:</td>
				<td><%=benAccount.getAccountId()%></td>
			</tr>
			<tr>
				<td>Beneficiary Account Type:</td>
				<td><%=benAccount.getAccount_type()%></td>
			</tr>
			<tr>
				<td>Balance Before Transfer:</td>
				<td>Balance After Transfer</td>
			</tr>
			<tr>
				<td>Rs <%=benCustomer.getAccount().getBalance()%></td>
				<td>Rs <%=benAccount.getBalance()%></td>
			</tr>

		</table>
		
		<center>
		</center>
</div>
<div class="footer"><%@ include file = "/JSP/footer.jsp"%></div>
	
	</div>
</body> 
</html>