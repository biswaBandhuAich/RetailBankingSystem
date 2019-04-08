<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}
else if(session.getAttribute("type").toString().equalsIgnoreCase("executive"))
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not Allowed");
	rd.forward(request,response);
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="prs.indv.RetailBanking.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/firstval.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Welcome.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK| Cashier Login</title>
</head>
<body> 
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
%>
<%
if(session.getAttribute("id")==null)
{
	response.sendRedirect("index.jsp");	
}
%>
<% Customer c=(Customer)request.getAttribute("Customer"); %>
<div class="site">

<div class="header"><%@include file="Header.jsp"%>
</div>

<div class="lside"></div>

<div class="main">
<center>
<center><h2>Account Details</h2></center>
<table>
<tr>
<td>Customer Id:</td><td><%=c.getCustomerId()%></td>
</tr>
<tr>
<td>Name:</td><td><%=c.getFirstName()+" "+c.getLastName()%></td>
</tr>
<tr>
<td>Account Id:</td><td><%=c.getAccount().getAccountId()%></td>
</tr>
<tr>
<td>Account Type:</td><td><%=c.getAccount().getAccount_type()%></td>
</tr>
<tr>
<td>Account Balance:</td><td>Rs <%=c.getAccount().getBalance()%></td>
</tr>
</table>
<div class="myDIV3">
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=deposit&id=<%=c.getAccount().getAccountId()%>&cid=<%=c.getCustomerId()%>"><button class="button"><span>Deposit</span></button></a>
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=withdrawamt&id=<%=c.getAccount().getAccountId()%>&cid=<%=c.getCustomerId()%>"><button class="button"><span>Withdraw</span></button></a><br>
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=transfer&id=<%=c.getAccount().getAccountId()%>&cid=<%=c.getCustomerId()%>"><button class="button"><span>Transfer</span></button></a>
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=statement&id=<%=c.getAccount().getAccountId()%>&cid=<%=c.getCustomerId()%>"><button class="button"><span>Bank Statement</span></button></a><br>
<center><a href="<%=request.getContextPath()%>/BankingControlServlet?action=GoBack"><Button name="action" class="button" value="GoBack">GoBack</Button></a></center>

</div>

</center>


<div class="maindiv">

</div>
</div>
<div class="rside"></div>
<div class="footer"><%@ include file = "footer.jsp"%>
</div>
</div>

</body>

</html>
