
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Epoc.css">
	<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	
<title>ABC BANK | Cashier Login</title>
</head>
<body>
	<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
			<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
			%>
			<center>
				<h2 style="color: red"><%=message %></h2>
			</center>
			<%
				}
			%>
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
			<center><h2>Enter Details</h2></center>
			<center>
			<br> <input type="radio" name="idselect" id="ssnid"
				onClick="hideB()" checked>Customer Account Number <input
				type="radio" name="idselect" id="id" onClick="hideA()">Customer
			ID

			<form
				action="<%=request.getContextPath()%>/BankingControlServlet?action=intm"
				method="post">
				<div id="A" style="visibility: show">
				<table>
					<tr><th>Account Number:</th><th><input type="text" name="ssnid" pattern="[(0-9).(_)]+"></th></tr>
						</table>
					<button type="submit" class="button" name="btnaction"
						value="update1" pattern="[0-9]+">Proceed</button>
				</div>
				<div id="B" style="visibility: hidden">
				<table>
					<tr><th>Customer ID:</th><th><input type="text" name="custid"></th></tr>
				    <tr><th>Account Type:</th><th><select name="acctype">
						<option value="Current">Current Account</option>
						<option value="Savings">Savings Account</option>
					</select></th></tr>
					</table>
					<button type="submit" class="button" name="btnaction"
						value="update2">Proceed</button>
				</div>
			</form>
			</center>
		</div>
		<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>

	</div>



</body>
</html>