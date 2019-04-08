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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/firstval.js"></script>
<title>ABC BANK | Delete Customer</title>
</head>
<body>
<script>
function validate()
{
	ssnid = document.getElementById("sid").value;
	if(ssnid == "")
	{
		alert("Field Cannot be Blank!!!!");
		return false;
	}
	if(!isNaN(ssnid))
	{
		alert("Please Enter a Valid SSNID!!!!");
		return false;
	
	}
	if(ssnid.length>8 )
		{
			alert("SSNID Must be of 8 characters");
			return false;
		}
	if(ssnid.length<8)
	{
		alert("SSNID Must be of 8 characters");
		return false;
	}
	
	return true;
	
}

function validate1()
{
	ccid = document.getElementById("cid").value;
	if(ccid<0)
		{
			alert("CustomerId cannot be Negative!!!");
			return false;
		}
	if(ccid == "")
	{
		alert("Field Cannot be Blank!!!!");
		return false;
	}
	if(isNaN(ccid))
	{
		alert("Please Enter a Valid CUSTOMERID!!!!");
		return false;
	
	}if(ccid.length>8)
	{
		alert("CustomerID Must be of 8 Characters!!!!!");
		return false;
	}
	if(ccid.length<8)
		{
		alert("CustomerID Must be of 8 Characters!!!!!");
		return false;
		}
	
	return true;
	
}




</script>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
			<div class="main">
				<center><h1>Please enter Id to De-Register Customer</h1></center>
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
					String message = (String) request.getAttribute("msg");
				%>
				<%
					if (message != null) {
				%>
				<h2 style="color: red"><%=message%></h2>
				<%
					}
				%>
				<center><input type="radio" name="idselect" id="ssnid" onClick="hideB()"
					checked>Customer SSN ID <input type="radio" name="idselect"
					id="id" onClick="hideA()">Customer ID</center>
				
				<center>
				<div name="rec">
				<form id="A"
					action="<%=request.getContextPath()%>/BankingControlServlet?action=deletecustomersearch"
					method="post" >
					 
						SSN ID: <input type="text" name="ssnid" id ="sid" required="true"><br>
						<button class="button" type="submit" onclick="return validate()">Delete By SSN ID</button>
						</form>
						
			<form id="B" action="<%=request.getContextPath()%>/BankingControlServlet?action=deletecustomersearch"
					method="post" style="visibility:hidden">
				
						Customer ID: <input type="text" name="custid" id="cid" required="true"><br>
						<button class="button" type="submit" onclick="return validate1()">Delete
							By Customer ID</button>
				</form>
				
				</div>
				</center>
				</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
</div>
</body>
</html>