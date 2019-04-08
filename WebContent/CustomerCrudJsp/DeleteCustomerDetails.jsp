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
%><%@page import="prs.indv.RetailBanking.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | Delete Customer Details</title>
</head>
<body>

	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				<%
					Customer customer = (Customer) request.getAttribute("Customer");
				%>
					<form
						action="<%=request.getContextPath()%>/BankingControlServlet?CustomerId=<%=customer.getCustomerId()%>"
						method="post">

						<table align="center">
							<tr>
								<td>CustomerSSN :</td>
								<td><input type="text" name="CustomerSSN"
									value=<%=customer.getCustomerSSN()%> readonly="readonly" disabled></td>
							</tr>
							<tr>
								<td>CustomerId :</td>
								<td><input type="text" name="CustomerId"
									value=<%=customer.getCustomerId()%> readonly="readonly" ></td>
							</tr>
							<tr>
								<td>FirstName :</td>
								<td><input type="text" name="FirstName"
									value="<%=customer.getFirstName()%>" readonly="readonly" disabled>
								<td>
							</tr>
							<tr>
								<td>LastName :</td>
								<td><input type="text" name="LastName"
									value=<%=customer.getLastName()%> readonly="readonly" disabled></td>
							</tr>
							<tr>
								<td>Age :</td>
								<td><input type="text" name="Age"
									value=<%=customer.getAge()%> readonly="readonly" disabled></td>
							</tr>
								<tr>
							<td>Gender:</td>
							<%if(customer.getGender().equalsIgnoreCase("Male") ) {%>
							<td><input type="radio" name="gender" value="Male" checked disabled>Male
							<input type="radio" name="gender" value="Female" disabled>Female</p>
							</td>
							<%}else{%>
							<td><input type="radio" name="gender" value="Male" disabled>Male
							<input type="radio" name="gender" value="Female" checked disabled>Female</p>
							</td>
							
							<%} %>
						</tr>
							<tr>
							<td>Phone No:</td>
							<td><input type="text" id="phno" name="phno" value=<%=customer.getNumber()%>
								pattern="[0-9]+" disabled></p></td>
						</tr>
							<tr>
								<td>AddressLine1 :</td>
								<td><input type="text" name="AddressLine1"
									value="<%=customer.getAddressLine1()%>" readonly="readonly" disabled></td>
							</tr>
							<tr>
								<td>AddressLine2 :</td>
								<td><input type="text" name="AddressLine2"
									value="<%=customer.getAddressLine2()%>" readonly="readonly" disabled></td>
							</tr>
							<tr>
								<td>City :</td>
								<td><input type="text" name="City"
									value="<%=customer.getCity()%>" readonly="readonly" disabled></td>
							</tr>
							<tr>
								<td>State</td>
								<td><input type="text" name="State"
									value="<%=customer.getState()%>" readonly="readonly" disabled></td>
							</tr>
						</table>
						<button class="button" type="submit" name="action" value="delete">Delete</button>
						<button class="button" type="submit" name="action" value="home">Cancel</button>
					</form>
					
					<script>
function goback()
{
	window.history.back();
}
</script>
			</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>

</body>
</html>