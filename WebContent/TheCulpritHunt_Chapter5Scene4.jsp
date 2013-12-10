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
		castle = document.getElementById("castle");
		bosses = document.getElementById("bosses");
		culpritboss = document.getElementById("culpritboss");
		bolt= document.getElementById("bolt");
		culbosses = document.getElementById("culbosses");
		vctx.drawImage(castle,0,0,1000,560,0,0,640,480);
		fade();
	}
	function fade(){
		uni = setInterval("fadeIn()",1200);
	}
	vctx.globalAlpha = ga;
	function fadeIn()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(bosses,0,0,639,576,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(bosses,0,0,639,576,0,0,640,480);
			    fade2();
		    }
		    
		}
	
	
	
	function fade2(){
		ga = 0.0;
		timeId =0;
		clearInterval(uni);
		first = setInterval("fadeIn2()",1200);
	}
	vctx.globalAlpha = ga;
	function fadeIn2()
		{
		    if (ga <1.0){
		    vctx.globalAlpha = ga;
		    ga = ga + 0.1;
			vctx.drawImage(culpritboss,0,0,640,480,0,0,640,480);
		    }
		    else if (ga > 1.0)
		    {
			    vctx.drawImage(culpritboss,0,0,640,480,0,0,640,480);
			    show();
		    }
		    
		}
	function show(){
		clearInterval(first);
		vctx.drawImage(bolt,0,0,1023,851,0,0,640,480);
		vctx.drawImage(culbosses,0,0,640,480,0,0,640,480);
		second = setInterval("thunder()",500);
	}
	function thunder(){
		if (ctr > 3) ctr=0; 
		else ctr++;
		nx = 1023 *ctr;
		vctx.drawImage(bolt,nx,0,1023,851,0,0,640,480);
		vctx.drawImage(culbosses,0,0,640,480,0,0,640,480);
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
<img class="img" id="castle" alt="" src="images/castle.jpg" width="640" height="480">
<img class="img" id="bosses" alt="" src="images/bosses.png" width="640" height="480">
<img class="img" id="culpritboss" alt="" src="images/culpritboss.png" width="640" height="480">
<img class="img" id="bolt" alt="" src="images/bolt.png" width="640" height="480">
<img class="img" id="culbosses" alt="" src="images/culbosses.png" width="640" height="480">
</div>

<div id="right">
<h2>Chapter 5: The Redemtion of Napoleonithe</h2>
<h3>Scene 4: The Culprit Council</h3>
<div id="caption"><p>
John went ahead to the Council Kingdom. One of the darkest<br>
places in Napoleonithe. The warmth slowly enveloped his body,<br>
he knew that it was a good sign as compared to the badly dense<br>
and cold temperature that once dominated them. In the mind of John,<br>
he knows that in a few moments, he can finally fulfill his mission,<br>
to avenge his family and the people who were oppressed by the<br>
domination of The New Worlders.
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene3.jsp">
<input type=submit id="button" name = Chap5S2 value = "Return to Scene 3">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene5.jsp">
<input type=submit id="button" name = Chap5S4 value="Go to Scene 5">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/battle.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>