<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/firstval.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/HomePage.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
<title>ABC BANK | Header</title>
</head>
<body>
<div class="site">
<div class="header">
<div class="sitelogo"><img src="<%=request.getContextPath()%>/Images/logo1.png" width="80px" height="80px"></div>
<div class="topbar"><h1 style="float:left">ABC Bank</h1>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<% 
if(session.getAttribute("id")==null)
{
	
}
else if(session.getAttribute("id").toString()!=null)
{
	String user=session.getAttribute("id").toString();
%>
<div class="dropdown" style="float:right;">
<button class="button2">Logged in as:&nbsp;<%out.println(user);%>&nbsp&nbsp<i class="down"></i></button>
<div class="dropdown-content">
<a href="<%=request.getContextPath()%>/JSP/Logout.jsp">Logout</a>
<a href="<%=request.getContextPath()%>/JSP/ChangePassword.jsp">Change Password</a>
<a href="<%=request.getContextPath()%>/JSP/ContactSupport.jsp">Contact Support</a>

</div>
<%} %> 
</div>

</div>
</div>
</div>
</body>
</html>