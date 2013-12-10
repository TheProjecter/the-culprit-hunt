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
var vc, vctx ,discrimination;
var first, second,nx;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	discrimination = document.getElementById("discrimination");
    vctx.drawImage(discrimination,0,0,580,486,0,0,640,480);
	show();
}
var ctr = 0;

function show(){
	first = setInterval("applying()",400);
}
function applying(){
	if (ctr > 18) ctr=0; else ctr++;
	nx = 580*ctr;
	vctx.drawImage(discrimination,nx,0,580,486,0,0,640,480);
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
<img class="img" id="discrimination" alt="" src="images/appdenied.png">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 2: Discrimination</h3>
<div id="caption"><p>
John graduated high school with honors but wasn't able to pursue college.<br>
It doesn't stop John because he know he has the great knowledge about cars,<br>
electrical stuff, and machines. He applied for several companies but was not<br>
accepted. He wanted to follow the footsteps of his father who was before a<br>
Car Mechanic. But because of the unending discrimination in the society,<br>
he ended up working in a small machine shop as a helper.  
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene1.jsp">
<input type=submit id="button" name = Chap1S4 value = "Return to Scene 1">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene3.jsp">
<input type=submit id="button" name = Chap2S2 value="Go to Scene 3">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/job.mp3" type="audio/mpeg" autoplay="true"></source>
</audio>
</body>
</html>