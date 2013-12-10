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
var vc, vctx ,house ,waving,nx,room,x,mul,inc,inc2, janetime;
var johnspark;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	house = document.getElementById("sparkhouse");
	vctx.drawImage(house,0,0,600,477,0,0,640,480);
	waving = document.getElementById("wave");
	jane = document.getElementById("jane");
	show();
}
var ctr = 0;
var ga = 0.0;
var timerId = 0;

function show(){
	view = setInterval("home()",700);
}
function home(){
	if (ctr < 6) ctr++;
	mul = 50*ctr;
	inc = 480 + mul;
	inc2 = 640 + mul;
	vctx.drawImage(house,0,0,600,477,0,0,inc2,inc);
	if (ctr == 6){
		firstfade();
	}
}
function firstfade(){
	clearInterval(view);
	johnspark = setInterval("firstfadeIn()",400);
}
vctx.globalAlpha = ga;
function firstfadeIn()
	{
	    if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(waving,0,0,600,475,0,0,640,480);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(waving,0,0,600,475,0,0,640,480);
	    	start();
	    }
	    
	}

function start(){
	ctr=0;
	ga = 0.0;
	timerId = 0;
	clearInterval(johnspark);
	begin = setInterval("johnwave()",180);
}

function johnwave(){
	if (ctr < 7) ctr++; 
	nx = 600*ctr;
	vctx.drawImage(waving,nx,0,600,475,0,0,640,480);
	if(ctr==7){
	fade();}
}	
function fade(){
	clearInterval(begin);
	janetime = setInterval("fadeIn()",400);
}

function fadeIn()
	{
	    if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(jane,0,0,600,475,0,0,640,480);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(jane,0,0,600,475,0,0,640,480);
	    	janeIn();
	    }
	    
	}
function janeIn(){
	ctr = 0;
	clearInterval(janetime);
	jocastime = setInterval("introjane()",180);
}

function introjane(){
	if (ctr < 13) ctr++;
	nx = 600*ctr;
    vctx.drawImage(jane,nx,0,600,475,0,0,640,480);
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
<img class="img" id="sparkhouse" alt="" src="images/sparkhome.png">
<img class="img" id="wave" alt="" src="images/johnwave.png">
<img class="img" id="jane" alt="" src="images/janeintroduce.png">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 1: The Spark Family</h3>
<div id="caption"><p>
A small house made of visibly old materials and furnished by<br>
antique items all around. John lives in an extended happy family,<br>
but are having problems because of the number of people that needs<br>
to be fed, to be educated, and to be paid of their needs. John, 22,<br>
is the eldest of three children and has two siblings,<br>
Jane and Jocas ages 17 and 14.
</p></div>
<form method="post" action="Dispatch" >
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene4.jsp">
<input type=submit id="button" name = Chap1S3 value = "Return to Chapter 1">
</form>
<br>
<form method="post" action="Dispatch" >
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2AltScene2.jsp">
<input type=submit id="button" name = Chap2A2 value = "Go to Alternate Scene 2">
</form>
<br>
<form method="post" action="Dispatch" >
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene2.jsp">
<input type=submit id="button" name = Chap2S1 value="Go to Scene 2">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/thesparks.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>