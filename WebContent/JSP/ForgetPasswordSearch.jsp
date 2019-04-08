<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">


<title>ABC BANK | Forget Password Search</title>
</head>
<body>

<div class="site">
<div class="header"><%@include file="Header.jsp"%></div>
<div class="main">
<%String error=(String)request.getAttribute("error");
if(error!=null){%>
<h3 align="center" style="color:red;"><%=error%></h3>
<%} %>
<form action="<%=request.getContextPath()%>/BankingControlServlet" method="post">
<h3 align="center">Enter your email Id to change password</h3>
<table align="center">
<tr><th>Email:</th><th><input type="email" name="email" required></th></tr>
</table>
<center><button class="button" type="submit" name="action" value="forgetpasswordsearch">Reset Password</button></center>
</form>
</div>
<div class="footer"><%@ include file = "footer.jsp"%>

</div>
</div>
</body>
</html>