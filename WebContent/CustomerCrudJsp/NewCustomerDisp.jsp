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
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="prs.indv.RetailBanking.bean.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | Verify</title>


</head>

<body>

	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				<form name="newcustfinal"
					action="<%=request.getContextPath()%>/BankingControlServlet"
					method="post">
					<%
						Customer a = (Customer) request.getAttribute("Customer");
					%>
					<center><h1>Verify before submitting</h1></center>
					<table align="center">
					<tr><th>SSIN ID:</th><th><input type="text" name="ssnno" value="<%=a.getCustomerSSN()%>" readonly></th></tr>
					<tr><th>First Name+Middle Name:</th><th><input type="text" name="fname" value="<%=a.getFirstName()%>"readonly></th></tr>
					<tr><th>Last Name:</th><th><input type="text" name="lname" value="<%=a.getLastName()%>" readonly></th></tr>
					<tr><th>Age:</th><th><input type="text" name="age" value="<%=a.getAge()%>" pattern="[0-9]{,3}+"readonly></th></tr>
					<tr><th>PhoneNumber:</th><th><input type="text" name="phno" value="<%=a.getNumber()%>" readonly></th></tr>
					<tr><th>Gender:</th><th><input type="text" name="gender" value="<%=a.getGender()%>" readonly></th></tr>
					<tr><th>Address Line1:</th><th><input type="text" name="addl1" value="<%=a.getAddressLine1()%>" readonly></th></tr>
					<tr><th>Address Line2:</th><th><input type="text" name="addl2" value="<%=a.getAddressLine2()%>" readonly></th></tr>
					<tr><th>City:</th><th><input type="text" name="city" value="<%=a.getCity()%>" readonly></th></tr>
					<tr><th>State:</th><th><input type="text" name="state" value="<%=a.getState()%>" readonly></th></tr>
					</table>
									<center><button class="button" type="submit" name="action" value="newcustomercreated">Register</button>
									
				</form>
				<button class="button" type="submit" name="action" value="home">Cancel</button></center>
				<script>
					function goback() 
					{
						window.history.back();
					}
				</script>
			</div>
		</center>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>

</body>
</html>