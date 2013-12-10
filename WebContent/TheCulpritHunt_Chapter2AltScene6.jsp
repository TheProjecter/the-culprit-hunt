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
var vc, vctx ,therevenge;
var first, second,nx;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	therevenge = document.getElementById("therevenge");
    vctx.drawImage(therevenge,0,0,588,497,0,0,640,480);
	show();
}
var ctr = 0;

function show(){
	first = setInterval("applying()",700);
}
function applying(){
	if (ctr > 19) ctr=0; else ctr++;
	nx = 588*ctr;
	vctx.drawImage(therevenge,nx,0,588,497,0,0,640,480);
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
<img class="img" id="therevenge" alt="" src="images/revenge.png">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 6: The Revenge!</h3>
<div id="caption"><p>
John graduated high school with honors but wasn't able to pursue college.<br>
Because of this event, Macs decided to fight for his right, to have his<br>
work back. But the heartless boss of the company didn't allow it to happen.<br>
He sent his people to capture Macs and execute him. John heard of this and<br>
tried to interrupt the plan, but he came too late. Macs was already dying<br>
and he wasn't able to do anything to save his friend, his brother. As John<br>
saw the dying body of Macs, he quickly ran into him, picked him up and sent<br>
him to the nearest hospital. Only in the ambulance were the last words of Macs,<br>
"Brother, my family, keep them safe." After that, Macs was out of breath and<br>
died. John cannot control his emotions and cried full of anger saying, "I'll<br>
revenge for you brother. This is enough!"
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2AltScene5.jsp">
<input type=submit id="button" name = Chap2A5 value = "Return to Alternate Scene 5">
</form>

<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene1.jsp">
<input type=submit id="button" name = Chap2S5 value="Go to Chapter 3">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/job.mp3" type="audio/mpeg" autoplay="true"></source>
</audio>
</body>
</html>