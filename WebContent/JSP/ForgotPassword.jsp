<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | ForgotPassword</title>
</head>
<body>
<%String securityQ=(String)request.getAttribute("securityQ"); 
String email=(String)request.getAttribute("email");
String error=(String)request.getAttribute("error");
%>
<div class="site">
<div class="header"><%@include file="/JSP/Header.jsp"%></div>
<div class="main">

<%if(error!=null){%>
<h3 align="center" style="color:red;"><%=error%></h3>
<%}%>

<h1 align="center">Forgot Password</h1>
<form action="<%=request.getContextPath()%>/BankingControlServlet" method="post">

<table align="center">
<tr><th>Email:</th><th><input type="text" name="email" value=<%=email%> readonly></th></tr>
<tr><th>Answer your security question:</th><th><input type="text" name="securityQ" value="<%=securityQ%>" readonly/></th></tr>
<tr><th>Your Answer:</th><th><input type="text" name="answer" required></th></tr>
</table>
<center><button class="button" type="submit" name="action" value="validateanswerquestion">Change Password</button>
<button class="button" type="submit" name="action" value="goback">Go Back</button></center>

</form>

</div>
<div class="footer"><%@ include file = "footer.jsp"%></div>
</div>
</body>
</html>