<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    session ="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Culprit Hunt</title>


  <link rel="stylesheet" href="css/login_style.css">

</head>
<body>

	<Br><br><img src="images/login_header.png"/>

<form class="sign-up"  method="post" action="Register" >
<h1 class="sign-up-title">Register</h1>
<p>Fill out the form for you to have the ultime The Culprit Hunt experience.</p><br>
    <input type="text" class="sign-up-input" name="user"  placeholder="Username" autofocus>
    <input type="password" class="sign-up-input" name="pass" placeholder="Password">
    <input type="text" class="sign-up-input" name="fname"  placeholder="First Name" autofocus>
    <input type="text" class="sign-up-input" name="lname"  placeholder="Last Name" autofocus>
    <input type="text" class="sign-up-input" name="email"  placeholder="Email" autofocus><br>
	
User Type: <input type="radio" name="usertype" value="admin"/>Admin <input type="radio" name="usertype" value="regular"/>regular<br><br>
  
   <%
	String msg = (String) request.getAttribute("msg");
	if(msg==null){
		out.println("");
	}
	
	else{
		out.println("<br>"+msg+"<br>");
	}
	%>
    
    <input type="submit" value="Register" class="sign-up-button"><br><br>
    <input type="button" value="Back to Login" class="sign-up-button" onclick="window.location.href='tch_index.jsp'">
</form>



</body>
</html>