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
<%@ page import="prs.indv.RetailBanking.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>Insert title here</title>


</head>
<body>

	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				<%
					Customer customer = (Customer) request.getAttribute("Customer");
				%>

				<h2 align="center">Enter the details to be updated:</h2>
				<form action="<%=request.getContextPath()%>/BankingControlServlet"
					method="post">
					<table align="center">
						<tr>
							<td>Customer SSN ID:</td>
							<td><input type="text" name="ssnID"
								value=<%=customer.getCustomerSSN()%> readonly ></td>
						</tr>
						<tr>
							<td>Customer ID:</td>
							<td><input type="text" name="cid"
								value=<%=customer.getCustomerId()%> readonly ></td>
						</tr>
						<tr>
							<td>First Name+Middle Name:</td>
							<td><input type="text" name="firstname"
								value="<%=customer.getFirstName()%>"></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" name="lastname"
								value=<%=customer.getLastName()%>></td>
						</tr>
						
						<tr>
							<td>Age:</td>
							<td><input type="text" name="age"
								value=<%=customer.getAge()%>></td>
						</tr>
						<tr>
							<td>Gender:</td>
							<%if(customer.getGender().equalsIgnoreCase("Male") ) {%>
							<td><input type="radio" name="gender" value="Male" checked>Male
							<input type="radio" name="gender" value="Female" >Female</p>
							</td>
							<%}else{%>
							<td><input type="radio" name="gender" value="Male" >Male
							<input type="radio" name="gender" value="Female" checked>Female</p>
							</td>
							
							<%} %>
						</tr>
							<tr>
							<td>Phone No:</td>
							<td><input type="text" id="phno" name="phno" value=<%=customer.getNumber()%>
								pattern="[0-9]+" ></p></td>
						</tr>
						<tr>
							<td>Address Line 1:</td>
							<td><input type="text" name="addressl1"
								value="<%=customer.getAddressLine1()%>"></td>
						</tr>
						<tr>
							<td>Address Line 2:</td>
							<td><input type="text" name="addressl2"
								value="<%=customer.getAddressLine2()%>"></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" name="city"
								value="<%=customer.getCity()%>"></td>
						</tr>
						<tr>
							<td>State:</td>
							<td><input type="text" name="state"
								value="<%=customer.getState()%>"></td>
						</tr>
						<tr>
							<td><button class="button" type="submit" name="action" value="home">Cancel Update</button></td>
							<td><button class="button" type="submit" name="action" value="updatedetails">UpdateDetails</button></td>
							</tr>
					</table>
				</form>


			</div>
		</center>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>

</body>
</html>