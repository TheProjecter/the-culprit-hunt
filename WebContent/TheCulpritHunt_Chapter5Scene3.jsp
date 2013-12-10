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
var vc, vctx, river,improving,improved,nx;
var uni, first,second,third;
var ctr =0;
var ga = 0.0;
var timerId = 0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		river = document.getElementById("river");
		improving = document.getElementById("improving");
		improved = document.getElementById("improved");
		drought = document.getElementById("drought");
		paradise = document.getElementById("paradise");
		vctx.drawImage(river,0,0,636,385,0,0,640,480);
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
			vctx.drawImage(improving,0,0,550,420,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(improving,0,0,550,420,0,0,640,480);
			    fade2();
		    }
		    
		}
	
	
	
	function fade2(){
		ga = 0.0;
		timeId =0;
		clearInterval(uni);
		first = setInterval("fadeIn2()",1000);
	}
	vctx.globalAlpha = ga;
	function fadeIn2()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(improved,0,0,997,761,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(improved,0,0,997,761,0,0,640,480);
			    fade3();
		    }
		    
		}

	function fade3(){
		ga = 0.0;
		timeId =0;
		clearInterval(first);
		second = setInterval("fadeIn3()",1000);
	}
	vctx.globalAlpha = ga;
	function fadeIn3()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(drought,0,0,698,798,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(drought,0,0,698,798,0,0,640,480);
			    fade4();
		    }
		    
		}
	function fade4(){
		ga = 0.0;
		timeId =0;
		clearInterval(second);
		third = setInterval("fadeIn4()",1000);
	}
	vctx.globalAlpha = ga;
	function fadeIn4()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(paradise,0,0,1024,819,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(paradise,0,0,1024,819,0,0,640,480);
			    stop();
		    }
		    
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
<img class="img" id="river" alt="" src="images/river.png" width="640" height="480">
<img class="img" id="improving" alt="" src="images/river2.png" width="640" height="480">
<img class="img" id="improved" alt="" src="images/river3.png" width="640" height="480">
<img class="img" id="drought" alt="" src="images/drought.gif" width="640" height="480">
<img class="img" id="paradise" alt="" src="images/paradise.jpg" width="640" height="480">
</div>

<div id="right">
<h2>Chapter 5: Of the Hardest Battles</h2>
<h3>Scene 3: Health is Back</h3>
<div id="caption"><p>
The Culprit Council is composed of several old New Worlders who are very powerful. It is believed that after all the Gems of Visage and the death of<br>
the Culprit Bosses, the strength of their power will
be seriously depleted. It can be felt all throughout
the entire Napoleonithe. The dark clouds started to
brighten up, the fields had a tinge of green. The breeze 
slowly regained its sense of freshness. The waters
started to be relived, the clarity slowly manifesting.
It is time. John said, while preparing for the
culminating part of his battle.
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene2.jsp">
<input type=submit id="button" name = Chap5S1 value = "Return to Scene 2">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene4.jsp">
<input type=submit id="button" name = Chap5S3 value="Go to Scene 4">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/paradise.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>