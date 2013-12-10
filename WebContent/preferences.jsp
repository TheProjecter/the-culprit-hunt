<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preferences</title>

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
    <img src="images/login_header.png" width=35% height=20% align="center"/>
      <h2>Here, you can choose a template that fits your ideal user interface.</h2>
      <p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</p>
      <p class="credit"><%@ include file="header.jsp" %>  <% out.print(concat); %> </p>
      	<p class="credit">Note: This will take effect on the story proper.</p>
     
    </header>
    <div class="main">
      <div class="page_container">
        <div id="immersive_slider">
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Red Theme</h2>
              <p>Font-Family: Aleo<br>
              Button Color: Red<br>
              Link Colors: Red<br>
              Background Color: #1a1a1a</p>
            </div>
            <div class="image">
              <a href="Preference?p=red">
                <img src="images/preference_red.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Blue Theme Theme</h2>
              <p>Font-Family: Verdana<br>
              Font size: 12 pixels<br>
              Button Color: Blue<br>
              Link Colors: Blue<br>
              Background Color: #171717</p>
            </div>
            <div class="image">
              <a href="Preference?p=blue">
                <img src="images/preference_blue.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
           <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Green Theme Theme</h2>
              <p>Font-Family: Trebuchet MS<br>
              Font size: 12 pixels<br>
              Button Color: Green<br>
              Link Colors: Green<br>
              Background Color: #171717</p>
            </div>
            <div class="image">
              <a href="Preference?p=green">
                <img src="images/preference_green.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
          
        </div>
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