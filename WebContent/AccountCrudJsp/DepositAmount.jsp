<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="prs.indv.RetailBanking.bean.Account"%>
<%@ page import="prs.indv.RetailBanking.bean.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/JSP/Intm.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Amount To Be Deposited</title>
</head>
<body>
		<%
		Customer cust = (Customer) request.getAttribute("customer");
		Account acc = (Account) request.getAttribute("account");
		final int balancebefdep=cust.getAccount().getBalance();
		%>
		<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
						<center><h1>Amount Deposited Successfully</h1>
						<h2>Redirecting please wait dont refresh</h2>
						</center>
			
				<table align="center">
					<tr>
						<td>Customer Id:</td>
						<td><input type="text" name="CustomerId"
							value="<%=cust.getCustomerId()%>" readonly></td>
					</tr>
					<tr>
						<td>Customer Name:</td>
						<td><input type="text" name="CustomerName"
							value="<%=cust.getFirstName() + " " + cust.getLastName()%>"
							readonly></td>
					</tr>

					<tr>
						<td>Account Id:</td>
						<td><input type="text" name="AccountId"
							value="<%=acc.getAccountId()%>" readonly></td>
					</tr>
					<tr>
					<tr>
						<td>Account Type:</td>
						<td><input type="text" name="Accounttype"
							value="<%=acc.getAccount_type()%>" readonly></td>
					</tr>
					<tr>
						<td>Balance before deposit:</td>
						<td><input type="text" name="balance"
							value="<%=+balancebefdep%>" readonly></td>
					</tr>


					<tr>
						<td>Total Balance:</td>
						<td><input type="text" name="balance"
							value="<%=acc.getBalance()%>" readonly></td>
					</tr>



				</table>
					<center><h4>Amount Deposited Successfully</h4></center>
				
				 
			<center><a href="<%=request.getContextPath()%>/BankingControlServlet?action=GoBack"><Button name="action" class="button" value="GoBack">GoBack</Button></a></center>
			</div>
			
				<div class="footer"><%@ include file = "/JSP/footer.jsp"%>
			
		</div>
		</div>

</body>
</html>