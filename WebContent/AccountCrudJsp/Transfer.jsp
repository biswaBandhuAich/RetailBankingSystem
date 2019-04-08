<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ABC BANK | Transfer Page</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

</head>
<body>
<script>
 function validate()
{
	accp = document.getElementById("payAccNo").value;
	accb = document.getElementById("benaccnt").value;
	amt = document.getElementById("trfamount1").value;
	if(accb == "")
		{
			alert("Field Cannot be Blank!!");
			return false;
		}
	if(accp == accb)
		{
			alert("Payee Acc No. and Beneficiary Acc No. Cannot be Same!!!");
			return false;
		}
	if(isNaN(accb))
		{
			alert("Please Enter Valid Beneficiary Account No.!!!! ");
			return false;
		
		}
	if(accb.length>11)
			{
				alert("Enter a Valid Beneficiary Account No.!!!");
				return false;
			}
	if(amt == "")
	{
		alert("Field Cannot be Blank!!!!");
		return false;
	}
	if(isNaN(amt) || amt.length>8)
		{
			alert("Please Enter a Valid Amount!!!");
			return false;
		}
	if(amt<0 || amt == 0)
		{
			alert("Please Enter a Valid Amount!!!! ");
			return false;
		}
	if(amt<500)
		{
			alert("Minimum Transfer Amount Should be Rs500!!");
			return false;
		}
	
	return true;
} 




</script>
<% 
	
	String aaid = (String) request.getAttribute("aaid");

%>
<%
String message = (String)request.getAttribute("message");
%>
<div class="site">
<div class="header"><%@include file="/JSP/Header.jsp"%></div>
<div class="main">
<%if(message!=null){ %>

<center>
<h2 style="color:red"><%=message %></h2>



<form action="<%=request.getContextPath()%>/BankingControlServlet?action=transferamount"
			method="post">
			<table>
				<tr>
					<td>Payee's Account Number</td>
					<td><input type="text" name="payAccNo" id="payAccNo" value=<%=aaid%> readonly></td>
				</tr>
				<tr>
					<td>Enter Beneficiary Account Number</td>
					<td><input type="text" name="benAccNo" id="benaccnt" required ></td>
				</tr>
				<tr>
					<td>Enter Amount to Transfer in Rs</td>
					<td><input type="text" name="paisa" id="trfamount1" pattern="[0-9]+" required="true"></td>
				</tr>
			</table>
			<input type="submit" class="button" value="Transfer" onclick="return validate()">
		</form>
	</center>
<%}else{%>




	<center>
		<%
			String aid = (String) request.getAttribute("aid");
			String cid = (String) request.getAttribute("cid");
			String failure=(String)request.getAttribute("insufficientbal");
			if(failure!=null){
				%>
				<h3 style="color:red"><%=failure%></h3>
			<% }%>
		
		
		<form action="<%=request.getContextPath()%>/BankingControlServlet?action=transferamount"
			method="post">
			<table>
				<tr>
					<td>Payee's Account Number</td>
					<td><input type="text" name="payAccNo" id="payAccNo" value=<%=aid%> readonly></td>
				</tr>
				<tr>
					<td>Enter Beneficiary Account Number</td>
					<td><input type="text" name="benAccNo" required id="benaccnt"></td>
				</tr>
				<tr>
					<td>Enter Amount to Transfer (Rs)</td>
					<td><input type="text" name="balance" required id="trfamount1" pattern="[0-9]+"></td>
				</tr>
			</table>
			<input type="submit" class="button" value="Transfer" onclick="return validate()" >
		</form>
	</center>
	<center><a href="<%=request.getContextPath()%>/BankingControlServlet?action=GoBack"><Button name="action" class="button" value="GoBack">GoBack</Button></a></center>
	</div>
						<div class="footer"><%@ include file = "/JSP/footer.jsp"%></div>
	</div>
</body>
<%} %>
</html>