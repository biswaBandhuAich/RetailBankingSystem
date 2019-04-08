<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABC BANK | Contact Support</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
</head>
<body>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
		<center><h1>Contact Us</h1><br><h3>Report any issue in the below mentioned contact</h3></center>
		<table align="center">
		<tr><th>Email:</th><th><input type="text" value="biswa.aich@abcbank.com" readonly></th></tr>
		<tr><th>Phone:</th><th><input type="text" value="1234567890"readonly></th></tr>
		<tr><th>Address:</th><th><textarea>Kolkata</textarea></th></tr>
		</table>.
		<center><button class="button" type="submit" onclick="window.history.back()">Go Back</button></center>
		</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>

</body>
</html>