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
var vc, vctx ,invention,overload,explosion;
var first, second,nx,uni;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	office = document.getElementById("office");
    vctx.drawImage(office,0,0,580,486,0,0,640,480);
	overload = document.getElementById("overload");
	vctx.drawImage(overload,0,0,300,300,200,350,250,130);
	explosion = document.getElementById("explosion");
	onfire = document.getElementById("onfire");
	show();
}
var ctr = 0;
var ga = 0.0;
var timerId = 0;

function show(){
	first = setInterval("danger()",4000);
}
function danger(){
	if (ctr < 4) {ctr++;
	nx = 300*ctr;
	vctx.drawImage(overload,nx,0,300,300,200,350,250,130);}
	if(ctr == 3){
		fade();
	}
}
function fade(){
	ctr = 0;
	clearInterval(first);
	second = setInterval("fadeIn()",100);
}
function fadeIn()
	{
	    if (ctr < 5){ctr++;
	    nx = 192*ctr;
	    vctx.drawImage(explosion,nx,0,192,192,-700,-200,2000,800);
	    }
	    if (ctr == 5)
	    {
		    fadefire();
	    }
	    
	}

function fadefire(){
	clearInterval(second);
	uni = setInterval("fadeing()",500);
}
vctx.globalAlpha = ga;
function fadeing()
	{
	    if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
		vctx.drawImage(onfire,0,0,545,365,0,0,640,480);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(onfire,0,0,545,365,0,0,640,480);
		    stop();
	    }
	    
	}
	
function stop(){
	clearInterval(lost);
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
<img class="img" id="office" alt="" src="images/office.png">
<img class="img" id="overload" alt="" src="images/overload.png">
<img class="img" id="explosion" alt="" src="images/explosion.png">
<img class="img" id="onfire" alt="" src="images/onfire.jpg">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 4: The Explosion</h3>
<div id="caption"><p>
The influential people over used the new creation and due to huge amount<br>
of energy, the instrument exploded and started a fire. The office where the<br>
explosion happened was so near to the village where John and his family lives.<br>
The fire scattered so fast as it reached their house, it got burned so fast<br>
and most of his relatives and also his mother was burnt inside the house.<br>
The whole village was turned into ash and a lot of people died<br>
because of this huge fire. John did not have any idea about this,<br>
the grudge and damage done is yet to come.
<br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene3.jsp">
<input type=submit id="button" name = Chap2S2 value = "Return to Scene 3">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene5.jsp">
<input type=submit id="button" name = Chap2S4 value="Go to Scene 5">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/explosion.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>