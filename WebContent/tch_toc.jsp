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
              <h2><a href="TheCulpritHunt_Chapter1Scene1.jsp">Chapter 1: Napoleonithe Before</a></h2>
              <p><a href="TheCulpritHunt_Chapter1Scene1.jsp">Scene 1: Hopelessness</a><br>
              <a href="TheCulpritHunt_Chapter1Scene2.jsp">Scene 2: Flashback</a><br>
             <a href="TheCulpritHunt_Chapter1Scene3.jsp">Scene 3: On Hold</a><br>
             <a href="TheCulpritHunt_Chapter1Scene4.jsp">Scene 4: The Invasion</a></p>
            </div>
            <div class="image">
                <img src="images/dry.png" alt="Slider 1">
            </div>
          </div>
         
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2><a href="TheCulpritHunt_Chapter2Scene1.jsp">Chapter 2: The Awakening</a></h2>
              <p><a href="TheCulpritHunt_Chapter2Scene1.jsp">Scene 1: The Spark Family</a><br>
              <a href="TheCulpritHunt_Chapter2Scene2.jsp">Scene 2: Discrimination</a><br>
             <a href="TheCulpritHunt_Chapter2Scene3.jsp">Scene 3: The Invention Spark</a><br>
             <a href="TheCulpritHunt_Chapter2Scene4.jsp">Scene 4: The Explosion</a><br>
             <a href="TheCulpritHunt_Chapter2Scene5.jsp">Scene 5: This is Enough!!</a></p>
            </div>
            <div class="image">
                <img src="images/powersaver.png" alt="Slider 1">
            </div>
          </div>
          
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2><a href="TheCulpritHunt_Chapter3Scene1.jsp">Chapter 3: First Blood</a></h2>
              <p><a href="TheCulpritHunt_Chapter3Scene1.jsp">Scene 1: Restlessness</a><br>
              <a href="TheCulpritHunt_Chapter3Scene2.jsp">Scene 2: The Preparation</a><br>
             <a href="TheCulpritHunt_Chapter3Scene3.jsp">Scene 3: Book of New World</a><br>
             <a href="TheCulpritHunt_Chapter3Scene4.jsp">Scene 4: Crackerjacker</a><br>
              <a href="TheCulpritHunt_Chapter3Scene5.jsp">Scene 5: The Gems of Visage</a><br>
               <a href="TheCulpritHunt_Chapter3Scene6.jsp">Scene 6: Deuce Vengeauce</a><br>
                <a href="TheCulpritHunt_Chapter3Scene7.jsp">Scene 7: Obtained</a></p>
            </div>
            <div class="image">
                <img src="images/map.png" alt="Slider 1">
            </div>
          </div>
          
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2><a href="TheCulpritHunt_Chapter4Scene1.jsp">Chapter 4: The Downfall of Jackhalgar</a></h2>
              <p><a href="TheCulpritHunt_Chapter4Scene1.jsp">Scene 1: The Unexpected Ally</a><br>
              <a href="TheCulpritHunt_Chapter4Scene2.jsp">Scene 2: It is Jackhalgar</a><br>
             <a href="TheCulpritHunt_Chapter4Scene3.jsp">Scene 3: The Disguise</a><br>
             <a href="TheCulpritHunt_Chapter4Scene4.jsp">Scene 4: The Battle</a><br>
             <a href="TheCulpritHunt_Chapter4Scene5.jsp">Scene 4: Visage Victory</a></p>
            </div>
            <div class="image">
                <img src="images/kingdom.jpg" alt="Slider 1">
            </div>
          </div>
          
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2><a href="TheCulpritHunt_Chapter5Scene1.jsp">Chapter 5: Of the Hardest Battles</a></h2>
              <p><a href="TheCulpritHunt_Chapter5Scene1.jsp">Scene 1: Dilemma</a><br>
              <a href="TheCulpritHunt_Chapter5Scene2.jsp">Scene 2: Battle of Napoleonithe</a><br>
             <a href="TheCulpritHunt_Chapter5Scene3.jsp">Scene 3: Health is Back</a><br>
             <a href="TheCulpritHunt_Chapter5Scene4.jsp">Scene 4: The Culprit Council</a><br>
              <a href="TheCulpritHunt_Chapter5Scene5.jsp">Scene 5: The Defeat and Triumph</a></p>
            </div>
            <div class="image">
                <img src="images/warp.jpg" alt="Slider 1">
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