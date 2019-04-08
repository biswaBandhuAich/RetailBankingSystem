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
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/firstval.js"></script>
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Delete Account</title>
</head>
<body>

	<%
		ArrayList<Account> accounts=(ArrayList<Account>)request.getAttribute("accounts"); 
	%>
	<center>
	<div class="site">
<div class="main">
		
			<h3>Account Details</h3>
			<table id="customers">
				<tr>
				<th>Account No</th>
				<th>Account Type</th>
				<th>Action</th>
				</tr>
				<tr>
				<%for(Account acc:accounts){ %>
					<td><%=acc.getAccountId() %></td>
					<td><%=acc.getAccount_type() %></td>
					<td><a href="<%=request.getContextPath()%>/BankingControlServlet?action=deleteconfirm&accid=<%=acc.getAccountId()%>">Delete</a></td>
				</tr>
					<%} %>
			</table>
		
		</div>
</div>
	</center>
</body>
</html>