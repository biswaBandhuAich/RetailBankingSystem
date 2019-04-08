<% 
if(session.getAttribute("id")==null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Not logged in");
	rd.forward(request,response);
}%>
<%@page import="prs.indv.RetailBanking.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<script type="text/javascript" src="js/firstval.js"></script>

<title>ABC BANK | Withdraw Amount</title>
</head>
<body>
<script>
function validate()
{
	amt = document.getElementById("widamount").value;
	if(amt == 0)
		{
			alert("Enter a Amount Greater than Zero!!!");
			return false;
		}
	if(isNaN(amt))
	{
		alert("Please Enter Your Amount!!!");
		return false;
	}else if(amt<0)
		{
			alert("Please Enter a Positive Amount!!");
			return false;
		}else if(amt.length>8)
			{
				alert("Please Enter a Correct Amount!!! ");
				return false;
			}
	return true;
}




</script>


	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
			<%
				String accountId = (String) request.getAttribute("id");
			%>
			<%
				String customerId = (String) request.getAttribute("cid");
			%>
			<%
				String message = (String) request.getAttribute("error");
			%>
			<%
				if (message != null) {
			%>

			<Center>
				<h3 style="color: red"><%=message%></h3>
			</Center>


			<%
				}
			%>
			<form
				action="<%=request.getContextPath()%>/BankingControlServlet?action=withdrawconfirm&accid=<%=accountId%>&custid=<%=customerId%>"
				method="post">
				<center></center>
				<center>
					<h1>Withdraw</h1>
				</center>
				<table align="center">
					<tr>
						<td>AccountId :</td>
						<td><input type="text" name="AccountId" value=<%=accountId%>
							disabled></td>
					</tr>
					<tr>
						<td>Amount to Be Withdrawn:</td>
						<td><input type="text" name="paisa" id="widamount" required="true");></td>
				</table>
				<center>
					<input type="submit" value="Withdraw" onclick="return validate()">
				</center>

			</form>
		</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>
</body>
</html>