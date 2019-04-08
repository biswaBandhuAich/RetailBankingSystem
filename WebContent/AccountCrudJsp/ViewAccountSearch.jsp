<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
<title>ABC BANK| | View Account Search</title>
<script type="text/javascript" src="js/firstval.js"></script>
</head>
<body>
<% 

	String message = (String)request.getAttribute("message");

%>
<center>
<%if(message!=null){ %>
<marquee><h2 style="color:red"><%=message %></h2></marquee>
<% }%>
</center>

	<div class="site">
<div class="main">
		<h2>Enter the Account Number to view details:</h2>
		<form action="<%=request.getContextPath()%>/BankingControlServlet?action=viewaccountsearch"
			method="post">
			Account Number: <input type="text" name="accountno" required "><br>
			<h2>Account Type</h2>
			<br> <select name="type">
				<option value="Current" default>Current Account</option>
				<option value="Savings">Savings Account</option>
			</select><br>
			<button type="submit" name="submit" value="submit">View Account Details</button>
		</form>
		</div>
</div>
	</center>
</body>
</html>