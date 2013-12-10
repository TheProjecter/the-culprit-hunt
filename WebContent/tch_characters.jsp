<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Characters</title>

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
      <h1>The &nbsp;Characters</h1>
      <h2>Are you ready to know the characters of the Culprit Hunt?</h2>
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
              <h2>John Spark</h2>
              <p>The main character of the story, a poor, intelligent man who lost everything and who wants to seek vengeance for his loss.</p>
            </div>
            <div class="image">
              
                <img src="images/char_john.png" alt="Slider 1">
              </a>
            </div>
          </div>
          <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Fraudemonia</h2>
              <p>The head of the Culprit Bosses, the most wicked female leader among all of them, she is the most ruthless, too.</p>
            </div>
            <div class="image">
              
                <img src="images/Fraudemonia3.png" alt="Slider 1">
              </a>
            </div>
          </div>
           <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Crackerjacker</h2>
              <p>The main Culprit Boss responsible for the bombing of Swineville</p>
            </div>
            <div class="image">
              
                <img src="images/Crackerjacker.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
           <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>Jackhalgar</h2>
              <p>The weakest Boss among the three, but smartest nonetheless.</p>
            </div>
            <div class="image">
              
                <img src="images/Cojuanterra1.png" alt="Slider 1">
              </a>
            </div>
          </div>
          
             <div class="slide" data-blurred="images/index_bg.png">
            <div class="content">
              <h2>The Culprit Council </h2>
              <p>The brain behind the domination of Napoleonithe, the original New Worlders. The most powerful group for the
               part of the foreigners.
              </p>
            </div>
            <div class="image">
              
                <img src="images/culbosses.png" alt="Slider 1">
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