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
var vc, vctx, city,nx;
var ctr =0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		city = document.getElementById("city");
		vctx.drawImage(city,0,0,1600,1000,0,0,640,480);
		show();
	}
	
	function show(){
		ignite = setInterval("darkworld()",200);
	}
	function darkworld(){
		if (ctr > 4) ctr = 0; else ctr++;
		nx = 1600 *ctr;
		vctx.drawImage(city,nx,0,1600,1000,0,0,640,480);
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
<img class="img" id="city" alt="" src="images/cityonhold.png"></div>

<div id="right">
<h2>Chapter 1: Napoleonithe Before</h2>
<h3>Scene 3: On Hold</h3>
<div id="caption"><p><br>
The cycle continued for years, until the New Worlders dominated the<br>
whole country. The three major states of the country were headed by<br>
the Culprit Bosses, a group of sadistic magic enforcers who spearhead<br>
implementing binding laws within the states. They are known to be very<br>
ruthless dictators who disregard morals. Morality for them is being<br>
able to obtain their desires that originated from their greed. Whoever<br>
gets in their way either dies. . . or dies.
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene2.jsp">
<input type=submit id="button" name = Chap1S1 value = "Return to Scene 2">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene4.jsp">
<input type=submit id="button" name = Chap1S3 value="Go to Scene 4">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/onhold.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>