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
var vc, vctx, visage,nx, uni;
var ctr =0;
var ga = 0.0;
var timerId = 0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		visage = document.getElementById("visage");
		luzar = document.getElementById("luzar");
		map = document.getElementById("map");
		vctx.drawImage(map,0,0,1024,640,0,0,640,480);
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
			vctx.drawImage(luzar,0,0,800,400,310,-100,300,300);
			vctx.drawImage(visage,0,0,800,400,60,120,300,300);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(luzar,0,0,800,400,310,-100,300,300);
			    vctx.drawImage(visage,0,0,800,400,60,120,300,300);
			    show();
		    }
		    
		}
	function show(){
		clearInterval(uni);
		vctx.drawImage(map,0,0,1024,640,0,0,640,480);
		vctx.drawImage(luzar,0,0,800,400,310,-100,300,300);
		vctx.drawImage(visage,0,0,800,400,60,120,300,300);
		first = setInterval("itsvisage()",500);
	}
	function itsvisage(){
		if (ctr < 3) ctr++;
		nx = 800 *ctr;
		vctx.drawImage(map,0,0,1024,640,0,0,640,480);
		vctx.drawImage(luzar,nx,0,800,400,310,-100,300,300);
		vctx.drawImage(visage,nx,0,800,400,60,120,300,300);
		if(ctr==3){
			vctx.drawImage(luzar,0,0,800,400,310,-100,300,300);
			vctx.drawImage(visage,0,0,800,400,60,120,300,300);
		}
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
<img class="img" id="visage" alt="" src="images/visage.png" width="640" height="480">
<img class="img" id="luzar" alt="" src="images/luzar.png" width="640" height="480">
<img class="img" id="map" alt="" src="images/map.png" width="640" height="480">
</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 5:Visage Victory</h3>
<div id="caption"><p>
Deep inside his thoughts, he knows that he is getting closer and closer to his<br>
goal. With the death of the second boss came the second Gem of Visage. John knew<br>
he was nearing towards his victory, but he has to face one more boss. The most<br>
powerful among the three Culprit Bosses, Fraudemonia, the queen of dark magic.<br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene4.jsp">
<input type=submit id="button" name = Chap4S3 value = "Return to Scene 4">
</form>

<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene1.jsp">
<input type=submit id="button" name = Chap4S5 value="Go to Chapter 5">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/victory.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>