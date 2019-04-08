
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="prs.indv.RetailBanking.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/png"
	href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/Epoc.css">
</head>
<body>
	<%
		Customer cust = (Customer) request.getAttribute("customer");
	%>
	<div class="site">
		<div class="header"><%@ include file="Header.jsp"%></div>
		<div class="main">
			<center>
				<h1>Bank Statement</h1>
			</center>
			
<table  align="center">
<tr>
<td>Name:</td><td> </td><td><%=cust.getFirstName()+" "+cust.getLastName()%></td>
</tr>
<tr>
<td>Customer Id:</td><td> </td><td><%=cust.getCustomerId()%></td>
</tr>
<tr>
<td>Account Number:</td><td> </td><td><%=cust.getAccount().getAccountId()%></td>
</tr>
</table>
			<center>
			<form action="<%=request.getContextPath()%>/BankingControlServlet?action=statementfinal&custid=<%=cust.getCustomerId()%>&id=<%=cust.getAccount().getAccountId()%>" method="post">
			Select the number of Transactions you want to see
			<select name="tnumber">
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="0">All</option>
			</select>
			<br><br>
			
			
				<a href="<%=request.getContextPath()%>/BankingControlServlet?action=GoBack"><Button
						name="action" class="button" value="GoBack">GoBack</Button></a>
				<input type=submit class="button" value="Submit">
				
			</form>
			</center>
		</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>
</body>
</html>