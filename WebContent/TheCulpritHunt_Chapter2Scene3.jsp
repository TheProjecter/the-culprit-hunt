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
var vc, vctx ,invention,powersaver,work;
var first, second,nx,third,uni;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	invention = document.getElementById("invention");
	powersaver = document.getElementById("powersaver");
	work = document.getElementById("working");
	vctx.drawImage(work,0,0,570,500,0,0,640,480);
	startup();
}
var ctr = 0;
var ga = 0.0;
var timerId = 0;


function startup(){
	third = setInterval("working()",400);
}
function working(){
	if (ctr < 17) {ctr++;
	nx = 570*ctr;
	vctx.drawImage(work,nx,0,570,500,0,0,640,480);}
	if(ctr == 17){
		fadeone();
	}
}
function fadeone(){
	clearInterval(third);
	uni = setInterval("fadeing()",500);
}
vctx.globalAlpha = ga;
function fadeing()
	{
	    if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(invention,0,0,620,488,0,0,640,480);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(invention,0,0,620,488,0,0,640,480);
		    show();
	    }
	    
	}

function show(){
	ctr =0;
	clearInterval(uni);
	first = setInterval("inventing()",200);
}
function inventing(){
	if (ctr < 7) {ctr++;
	nx = 620*ctr;
	vctx.drawImage(invention,nx,0,620,488,0,0,640,480);}
	if(ctr == 7){
		fade();
	}
}
function fade(){
	ga = 0.0;
	timerId =0;
	clearInterval(first);
	second = setInterval("fadeIn()",500);
}
vctx.globalAlpha = ga;
function fadeIn()
	{
	    if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(powersaver,0,0,300,300,380,100,150,200);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(powersaver,0,0,300,300,380,100,150,200);
		    stop();
	    }
	    
	}
function stop(){
	clearInterval(second);
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
<img class="img" id="invention" alt="" src="images/invention.png">
<img class="img" id="powersaver" alt="" src="images/powersaver.png">
<img class="img" id="working" alt="" src="images/johnworking.png">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 3: The Invention Spark</h3>
<div id="caption"><p>
He works hard day and night to be able to provide for his mother
<br>and siblings. Every after work, when he got home, he continues<br>
to work by assembling scrap materials he had in his small work room.<br>
Weeks have passed, through perseverance and patience in creating a<br>
functional machine, John was able to make an energy saving instrument. He was able to reduce the consumption of energy without sacrificing<br>
the use of their electrical devices, which give them a lot of savings.<br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene2.jsp">
<input type=submit id="button" name = Chap2S1 value = "Return to Scene 2">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene4.jsp">
<input type=submit id="button" name = Chap2S3 value="Go to Scene 4">
</form>
<br><br><br>

</div>
</div>


<audio controls autoplay hidden loop>
<source src ="sounds/theinvention.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>