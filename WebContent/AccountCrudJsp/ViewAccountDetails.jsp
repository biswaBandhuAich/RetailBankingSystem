<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="prs.indv.RetailBanking.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Insert title here</title>
</head>
<body>
	<%
		Customer customer = (Customer) request.getAttribute("customer");
	%>
	<center>
	<div class="site">
<div class="main">
		<form action="<%=request.getContextPath()%>/BankingControlServlet" method="post">
			<table id="customers">
				<tr>
				<td>First Name</td>
				<td><input type="text" name="fname" value="<%=customer.getFirstName() %>"></td>
				</tr>
				<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname" value="<%=customer.getLastName()%>"></td>
				</tr>
				<tr>
					<td>Account Number:</td>
					<td><input type="text" name="accnum" value="<%=customer.getAccount().getAccountId() %>"></td>
				</tr>
				<tr>
					<td>Account Type:</td>
					<td><input type="text" name="acctype" value="<%=customer.getAccount().getAccount_type() %>"></td>
				</tr>
				<tr>
					<td>Status:</td>
					<td><input type="text" name="acctstatus" value="<%=customer.getAccount().getStatus() %>"></td>
				</tr>
				<tr>
					<td>Balance:</td>
					<td><input type="text" name="balance" value="<%=customer.getAccount().getBalance() %>"></td>
				</tr>
			</table>
			<button type="submit" name="action" value="goback">Go Back</button>
		</form>
		</div>
</div>
	</center>
</body>
</html>