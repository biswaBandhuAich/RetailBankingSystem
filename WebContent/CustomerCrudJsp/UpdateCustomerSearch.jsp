
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
<title>ABC BANK | Insert title here</title>
</head>
<body>

<% 

	String message = (String)request.getAttribute("msg");
%>





<script>
 function validate()
{
	ssn = document.getElementById("ssn").value;
	if(ssn == "")
		{
			alert("Field Cannot be Blank!!!!");
			return false;
		}
	if(ssn.length>8)
		{
			alert("Please Enter a Valid SSNID!!!");
			return false;
		}
	if(ssn.length<8)
		{
			alert("SSNId must of 8 in length!!!");
			return false;
		}
	if(!isNaN(ssn))
		{
			alert("Please Enter a valid SSNID!!!");
		}
	if(ssn<0)
		{
			alert("SSNId Cannot be Negative!!!1");
			return false;
		}
	return true;
}

function validate1()
{
	cid = document.getElementById("cust").value;
	if(cid == "")
		{
			alert("Field Cannot be Blank!!!!");
			return false;
		}
		if(cid<0)
		{
		alert("CustomerId cannot be Negative!!");
		return false;
		}
	if(isNaN(cid))
		{
			alert("CustomerId Must be Integers Only!!!!");
			return false;
		}
	if(cid.length>8)
		{
			alert("CustomerId must be of 8 Integers!!!")
			return false;
		}
	if(cid.length<8)
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
						document.getElementById("B").style.visibility = "visible";

					}

					function hideB() {
						document.getElementById("B").style.visibility = "hidden";
						document.getElementById("A").style.visibility = "visible";

					}
				</script>

					<% if(message!=null){%>
						<center><h2 style="color:red"><%=message %></h2></center>
						<%} %>
				<h2 align="center">Enter Details to Update Customer</h2>

				<br> 
				<center>
				<input type="radio" name="idselect" id="ssnid" onClick="hideB()" checked>Customer SSN ID 
				<input type="radio" name="idselect" id="id" onClick="hideA()">Customer ID
				</center>
						
				<form action="<%=request.getContextPath() %>/BankingControlServlet?action=update" method="post">
					<center><div id="A" style="visibility: show">
						SSN ID: <input type="text" name="ssnid" id="ssn" required ><br>

						<button type="submit" class="button" 
							 onclick="return validate()">Update By SSN ID</button>
					</form>

						<!-- <button class="button" type="submit" name="action" value="update">Update By SSN ID</button> -->
			<form action="<%=request.getContextPath() %>/BankingControlServlet?action=update" method="post">
					</div>
					<div id="B" style="visibility: hidden">

						Customer ID: <input type="text" name="custid" id="cust" required  ><br>
						<button type="submit" class="button"  onclick="return validate1()" >Update
							By Customer ID</button>


						<!-- Customer ID: <input type="text" name="custid"><br>
						<button  type="submit" class="button" name="action" value="update">Update By Customer ID</button> -->
</form>
					</div>
					</center>
			

			</div>
		
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>

</body>
</html>