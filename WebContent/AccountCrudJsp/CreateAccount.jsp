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

<title>ABC BANK| New User</title>
</head>
<body>
<script>
function validate()
{
	 custid = document.getElementById("custid").value;
	 amt = document.getElementById("amt").value;
	 type = document.getElementById("type").value;
	 
	if(custid == "")
		{
			alert("Field Cannot be Blank!!");
			return false;
		}
	if(custid.length>8 || custid.length<8 )
		{ 
			alert("CustomerId Must be 8 in Length!!! ");
			return false;
		}
	if(isNaN(custid))
		{
			alert("CustomerId Must be Integers Only!!!!");
			return false;
		}
	if(amt == "")
		{
			alert("Field Cannot be Blank!!!");
			return false;
		}
	if(amt.length>8)
		{
			alert("Enter the amount within the Specified Limit!!");
			return false;
		}
	if(amt<0)
		{
			alert("Please enter a Positive value!!!");
			return false;
		}
	if(amt == 0)
		{
			alert("Amount Should be Greater than 0!!!");
			return false;
		}
	if(amt<500)
		{
			alert("Minimum Balance Must be 500!!");
			return false;
		}
	return true;
	
}
</script>




	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
		<form action="<%=request.getContextPath()%>/BankingControlServlet" method="post">
			<center><h1>Open new Account</h1></center>
			<table id="customers" align="center">
				<tr>
					<td>Customer Id:</td>
					<td><input type="text" name="id" id="custid"></td>
				</tr>
				<tr>
					<td>Account Type:</td>
					<td><select name="type" id="type"><option value="Savings">Savings
								Account</option>
							<option value="Current">Current Account</option></select></td>
				</tr>
				<tr>
					<td>Deposit Amount:</td>
					<td><input name="balance" type="text"  id="amt" pattern="[0-9]+"></td>
				</tr>
			</table>
			<center><button class="button" type="submit" name="action" value="createaccount" onclick="return validate()">Create
				Account</button></center>
		</form>
		</div>
					<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
			
		
</div>
</body>
</html>