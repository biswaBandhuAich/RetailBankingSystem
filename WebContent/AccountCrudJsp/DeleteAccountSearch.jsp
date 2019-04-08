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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | Delete Account Status</title>
</head>
<body>
<script>
function validate()
{
	custid = document.getElementById("id").value;
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
	
	return true;
	
}
</script>
	<div class="site">

		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				<%
					String message = (String) request.getAttribute("message");
				%>

				<%
					if (message != null) {
				%>
				<h2 style="color: red"><%=message%></h2>
				<%
					}
				%>

				<h1 align="center">Remove Existing Customer</h1>
				<form
					action="<%=request.getContextPath()%>/BankingControlServlet?action=searchdeleteaccount"
					method="post">
				<table align="center">
					<tr><td>Enter Customer Id</td><td><input type="text" name="custid" required id="id"></td></tr>
					<tr align="center"><td colspan="2" ><input type="submit"  value="Search" onclick="return validate()"></td></tr>
				</table>
				</form>



			</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>

</body>
</html>