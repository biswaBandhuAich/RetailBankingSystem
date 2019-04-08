<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("/JSP/ErrorPage.jsp");
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

<title>ABC BANK | ChangePassword</title>
</head>
<body>
<% 
String error=(String)request.getAttribute("error");
%>
<div class="site">
<div class="header"><%@include file="/JSP/Header.jsp"%></div>
<div class="main">
<h1 align="center">Change Password</h1>
<%if(error!=null){%>
<h1 align="center"><%=error%></h1>
<%} %>
<form action="<%=request.getContextPath()%>/BankingControlServlet?action=changepassword" method="post">
<p align="center" style="color:red">Password must consist of minimum 8 characters,alphanumeric and one capital letter</p>
<table align="center">
<tr><th>Enter Email ID:</th><th><input type="email" name="email" /></th></tr>
<tr><th>Enter Old Password:</th><th><input type="password" name="oldpass"></th></tr>
<tr>Password must consist of minimum 8 characters,alphanumeric and one capital letter</tr>
<tr><th>Enter New Password:</th><th><input type="password" name="newpass"></th></tr>
<tr><th>Confirm New Password:</th><th><input type="password" name="confirmnewpass"></th></tr>

</table>
<center><input type="submit" value="Change Password"><button class="button">Go Back</button></center>

</form>
</div>
<div class="footer"><%@ include file = "footer.jsp"%></div>
</div>
</body>
</html>