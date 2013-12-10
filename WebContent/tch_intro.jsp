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
      <h2>What is The Culprit Hunt all about?</h2>
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
              <h2>Introduction</h2>
              <p style="text-align: justify;">
              Set in the fictional country of Napoleonithe, a nation dominated by corruption and evil magic enforcers, The Culprit Hunt is basically an adventure story about John Spark, a normal citizen turned hero, and his pursuit for the Gems of Visage. These gems are said to be the ultimate weapon that can be used to defeat the magic of the Culprit Council, the masterminds of all the evil in Napoleonithe and the very creators of the gems. However, in order for John to obtain all of the gems, he has to surpass several quests where he will face the Culprit Bosses, a group of sadistic, magical enforcers that control different regions of the country. Will John be able to slay the Culprit Council? Will the presence of his very powerful enemy, Fraudemonium, hinder him from restoring the peace and unity that their country once experienced?
              
              </p>
                <input type="button" name="Characters" value="Go to Characters Page" onclick="window.location.href='tch_characters.jsp'"/>
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