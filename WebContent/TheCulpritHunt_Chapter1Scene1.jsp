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
var vc, vctx, vi1, vi2, stopanim;
var dax=0; counter=0; sizew=100; sizeh=100; moveleft = 400;
var x=-100;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		vi1 = document.getElementById("background");
		vi2 = document.getElementById("bg1");
		vctx.drawImage(vi1,0,0,800,480);
		vctx.drawImage(vi2,0,0,800,480);
		setInterval("animation()",15);
		startanim();

	}
	
	

	function startanim(){
		if(stopanim != null) clearInterval(stopanim);
		stopanim = setInterval("animation()",15);
	}
	function stopanim1(){
		clearInterval(stopanim);
	}

	function animation(){
		vctx.drawImage(vi1,0,0,600,480);
		if (x<vc.width){
			vctx.drawImage(vi2,x,0,600,480);
			x++;
		}
		else{
			x=-600;
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
<canvas id="canvas" width="600" height="480" style="border-bottom: 15px solid #000; border-top: 15px solid #000;">Browser does not Support HTML 5</canvas>
<img class="img" id="background" alt="" src="images/destroyed.png" width="800" height="480">
<img class="img" id="bg1" alt="" src="images/smoke.png" width="800" height="480">
</div>

<div id="right">
<h2>Chapter 1: Napoleonithe Before</h2>
<h3>Scene 1: Hopelessness</h3>
<div id="caption"><p>&quot;<b>This place is hopeless.</b>&quot;<br><br>
That is how most of the citizens of Napoleonithe would describe their country. What used to be a place for peace and unity, 50 years ago, now turned as a realistic hell, pestered by evil magic, corruption, greed, and envy. It is a place where the rich get richer, and the poor get poorer. The epitome of damnation, in other words.
</p></div>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene2.jsp">
<input type=submit id="button" name=Chap1S1 value = "Go to Scene 2">
</form>
<br><br><br><br><br><br><br>

</div>
</div>
<audio controls autoplay hidden loop>
<source src ="sounds/paradise.mp3" type="audio/mpeg" autoplay="true">
</audio>
</body>
</html>