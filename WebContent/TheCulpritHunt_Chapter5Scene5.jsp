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
	avictory = document.getElementById("avictory");
	destroy = document.getElementById("destroy");
	work = document.getElementById("working");
	vctx.drawImage(avictory,0,0,590,490,0,0,640,480);
	startup();
}
var ctr = 0;
var ga = 0.0;
var timerId = 0;


function startup(){
	third = setInterval("fighting()",1000);
}
function fighting(){
	if (ctr < 9) {ctr++;
	nx = 590*ctr;
	vctx.drawImage(avictory,nx,0,590,490,0,0,640,480);}
	if(ctr == 9){
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
	    vctx.drawImage(destroy,0,0,370,490,0,0,640,480);
	    }
	    else if (ga > 1.0)
	    {
		    vctx.drawImage(destroy,0,0,370,490,0,0,640,480);
		    show();
	    }
	    
	}

function show(){
	ctr =0;
	clearInterval(uni);
	first = setInterval("destroying()",700);
}
function destroying(){
	if (ctr < 11) {ctr++;
	nx = 370*ctr;
	vctx.drawImage(destroy,nx,0,370,490,0,0,640,480);}
	if(ctr == 11){
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
<img class="img" id="avictory" alt="" src="images/avictory.png">
<img class="img" id="destroy" alt="" src="images/destroy.png">
<img class="img" id="working" alt="" src="images/johnworking.png">
</div>

<div id="right">
<h2>Chapter 5: The Hardest of Battles</h2>
<h3>Scene 5: The Defeat and Triumph</h3>
<div id="caption"><p>
So we reach this part, do we? , John said.<br>
No, John, let us explain. One of the culprits pleaded.<br>
The battle started, John instantly slayed all the council<br>
members. After everything, he broke the gems of visage<br>
that symbolizes obtaining their freedom once more.<br>
John knows that this is not the end. For sure, the<br>
New Worlders will send reinforcements, but for now he<br>
is satisfied that he has avenged his family and all the<br>
people that were oppressed.
</p></div>

<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene4.jsp">
<input type=submit id="button" name = Chap5S3 value = "Return to Scene 4">
</form>


<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %> id="right">
<input type="hidden" name="page" value="tch_ending.jsp">
<input type=submit id="button" name = Chap5S3 value = "Ending">
</form>

<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/destroy.mp3" type="audio/mpeg" autoplay="true">
</audio>

</body>
</html>