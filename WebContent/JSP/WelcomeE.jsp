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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/firstval.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Welcome.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Executive Login</title>
</head>
<body> 
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma", "no-cache");
%>
<%
if(session.getAttribute("id")==null)
{
	response.sendRedirect("index.jsp");	
}
%>
<div class="site">

<div class="header"><%@include file="Header.jsp"%>
</div>

<div class="lside"></div>

<div class="main">
<center>
<h1>Menu</h1>
<div class="myDIV3">
<a href="<%=request.getContextPath()%>/CustomerCrudJsp/NewCustomer.jsp"><button class="button"><span>New customer</span></button></a>
<a href="<%=request.getContextPath()%>/CustomerCrudJsp/UpdateCustomerSearch.jsp"><button class="button"><span>Update Customer</span></button></a><br>
<a href="<%=request.getContextPath()%>/CustomerCrudJsp/DeleteCustomerSearch.jsp"><button class="button"><span>Delete Customer</span></button></a>
<a href="<%=request.getContextPath()%>/CustomerCrudJsp/ViewCustomerSearch.jsp"><button class="button"><span>View Customer</span></button></a><br>
<a href="<%=request.getContextPath()%>/AccountCrudJsp/CreateAccount.jsp"><button class="button"><span>Create Account</span></button></a>
<a href="<%=request.getContextPath()%>/AccountCrudJsp/DeleteAccountSearch.jsp"><button class="button"><span>Delete Account</span></button></a><br>
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=showaccountstatus"><button class="button"><span>Account Status</span></button></a>
<a href="<%=request.getContextPath()%>/BankingControlServlet?action=showcustomerstatus"><button class="button"><span>Customer Status</span></button></a>
</div>

</center>


<div class="maindiv">

</div>
</div>

<div class="rside"></div>
<div class="footer"><%@ include file = "footer.jsp"%>
</div>
</div>

</body>

</html>
