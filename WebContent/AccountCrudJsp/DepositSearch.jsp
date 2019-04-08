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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC Bank | Deposit Search</title>
</head>
<body> 
<script>
function validate()
{
	 amt = document.getElementById("depamount").value;
	 if(amt.length>8)
		 {
		 	alert("Please enter a Correct Amount!!!");
		 	return false;
		 }
	 if(isNaN(amt))
		 {
		 	alert("Please Enter Your Amount!!");
		 	return false;
		 }
	if(amt<0)
		{
			alert("Please Enter a Positive Amount!!!!");
			return false;
		}
	return true;
	
	$(document).ready(function(){
	    $("form").submit(function(){
	        alert("Submitted");
	    });
	});
}
</script>

<%String aid=(String)request.getAttribute("id"); %>
<%String cid=(String)request.getAttribute("cid"); %>
<div class="site">
<div class="header"><%@include file="/JSP/Header.jsp"%></div>
<div class="main">

<center>
<h2>Deposit Amount</h2>
</center>
<form name="form" action="<%=request.getContextPath()%>/BankingControlServlet?action=depositamount" method="post">
<input type="hidden" name="aid" value="<%=aid%>">
<input type="hidden" name="cid" value="<%=cid%>">
<table align="center">
<tr><th><input type="text" id="depamount" name="paisa" required="true" pattern="[0-9]+"></th></tr>
<tr><th colspan="2"><input type="submit" onclick="return validate()" value="Deposit"></th></tr>
</table>
</form>



</div>
<div class="footer"><%@ include file = "/JSP/footer.jsp"%></div>
</div>


</body>

</html>
