<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("/JSP/ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}
else if(session.getAttribute("type").toString().equalsIgnoreCase("cashier"))
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not Allowed");
	rd.forward(request,response);
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="prs.indv.RetailBanking.bean.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | View Customer Search</title>
</head>
<body>
<%
					ArrayList<CustomerStatus> customers = (ArrayList<CustomerStatus>) request.getAttribute("customers");
				%>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				
						<center><h1>All Customer Status</h1></center>
				<table align="center" id="customers">
					<tr>
						<th>SSNID</th>
						<th>CustomerID</th>
						<th>Status</th>
						<th>Message</th>
						<th>LastUpdated</th>
					</tr>

					<%
						for (CustomerStatus cust : customers) {
					%>
					<tr>
						<td><%=cust.getSsnID()%></td>
						<td><%=cust.getCustomerId()%></td>
						<%if(cust.getStatus().equalsIgnoreCase("created")){ %>
						<td><font color="green"><%=cust.getStatus()%></td>
						<%}else if(cust.getStatus().equalsIgnoreCase("deleted")){ %>
						<td><font color="red"><%=cust.getStatus()%></td>
						<%}else if(cust.getStatus().equalsIgnoreCase("updated")){ %>
						<td><font color="blue"><%=cust.getStatus()%></td>
						<%} %>
						<td><%=cust.getMessage()%></td>
						<td><%=cust.getLastupdated()%></td>
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