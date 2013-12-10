<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    session ="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Culprit Hunt</title>


<%
	Cookie [] call = request.getCookies();
	String type = "";
	String concat ="";
	String user = "";
	String style = "style.css";
	
	if(call!=null){
		for(int j =0; j<call.length;j++){
			Cookie b = call[j];
			if(b.getName().equals("type")){
				type = b.getValue();
			}
			if(b.getName().equals("user")){
				user = b.getValue();
			}
			
			if(b.getName().equals("theme")){
				style=b.getValue();
			}
		}
	}
	
	
	if(type.equals("admin")){
		concat = "|&nbsp;&nbsp;  <a href='ViewUser'>Admin Panel</a>   &nbsp;&nbsp;";
	}
%>

<link rel="stylesheet" type="text/css" href="css/<%out.print(style);%>">


<script type="text/javascript">
var vc, vctx, brick,halgar,soldiers,nx, uni;
var ctr =0;
var ga = 0.0;
var timerId = 0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		kingdom = document.getElementById("kingdom");
		soldiers = document.getElementById("soldiers");
		disguise = document.getElementById("disguise");
		vctx.drawImage(kingdom,0,0,640,360,0,0,640,480);
		fade();
	}
	function fade(){
		uni = setInterval("fadeIn()",1000);
	}
	vctx.globalAlpha = ga;
	function fadeIn()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(soldiers,0,0,948,399,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(soldiers,0,0,948,399,0,0,640,480);
			    show();
		    }
		    
		}
	
	
	
	function show(){
		clearInterval(uni);
		vctx.drawImage(disguise,0,0,150,428,0,0,120,448);
		first = setInterval("itsdisguise()",3000);
	}
	function itsdisguise(){
		if (ctr < 6) ctr++;
		nx = 150 *ctr;
		vctx.drawImage(soldiers,0,0,948,399,0,0,640,480);
		vctx.drawImage(disguise,nx,0,150,428,0,0,120,448);
		if (ctr==6){
			vctx.drawImage(disguise,750,0,150,428,0,0,120,448);
		
		stop();}
	}
	function stop(){
		clearInterval(first);
	}
		
	
	
</script>
</head>
<body onload="init()">

<%
HttpSession s2 = request.getSession(false);
if (s2 == null){
	response.sendRedirect("tch_index.jsp");
	return;
}
%>


<div id="main">
<center><br><br><img src="images/login_header.png" width=35% height=20% align="center"/></center>
<p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</p>
<p class="credit"><%@ include file="header.jsp" %><% out.print(concat); %></p><br><br>

<div id="left">
<canvas id="canvas" width="640" height="480" style="border-bottom: 15px solid #000; border-top: 15px solid #000;">Browser does not Support HTML 5</canvas>
<img class="img" id="kingdom" alt="" src="images/kingdom.jpg" width="640" height="480">
<img class="img" id="soldiers" alt="" src="images/soldiers.png" width="640" height="480">
<img class="img" id="disguise" alt="" src="images/disguise.png" width="640" height="480">

</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 3: The Disguise</h3>
<div id="caption"><p>
But John was intelligent and wise. He knew that directly opposing his<br>
enemies would result to his failure. So instead of doing that,<br>
he disguised as one of them.  He dressed as one of the protectors.<br>
During a feast, John contaminated all the whine with poison, killing all<br>
the protectors before the night ended. Jackhalgar was unaware of all the<br>
things that happened, he was peacefully resting at his lair. <br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene2.jsp">
<input type=submit id="button" name = Chap4S1 value = "Return to Scene 2">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene4.jsp">
<input type=submit id="button" name = Chap4S3 value="Go to Scene 4">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/disguise.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>