<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="prs.indv.RetailBanking.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | View Account Status</title>
</head>
<body>
<%
					ArrayList<AccountStatus> accounts = (ArrayList<AccountStatus>) request.getAttribute("accounts");
				%>
				<%AccountStatus account=(AccountStatus)request.getAttribute("account"); %>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		
			<div class="main">
				
	<center><h1>All Account Status</h1></center>
	<center>
	<%-- <form action="<%=request.getContextPath()%>/BankingControlServlet?action=searchstatusbyacc" method="post">
	<h3>Enter Account No:<input type="text" name="accountno"></h3>
	<input type="submit" value="Search"></form> --%>
	</center>
	
				
				<br><br>
				<table id="customers" align="left">
					<tr>
						<th>CustomerID</th>
						<th>AccountID</th>
						<th>AccountType</th>
						<th>Status</th>
						<th>Message</th>
						<th>LastUpdated</th>
					</tr>
					<%-- <%if(account.getAccountId()!=null){ %>
						<tr>
						<td><%=account.getCustomerId()%></td>
						<td><%=account.getAccountId()%></td>
						<td><%=account.getAcctype()%></td>
						<%if(account.getStatus().equalsIgnoreCase("active")) {%>
						
						<td><font color="green"><%=account.getStatus()%></td>
						<%} else if(account.getStatus().equalsIgnoreCase("inactive")){ %>
						<td><font color="red"><%=account.getStatus()%></td>
						<%}else if(account.getStatus().equalsIgnoreCase("updated")){ %>
						<td><font color="blue"><%=account.getStatus()%></td>
						<%} %>
						<td><%=account.getMessage()%></td>
						<td><%=account.getLastupdated()%></td>
						</tr>
					
					
					<%}else{ %>
					<% --%>
						<% for (AccountStatus acc : accounts) 
						{
					%>
					<tr>
						<td><%=acc.getCustomerId()%></td>
						<td><%=acc.getAccountId()%></td>
						<td><%=acc.getAcctype()%></td>
						<%if(acc.getStatus().equalsIgnoreCase("active")) {%>
						
						<td><font color="green"><%=acc.getStatus()%></td>
						<%} else if(acc.getStatus().equalsIgnoreCase("inactive")){ %>
						<td><font color="red"><%=acc.getStatus()%></td>
						<%}else if(acc.getStatus().equalsIgnoreCase("updated")){ %>
						<td><font color="blue"><%=acc.getStatus()%></td>
						<%} %>
						<td><%=acc.getMessage()%></td>
						<td><%=acc.getLastupdated()%></td>
					</tr>
					<%
						
					}
					%>

				</table>
				<center>
				<a href="<%=request.getContextPath()%>/BankingControlServlet?action=home"><button class="button">Home</button></a>
				</center>
			</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>
</body>
</html>