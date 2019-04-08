<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/png" href="<%=request.getContextPath()%>/Images/logo1.png">

<title>ABC BANK | Logout</title>
</head>
<body>
<%
HttpSession newsession = request.getSession();
if(session == null)
{
  out.print("No session Exists");
}
else if(session != null)
    session.invalidate();
	request.getRequestDispatcher("/JSP/index.jsp").forward(request,response);
%>

</body>
</html>