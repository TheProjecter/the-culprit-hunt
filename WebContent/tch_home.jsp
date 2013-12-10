<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Introduction</title>

<script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.immersive-slider.js"></script>
  <link href='css/immersive-slider.css' rel='stylesheet' type='text/css'>

 <link rel="stylesheet" href="css/slider_style.css">
</head>
<body>

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
HttpSession s2 = request.getSession(false);
if (s2 == null){
	response.sendRedirect("tch_index.jsp");
	return;
}
%>

  <div class="wrapper">
    <header>
      <h1><img src="images/login_header.png" width=35% height=20% align="center"/></h1>
      <h2>Welcome to The Culprit Hunt, <%out.print(user);%>!</h2>
      <p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</p>
      <p class="credit"><%@ include file="header.jsp" %> <% out.print(concat); %>  </p>
     
    </header>
    <div class="main">
      <div class="page_container">
        <div id="immersive_slider">
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Welcome</h2>
              <p style="text-align: justify;">
            	Today, you have managed to seek another type of adventure by opening this web application.<br>
            	We hope you'll enjoy our story of a man that lived in a corrupt city and emerged as a triumphant catalyst of change.<br>
            	You can use the navigation to browse several parts of the application.<br><br>
            	
            	Regards,<Br><br><br>
            	
            	Japhet Marcos & Dave Perez
         
              </p>
                <input type="button" name="toc" value="Start Your TCH Experience Now" onclick="window.location.href='tch_toc.jsp'"/>
            </div>
          </div>
        
  	
  	<script type="text/javascript">
  	  $(document).ready( function() {
  	    $("#immersive_slider").immersive_slider({
  	      container: ".main"
  	    });
  	  });

    </script>
  </div>

</body>
</html>