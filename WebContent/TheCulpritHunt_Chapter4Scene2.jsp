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
		halgar = document.getElementById("halgar");
		soldiers = document.getElementById("soldiers");
		brick = document.getElementById("brick");
		vctx.drawImage(halgar,0,0,540,460,0,0,640,480);
		show();
	}
	
	function show(){
		first = setInterval("itshalgar()",2500);
	}
	function itshalgar(){
		if (ctr < 3) ctr++;
		nx = 540 *ctr;
		vctx.drawImage(halgar,nx,0,540,460,0,0,640,480);
		if (ctr == 3) {fade();}
	}
	function fade(){
		clearInterval(first);
		uni = setInterval("fadeIn()",700);
	}
	vctx.globalAlpha = ga;
	function fadeIn()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(brick,0,0,948,399,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(soldiers,0,0,948,399,0,0,640,480);
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
<img class="img" id="halgar" alt="" src="images/halgar.png" width="640" height="480">
<img class="img" id="soldiers" alt="" src="images/soldiers.png" width="640" height="480">
<img class="img" id="brick" alt="" src="images/brick.png" width="640" height="480">
</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 2: It is JackHalgar</h3>
<div id="caption"><p>
Jackhalgar is the weakest among all the three bosses, physically.<br>
However, he is deemed to be the smartest among them, which was why<br>
most of the strategic evil plans were assigned to him. John knew his<br>
next fight was not going to be as easy as his first. Due to the slaying<br>
of Crackerjacker, Jackhalgar had to hire more protectors and granted them<br>
with more power.<br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene1.jsp">
<input type=submit id="button" name = Chap3S7 value = "Return to Scene 1">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene3.jsp">
<input type=submit id="button" name = Chap4S2 value="Go to Scene 3">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/halgar.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>