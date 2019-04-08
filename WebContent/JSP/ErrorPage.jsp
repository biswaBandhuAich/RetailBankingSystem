
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">


<title>ABC BANK | ERROR</title>
</head>
<body>
<div class="site">
		<div class="header"><%@include file="/JSP/Header.jsp"%></div>
		<div class="main">
<% String message = (String)request.getAttribute("Error");%>
<% String message1 = (String)request.getAttribute("Error1");%>
<% String message2 = (String)request.getAttribute("ErrorAcc");%>
<% String message3 = (String)request.getAttribute("notdeleted");%>
<% String message4 = (String)request.getAttribute("ErrorDel");%>
<% String message5 = (String)request.getAttribute("ErrorLogin");%>
<% String message6 = (String)request.getAttribute("noaccount");%>
<% if(message !=null){%>
	<center>	
		<h2 style="color:red"><%=message %></h2>
		
		
		<%} %>
		<% if(message6 !=null){%>
	</center>
	<center>	
		<h2 style="color:red"><%=message6 %></h2>
		
		
		<%} %>
		<% if(message4 !=null){%>
		
		<h2 style="color:red"><%=message4 %></h2>
		
		
		<%} %>
		<% if(message3 !=null){%>
		
		<h2 style="color:red"><%=message3 %></h2>
		
		
		<%} %>
		<% if(message1 !=null){%>
		
		<h2 style="color:red"><%=message1 %></h2>
		
		
		<%} %>
		<% if(message2 !=null){%>
		
		<h2 style="color:red"><%=message2 %></h2>
		
		
		<%} %>
		<% if(message5 !=null){%>
		
		<h2 style="color:red"><%=message5 %></h2>
		
		
		<%} %>
		<center>
		<% if(session.getAttribute("id")==null) {%>
			<a href="<%=request.getContextPath()%>/JSP/index.jsp"><button class="button">Home</button></a>
		<%}
		else {%>
			<a href="<%=request.getContextPath()%>/BankingControlServlet?action=home"><button class="button">Home</button></a>
			
		<%} %>
		</center>
		</center>
		</div>
				<div class="footer"><%@ include file="/JSP/footer.jsp"%></div>
		
		</div>
</body>
</html>