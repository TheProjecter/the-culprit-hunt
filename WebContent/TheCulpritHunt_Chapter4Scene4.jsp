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
var vc, vctx, warp,battle,blood,nx, uni;
var ctr =0;
var ga = 0.0;
var timerId = 0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		warp = document.getElementById("warp");
		battle = document.getElementById("battle");
		blood = document.getElementById("blood");
		vctx.drawImage(warp,0,0,1024,819,0,0,640,480);
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
			vctx.drawImage(battle,0,0,540,460,0,0,640,480);
		    }
		    else if (ga > 1.0){
		    	vctx.drawImage(battle,0,0,540,460,0,0,640,480);
		    	show();
		    }
			    
		    
		}
	
	function show(){
		clearInterval(uni);
		first = setInterval("slay()",500);
	}
	function slay(){
		if (ctr < 7) ctr++;
		nx = 540*ctr;
		vctx.drawImage(battle,nx,0,540,460,0,0,640,480);
		if (ctr == 7){
			shed();
		}
		
	}
	function shed(){
		ga = 0.0;
		timerId = 0;
		clearInterval(first);
		defeat = setInterval("splat()",10);
	}
	vctx.globalAlpha = ga;
	function splat()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(blood,0,0,597,539,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
		    	vctx.drawImage(blood,0,0,597,539,0,0,640,480);
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
<img class="img" id="warp" alt="" src="images/warp.jpg" width="640" height="480">
<img class="img" id="battle" alt="" src="images/battle.png" width="640" height="480">
<img class="img" id="blood" alt="" src="images/blood.gif" width="640" height="480">

</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 4: The Battle</h3>
<div id="caption"><p>
Unfortunately for John, despite not having any protector, Jackhalgar set up traps<br>
outside his room for further security. John, not being able to foresee this, almost<br>
fell for the traps. Using several tools that he got from fighting all the other<br>
guards, he dismantled the traps. Jackhalgar, predicting that someone has gotten<br>
past his traps, was startled. He is totally unprepared to battle which makes<br>
his situation even worse. I guess, you are not that clever after all. John said<br>
before slaying the boss. Blood splattered everywhere. With each blow against the<br>
enemy, John felt empowered and fulfilled.<br>
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene3.jsp">
<input type=submit id="button" name = Chap4S2 value = "Return to Scene 3">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene5.jsp">
<input type=submit id="button" name = Chap4S4 value="Go to Scene 5">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/battle.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>