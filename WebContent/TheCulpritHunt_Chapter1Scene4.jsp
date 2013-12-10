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
var vc, vctx ,comic,cojuanterra,crackerjacker,fraudemonia,darkcity,thunder;
var first,second,third,last,nx;
var ctr = 0;
var ga = 0.0;
var timerId = 0;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	comic = document.getElementById("thecomic");
	vctx.drawImage(comic,0,0,640,480,0,0,640,480);
	cojuanterra = document.getElementById("cojuanterra");
	crackerjacker = document.getElementById("crackerjacker");
	fraudemonia = document.getElementById("fraudemonia");
	darkcity = document.getElementById("darkcity");
	thunder = document.getElementById("thunder");
	show();
}

function show(){
	first = setInterval("cj()",400);
}
function cj(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(comic,640,0,640,480,0,0,640,480);
	    vctx.drawImage(cojuanterra,0,0,432,450,-30,180,220,300);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(comic,640,0,640,480,0,0,640,480);
		    vctx.drawImage(cojuanterra,0,0,432,450,-30,180,220,300);
		    show2();
	    }
}
function show2(){
	ga = 0.0;
	timerId = 0;
	clearInterval(first);
	second = setInterval("cj2()",300);
}
function cj2(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(comic,1280,0,640,480,0,0,640,480);
	    vctx.drawImage(crackerjacker,0,0,2550,3300,395,130,280,400);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(comic,1280,0,640,480,0,0,640,480);
		    vctx.drawImage(crackerjacker,0,0,2550,3300,395,130,280,400);
	    	show3();
	    }
}

function show3(){
	ga = 0.0;
	timerId = 0;
	clearInterval(second);
	third = setInterval("fd()",500);
}
function fd(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(comic,1920,0,640,480,0,0,640,480);
	    vctx.drawImage(fraudemonia,0,0,2550,3300,120,-20,400,400);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(comic,1920,0,640,480,0,0,640,480);
		    vctx.drawImage(fraudemonia,0,0,2550,3300,120,-20,400,400);
		    show4();
	    }
}
function show4(){
	ga = 0.0;
	timerId = 0;
	clearInterval(third);
	last = setInterval("thecity()",500);
}
function thecity(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(darkcity,0,0,1280,1024,0,0,640,480);
	    vctx.drawImage(cojuanterra,0,0,432,450,-10,130,260,300);
	    vctx.drawImage(crackerjacker,0,0,2550,3300,340,30,340,500);
	    vctx.drawImage(fraudemonia,0,0,2550,3300,100,20,340,250);
	    }
	    else if (ga > 1.0)
	    {
		vctx.drawImage(darkcity,0,0,1280,1024,0,0,640,480);
		vctx.drawImage(cojuanterra,0,0,432,450,-10,130,260,300);
		vctx.drawImage(crackerjacker,0,0,2550,3300,340,30,340,500);
		vctx.drawImage(fraudemonia,0,0,2550,3300,100,20,340,250);
		show5();
	    }
}
function show5(){
	clearInterval(last);
	kidlat = setInterval("thundz()",300);
}
function thundz(){
	if (ctr > 4) ctr =0; ctr++;
	nx = 800*ctr;
	vctx.drawImage(thunder,nx,0,800,400,0,0,640,480);
	vctx.drawImage(cojuanterra,0,0,432,450,-10,130,260,300);
	vctx.drawImage(crackerjacker,0,0,2550,3300,340,30,340,500);
	vctx.drawImage(fraudemonia,0,0,2550,3300,100,20,340,250);
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
<img class="img" id="thecomic" alt="" src="images/comictrio.png">
<img class="img" id="fraudemonia" alt="" src="images/Fraudemonia3.png">
<img class="img" id="cojuanterra" alt="" src="images/Cojuanterra1.png">
<img class="img" id="crackerjacker" alt="" src="images/Crackerjacker.png">
<img class="img" id="darkcity" alt="" src="images/dark-city.jpg">
<img class="img" id="thunder" alt="" src="images/C3S4.png">
</div>

<div id="right">
<h2>Chapter 1: Napoleonithe Before</h2>
<h3>Scene 4: The Invasion</h3>
<div id="caption"><p>
These Culprit Bosses main bosses are the Culprit Council.<br>
They are composed of the oldest New Worlders, the ones who<br>
pioneered dominating Napoleonithe. They supervise the activities<br>
in a nationwide scale; they are the ones responsible for signing and<br>
implementing the laws in the entire country. In other words,<br>
the Culprit Council governs the entire country of Napoleonithe.<br>
<br>
&quot;<b>
Is it really possible to find a spark in the most hopeless place?
</b>&quot;
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene3.jsp">
<input type=submit id="button" name = Chap1S2 value = "Return to Scene 3">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene1.jsp">
<input type=submit id="button" name = Chap1S4 value="Go to Chapter 2">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop> <source src ="sounds/theculprits.mp3" type="audio/mpeg" autoplay="true"></audio>
</body>
</html>