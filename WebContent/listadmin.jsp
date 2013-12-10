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
<body onload="init()">
<%
	Cookie [] call = request.getCookies();
	String type = "";
	String concat ="";
	String user = "";
	
	if(call!=null){
		for(int j =0; j<call.length;j++){
			Cookie b = call[j];
			if(b.getName().equals("type")){
				type = b.getValue();
			}
			if(b.getName().equals("user")){
				user = b.getValue();
			}
		}
	}
	
	if(type.equals("admin")){
		concat = "|&nbsp;&nbsp;  <a href='ViewUser'>Admin Panel</a>   &nbsp;&nbsp;";
	}
%>

<%
HttpSession s1 = request.getSession(false);
if (s1 == null){
	response.sendRedirect("tch_index.jsp");
	return;
}
%>

<center><br><br><img src="images/login_header.png" width=35% height=20% align="center"/></center>
<p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout</a>
</p>
<p class="credit"><%@ include file="header.jsp" %><% out.print(concat); %></p><br><br>
<div id="main" style="width:800px; margin: auto;"><br><br>
<h1><br><br>Admin Panel</h1><br>
<div class="TableUsers" >
   <table>
    <tr>
    	<td>User ID</td>
        <td>Username</td>
        <td >Password</td>
        <td>User Type</td>
		<td>Email</td>
		<td>Last Name</td>
		<td>First Name</td>
		<td>Functions</td>
    </tr>
    
     <%
	String tableOutput = (String) request.getAttribute("tableOutput");
	if(tableOutput==null){
		out.println("");
	}
	
	else{
		out.println(tableOutput+"<br>");
	}
	%>
    
   </table>
</div>     
</div>

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