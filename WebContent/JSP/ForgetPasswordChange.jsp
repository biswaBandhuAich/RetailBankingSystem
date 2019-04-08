<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Forget Password Change</title>
</head>
<body>
<%
String error=(String)request.getAttribute("error");
%>
<div class="site">
<% 
String message = (String)request.getAttribute("error");
%>
<div class="header"><%@include file="Header.jsp"%></div>
<div class="main">
<%
if(error!=null){%>
<center><h3><%=error%></h3></center> 
<%}%>

<%String email=(String)request.getAttribute("email"); %>

<form action="<%=request.getContextPath()%>/BankingControlServlet" method="post">
<h1 align="center">Enter New Password</h1>
<table align="center">
<tr><td>Email:</td><td><input type="text" name=email value=<%=email%> readonly></td></tr>
<tr><td>New Password:</td><td><input type="password" name="newpassword"></td></tr>
<tr><td>Confirm New Password:</td><td><input type="password" name="confirmnewpassword"></td></tr>
</table>
<center><button class="button" type="submit" name="action" value="forgetpasswordchange">Reset Password</button></center>
</form>

</div>
<div class="footer"><%@ include file = "footer.jsp"%>
</div>
</div>
</body>
</html>