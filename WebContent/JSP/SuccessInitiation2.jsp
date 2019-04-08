<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="refresh" content="3;url=<%=request.getContextPath()%>/JSP/index.jsp" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/Epoc.css">
        <link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">
	<title>ABC BANK | Success Page 2</title>        
</head>
    <body>
    <div class="site">
    <div class="header"><%@include file="/JSP/Header.jsp"%></div>
    
    <div class="main">
    <center>
    <% String message6 = (String) request.getAttribute("message6");%>
    <%
					if (message6 != null) {
				%>

				<h2><%=message6%><br>
				Redirecting..<% session.invalidate();%></h2>
				<h1>Redirecting in 3 seconds...</h1>
<%}%>
        </center>
        </div>
        <div class="footer"><%@ include file = "footer.jsp"%></div>
        </div>
</body>
</html>