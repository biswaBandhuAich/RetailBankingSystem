<% 
if(session.getAttribute("id")!=null)
{
	RequestDispatcher rd=request.getRequestDispatcher("ErrorPage.jsp");
	request.setAttribute("ErrorLogin", "Already logged in logout and try again");
	rd.forward(request,response);
	
}
else
{	
	
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

<title>ABC Bank</title>
</head>
<body> 
<div class="site">
<% 
String message = (String)request.getAttribute("error");
%>
<div class="header"><%@include file="Header.jsp"%></div>

<div class="main">
<center>
<h1>Log In</h1>
<% if(message !=null){%>
		
		<h2 style="color:red"><%=message %></h2>
		
		<%} %>
<div class="myDIV3">
<button class="button" onclick="tellerlogin()">Teller Login</button>
<button class="button" onclick="execlogin()">Executive Login</button>
</div>

</center>


<div class="maindiv">
<center>
<div class="myDIV4" id="myDIV">
<form name="cusform" action="<%=request.getContextPath()%>/BankingControlServlet?action=login&type=Cashier" method="post">
<input type="text" name="id" placeholder="User Id" required="true" pattern="(?=.*[A-Za-z])(?=.*[0-9]).{8,}"><br>
<input type="password" name="pass" placeholder="Password" required="true" pattern="(?=.*[A-Za-z])(?=.*[0-9]).{10,}"><br>
<input type="submit" value="Cashier login">
</form>
</div>

<div class="myDIV4" id="myDIV2" style="display:none;">
<form name="cusform" action="<%=request.getContextPath()%>/BankingControlServlet?action=login&type=Executive" method="post">
<input type="text" name="id" placeholder="user id" required pattern="(?=.*[A-Za-z])(?=.*[0-9]).{8,}"><br>
<input type="password" name="pass" placeholder="password" required pattern="(?=.*[A-Za-z])(?=.*[0-9]).{10,}"><br>
<input type="submit" value="Executive login">
</form>
</div>
</center>
</div>
<center><a href="<%=request.getContextPath() %>/JSP/ForgetPasswordSearch.jsp">Forgot Password</a></center>

</div>

<div class="rside"></div>
<div class="footer"><%@ include file = "footer.jsp"%>
</div>
</div>

<script>
function tellerlogin() {
    var x = document.getElementById("myDIV");
    var y = document.getElementById("myDIV2");
    var z = document.getElementById("myDIV3");
    
    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "none";
        z.style.display = "none";
    } else {
        x.style.display = "none";
        z.style.display = "none";

    }
}
function execlogin() {
    var x = document.getElementById("myDIV2");
    var y = document.getElementById("myDIV");
    var z = document.getElementById("myDIV3");


    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "none";
        z.style.display = "none";

    } else {
        x.style.display = "none";
        z.style.display = "none";
    }
}
</script>
</body>

</html>
