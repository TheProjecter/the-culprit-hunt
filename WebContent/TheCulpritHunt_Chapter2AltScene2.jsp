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
var vc, vctx ,acceptance;
var first, second,nx;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	acceptance = document.getElementById("acceptance");
    vctx.drawImage(acceptance,0,0,597,497,0,0,640,480);
	show();
}
var ctr = 0;

function show(){
	first = setInterval("applying()",400);
}
function applying(){
	if (ctr > 26) ctr=0; else ctr++;
	nx = 597*ctr;
	vctx.drawImage(acceptance,nx,0,597,497,0,0,640,480);
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
<img class="img" id="acceptance" alt="" src="images/accepted.png">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 2: The Awaited Acceptance</h3>
<div id="caption"><p>
After all the hardwork, perseverance, and a ton of patience, John was<br>
accepted by a big time company. John passed all the qualification<br>
examinations and was given an excellent grade on his interview. He then<br>
received the position of automobile maintenance crew for the IDK Company.<br>
John works 8 hours a day and do work overtime to receive a larger salary<br>
to provide for his family.  
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene1.jsp">
<input type=submit id="button" name = Chap1S4 value = "Return to Scene 1">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2AltScene3.jsp">
<input type=submit id="button" name = Chap2A3 value="Go to Alternate Scene 3">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/job.mp3" type="audio/mpeg" autoplay="true"></source>
</audio>
</body>
</html>