<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("/JSP/ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="prs.indv.RetailBanking.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/Epoc.css">
</head>
<body>
<%
Customer cust=(Customer)request.getAttribute("customer");
%>
<%int count=(Integer)request.getAttribute("number"); %>
<div class="site">
<div class="header"><%@ include file="Header.jsp" %></div>
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
<table align="center" id="customers">
<% if(cust.getAccount().getTransacionList().size()<count){%>
<center>
<h4 style="color:red">You have only <%=cust.getAccount().getTransacionList().size()%> transactions.</h4>
</center>
<% } %>
<tr>
<th>Transaction Id</th>
<th>Transaction Type</th>
<th>Transaction Amount(Rs)</th>
<th>Transaction Date</th>
<th>Balance(Rs)</th>
</tr>
<%for(Transaction trsn:cust.getAccount().getTransacionList()) 
{%>
<tr>
<td><%=trsn.getTransactionid()%></td>
<td><%=trsn.getTransactionType().toUpperCase()%></td>
<td><%=trsn.getAmount()%></td>
<td><%=trsn.getDate()%></td>
<td><%=trsn.getLedgerBalance()%></td>
</tr>
<%} %>
</table>
<center><a href="<%=request.getContextPath()%>/BankingControlServlet?action=GoBack"><Button name="action" class="button" value="GoBack">GoBack</Button></a>
	<button class="button" onclick="window.print()">Print</button>
	</center>
</div> 
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

</div>
</body>
</html>