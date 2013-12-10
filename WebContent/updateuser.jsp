<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    session ="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Culprit Hunt</title>


  <link rel="stylesheet" href="css/form_style.css">

</head>
<body onload="init()">

<%
	Cookie [] call = request.getCookies();
	String type = "";
	String concat ="";
	String user="";
	
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
<Br><br>	<center><img src="images/login_header.png"/></center>
<p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;</a></p>
 <p class="credit"><%@ include file="header.jsp" %> <% out.print(concat); %> </p>

<div id="wrapper">

<form method="post" action="UpdateUser?p=update" >

          <fieldset><br><br>
                <legend>Update User</legend>
                <p>Input the Username of the account that you want to update.<br></p>
                
                <% String form_output = (String) request.getAttribute("form_output");
                
                if(form_output==null){
    				out.println("<div><input type='hidden' name='userid'/></div>"+
    						"<div><input type='text' name='user' placeholder='User Name'/></div>"+
    						"<div><input type='password' name='pass' placeholder='Password'/></div>"+
    						"<div><input type='text' name='fname' placeholder='First Name'/></div>"+   							
    						"<div><input type='text' name='lname' placeholder='Last Name'/></div>"+
    						"<div><input type='text' name='email' placeholder='E-Mail'/></div> ");
    				
    			}
    	
    			else{
    				out.println(form_output+"<br>");
    			}
                
                %>
                <div>
                User Type: <input type="radio" name="usertype" value="admin"/>Admin 
                <input type="radio" name="usertype" value="regular"/>Regular<br>
                </div> 
  	 <%
		String msg = (String) request.getAttribute("msg");
		if(msg==null){
			out.println("");
		}
	
		else{
			out.println("<br>"+msg+"<br>");
		}
		%>
                
    <input type="submit" name="submit" value="Submit"/><br>
    <input type="button" name="submit" value="Back to Admin Page" onclick="window.location.href='ViewUser'"/>
 
            
 </fieldset>  
</form>
</div>


</body>
</html>