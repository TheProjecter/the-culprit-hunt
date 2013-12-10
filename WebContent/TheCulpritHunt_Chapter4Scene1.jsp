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
var vc, vctx, theplan, justbg,map,nx, uni;
var ctr =0;
var ga = 0.0;
var timerId = 0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		theplan = document.getElementById("theplan");
		justbg = document.getElementById("justbg");
		map = document.getElementById("map");
		vctx.drawImage(justbg,0,0,600,480,0,0,640,480);
		show();
	}
	
	function show(){
		first = setInterval("johninrage()",400);
	}
	function johninrage(){
		if (ctr < 29) ctr++;
		nx = 600 *ctr;
		vctx.drawImage(justbg,0,0,600,480,0,0,640,480);
		vctx.drawImage(theplan,nx,0,600,480,0,0,640,480);
		if (ctr == 29) {fade();}
	}
	function fade(){
		clearInterval(first);
		uni = setInterval("fadeIn()",500);
	}
	vctx.globalAlpha = ga;
	function fadeIn()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(map,0,0,1024,640,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(map,0,0,1024,640,0,0,640,480);
			    stop();
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
<img class="img" id="theplan" alt="" src="images/theplan.png" width="640" height="480">
<img class="img" id="justbg" alt="" src="images/justbg.png" width="640" height="480">
<img class="img" id="map" alt="" src="images/map.png" width="640" height="480">
</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 1: The Unexpected Ally</h3>
<div id="caption"><p>
The location of Jackhalgar was very far from Crackerjacker.<br>
He was based in the state of Visey that is miles away from Luzan.<br>
On his way to Visey, John again studied and prepared for his next attack.<br>
He met Dewey, a worker in the office Jackhalgar who hated the Boss secretly.<br>
Dewey and John connived for weeks, about the whereabouts of Jackhalgar,<br>
what his routines are, how he is as a wicked, evil boss.<br>
</p></div>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene7.jsp">
<input type=submit id="button" name = Chap3S6 value = "Return to Chapter 3">
</form>
<br>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene2.jsp">
<input type=submit id="button" name = Chap4A2 value = "Go to Alternate Scene 2">
</form>
<br>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene2.jsp">
<input type=submit id="button" name = Chap4S1 value="Go to Scene 2">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/ally.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>