<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Help Page</title>

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

if(type.equals("regular")){
	HttpSession s2 = request.getSession(false);
	if (s2 == null){
		response.sendRedirect("tch_index.jsp");
		return;
	}
}
else{
	HttpSession s1 = request.getSession(false);
	if (s1 == null){
		response.sendRedirect("tch_index.jsp");
		return;
	}
}
%>

  <div class="wrapper">
    <header>
    <img src="images/login_header.png" width=35% height=20% align="center"/>
      <h2>Here, you can find some helpful info on how to use the web application.</h2>
      <p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</p>
      <p class="credit"><%@ include file="header.jsp" %> <% out.print(concat); %> </p>
     
    </header>
    <div class="main">
      <div class="page_container">
        <div id="immersive_slider">
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>1. Login</h2>
              <p>This is where your usage starts.<br><br> If you are an authenticated user, you'll be able to use the web app.</p>
            </div>
            <div class="image">
              
                <img src="images/help_login.png" alt="Slider 1">
              </a>
            </div>
          </div>
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>2. Register</h2>
              <p>If you want to be part of the community, sign up in this page.</p>
            </div>
            <div class="image">
              
                <img src="images/help_register.png" alt="Slider 1">
              </a>
            </div>
          </div>
           <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>3. Admin Tools</h2>
              <p>If you are an Administrator, you can control the access of your users through this page.<br><br>
              You can either delete or update their information.</p>
            </div>
            <div class="image">
              
                <img src="images/help_admin.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
           <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>4. Delete User</h2>
              <p>Only administrators can perform this.<br><br>
              If you want to banish a certain user from your application, use this module.</p>
            </div>
            <div class="image">
              
                <img src="images/help_delete.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
             <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>5. Update User</h2>
              <p>Only administrators can perform this.<br><br>
              Should you find any need to update one of your user's info, you can use this module.
              </p>
            </div>
            <div class="image">
              
                <img src="images/help_update.png" alt="Slider 1">
            </div>
          </div>
          
                <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>6. About</h2>
              <p>Information about the story plot can be found in this module.
              </p>
            </div>
            <div class="image">
              
                <img src="images/help_about.png" alt="Slider 1">
            </div>
          </div>
          
                <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>7. Characters</h2>
              <p>Want to know who the characters of the story are? Click that link on the navigation!
              </p>
            </div>
            <div class="image">
              
                <img src="images/help_characters.png" alt="Slider 1">
            </div>
          </div>
          
                <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>8. Change Password</h2>
              <p>If you feel like your account isn't secured, you can use this module to change your password.
              </p>
            </div>
            <div class="image">
              
                <img src="images/help_cpass.png" alt="Slider 1">
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