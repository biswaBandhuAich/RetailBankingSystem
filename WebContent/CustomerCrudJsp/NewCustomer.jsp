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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
	<title>ABC BANK | New Customer</title>
</head>
<body>
<script>
	function validate1()
	{
	fname = document.getElementById("fname").value;
	lname = document.getElementById("lname").value;
	age = document.getElementById("aage").value; 
	addl1 = document.getElementById("addl1").value;
	addl2 = document.getElementById("addl2").value;
	city = document.getElementById("city").value;
	state = document.getElementById("state").value;
	ssn = document.getElementById("ssn").value;
	phno=docuemnt.getElementById("phno").value;
	
	
	
	if(isNaN(age))
		{
			alert("Please Enter Valid Input!!");
			return false;
		}
	if(age<0)
		{
			alert("Age cannot be Negative!!!");
			return false;
		}
	if(age>130)
		{
			alert("Please Enter valid Age!!!");
			return false;
		}
	if(age<18)
		{
			alert("Minimum Age must be 18!!");
			return false;
		}
	if(phno.length>10)
		{
		alert("Phone No is of 10 Digits");
		return false;
		}
	if(ssn == "")
		{
			alert(" SSN Field Cannot be Blank!!!!");
			return false;
		}
	if(ssn.length>8)
		{
			alert("Please Enter a Valid SSNID!!!");
			return false;
		}
	if(!isNaN(ssn))
		{
			alert("Please Enter a valid SSNID!!!");
			return false;
		}
	if(!isNaN(city))
		{
		alert("Please Enter A Valid City!!");
		return false;
		}
	if(!isNaN(state))
	{
	alert("Please Enter A Valid State!!");
	return false;
	}

	return true;

	}
</script>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
			<center><h1>Enter Customer Details</h1></center>
				<form name="newcust"
					action="<%=request.getContextPath()%>/BankingControlServlet?action=newcustomer"
					method="post">

					<table align="center" style="padding-top: 8%;">
						<tr>
							<td>First Name+Middle Name:</td>
							<td><input type="text" name="fname" required placeholder="Enter FirstName"
								pattern="[(A-Za-z).( )]+" id="fname"></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" name="lname" required placeholder="Enter LastName"
								pattern="[(A-Za-z).( )]+" id="lname"></td>
						</tr>
						<tr>
							<td>Age:</td>
							<td><input type="number" id="aage" name="age" required placeholder="Enter Age"
								pattern="[0-9]+" ></p></td>
						</tr>
						<tr>
							<td>Gender:</td>
							<td><input type="radio" name="gender" value="Male" checked>Male
							<input type="radio" name="gender" value="Female" >Female</p>
							</td>
						</tr>
							<tr>
							<td>Phone No:</td>
							<td><input type="text" id="phno" name="phno" required placeholder="Enter PhoneNo"
								pattern="[0-9]+" ></p></td>
						</tr>
						<tr>
							<td>Address Line1</td>
							<td><input type="text" name="addl1" required id="addl1" placeholder="Address Line 1"></td>
						</tr>
						<tr>
							<td>Address Line2</td>
							<td><input type="text" name="addl2"required id="addl2" placeholder="Address Line 2"></td>
						</tr>
						<tr>
							<td>City</td>
							<td><input type="text" name="city" required placeholder="Enter City"
								pattern="[(A-Za-z).( )]+" id="city"></td>
						</tr>
						<tr>
							<td>State</td>
							<td><input type="text" name="state" required placeholder="Enter State"
								pattern="[(A-Za-z).( )]+" id="state"></td>
						</tr>
						<tr>
							<td>SSNID Type</td>
							<td><select name="ssnidtype" >
									<option value="passport" default>Passport</option>
									<option value="voterid">Voter Id</option>
									<option value="drivinglsc">Driving Liscense</option>
									<option value="pan">Pan Card</option>
							</select></td>
						</tr>
						<tr>
							<td>SSN Number</td>
							<td><input type="text" name="ssnno" id="ssn" required placeholder="Enter SSN No"></td>
						</tr>
					</table>

					<center><input type="submit" class="button" value="Register" onclick="return validate1()"></center>
				</form>
			</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
	</div>

</body>
</html>