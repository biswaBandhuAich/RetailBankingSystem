<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
<title>ABC BANK | Success Page</title>
</head>
<body>
<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
			<%String custId = (String) request.getAttribute("Customer");%>
			<%String message = (String) request.getAttribute("message");%>
			<%String accId = (String) request.getAttribute("AccountId");%>
			<%String Id = (String) request.getAttribute("ID");%>
			<%String deletemsg = (String) request.getAttribute("deleted");%>
			<%String acctype = (String) request.getAttribute("type");%>
<% if(message !=null){%>
		
		<h2 style="color:green"><%=message %></h2>
		
		
		<%} %>
		<% if(Id !=null){%>
		
		<h2 style="color:green">Customer Deletion Initiated Successfully with <%=Id %>.</h2>
		
		
		<%} %>
		<% if(custId !=null){%>
		
		<h2 style="color:green">Customer Registered with Customer ID:<%=custId %>. Thank You for choosing us.Welcome to ABC Bank. </h2>
		
		
		<%} %>
		<% if(accId !=null){%>
		
		<h2 style="color:green"><%=acctype%> account created with ID:<%=accId %></h2>
		
		
		<%} %>
		<% if(deletemsg !=null){%>
		
		<h2 style="color:green"><%=deletemsg %></h2>
		
		
		<%} %>
		
		<center>
		<a href="<%=request.getContextPath()%>/BankingControlServlet?action=home"><button class="button">Home</button></a>
		</center>
		</div>
				<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
		
		</div>
</body>
</html>