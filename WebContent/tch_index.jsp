<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    session = "false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Culprit Hunt</title>

  <link rel="stylesheet" href="css/login_style.css">

</head>
<body>


<%
	Cookie [] call = request.getCookies();
	String vuser = "";
	String vpass = "";
	
	if(call!=null){
		for(int j =0; j<call.length;j++){
			Cookie b = call[j];
			if(b.getName().equals("user")){
				vuser = b.getValue();
			}
			if(b.getName().equals("pass")){
				vpass = b.getValue();
			}
		}
	}
%>


<center><br><br><img src="images/login_header.png" width=35% height=20% align="center"/></center>


  <form class="sign-up" action="Validate" method="post">
    <h1 class="sign-up-title">Login</h1>
    <p>For you to fully enjoy reading The Culprit Hunt, you must login in first.</p>
    <input type="text" class="sign-up-input" name="user"  placeholder="Username" autofocus value='<%= vuser%>'>
    <input type="password" class="sign-up-input" name="password" placeholder="Password" value='<%=vpass%>'>
    
    
    <%
	String msg = (String) request.getAttribute("msg");
	if(msg==null){
		out.println("");
	}
	
	else{
		out.println("<br>"+msg+"<br>");
	}
	%>
    
    <input type="submit" value="Login" class="sign-up-button"><br><br>
    
    <p>Not yet a member? Join now!</p><br>
    <input type="button" value="Register" class="sign-up-button" onclick="window.location.href='register.jsp'">
  </form>


  <div class="about">
    <p class="about-links">
      <a href="http://apc.edu.ph" target="_parent">Enterprise Java 1</a>
      <a href="http://apc.edu.ph" target="_parent">Web Application</a>
    </p>
    <p class="about-author">
      &copy; 2013 <a href="http://apc.edu.ph" target="_blank">Marcos, Perez</a> -
      <a href="" target="_blank">SS111</a><br>
      <a href="" target="_blank">Submitted to Mr. Noel Anonas</a><br>
    </p>
  </div>





</body>
</html>