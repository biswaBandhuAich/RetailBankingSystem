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
<title>ABC BANK | </title>
</head>
<body>
<script>
function validate()
{
	custsearch = document.getElementById("custsearch").value;

	if(custsearch == "")
		{
			alert("Field Cannot be Blank!!!!");
			return false;
		}
	if(isNaN(custsearch))
		{
			alert("CustomerId must be Only Integers!!!");
			return false;
		}
	if(custsearch.length>8 || custsearch.length<8)
	{
		alert("CustomerId must be of 8 Integers!!!");
		return false;
	}
	return true;
	
}
</script>

	<div class="site">

		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
			<script language="Javascript">
					function hideA() {

						document.getElementById("A").style.visibility = "hidden";
						document.getElementById("B").style.visibility = "inherit";

					}

					function hideB() {
						document.getElementById("B").style.visibility = "hidden";
						document.getElementById("A").style.visibility = "inherit";

					}
				</script>
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

				<center><h1>Search Customer</h1></center>
				<form
					action="<%=request.getContextPath()%>/BankingControlServlet?action=search"
					method="post">
					<table align="center">
					<tr><th>Enter Customer Id:</th><th><input type="text" name="id" id="custsearch" required></th></tr>
					</table>
					 <center><input type="submit"  value="Search" onclick="return validate()"></center>
				</form>



			</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>

</body>
</html>