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
var vc, vctx ,car;
var first, second,nx;
function init() {
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	sword = document.getElementById("sword");
    vctx.drawImage(sword,0,0,632,493,0,0,640,480);
	show();
}
var ctr = 0;

function show(){
	first = setInterval("applying()",1000);
}
function applying(){
	if (ctr > 7) ctr=0; else ctr++;
	nx = 632*ctr;
	vctx.drawImage(sword,nx,0,632,493,0,0,640,480);
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
<img class="img" id="sword" alt="" src="images/thesword.png">
</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 5: The Spark Sword</h3>
<div id="caption"><p>
The power of spark came into John and he started to charge<br>
in energy. He ran into the gates and held on to the metal<br>
grills. He used his shock power to create a powerful electric<br>
metal sword to battle Jackhalgar's soldiers together with Dewey. 
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene4.jsp">
<input type=submit id="button" name = Chap4A4 value = "Return to Alternate Scene 4">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene6.jsp">
<input type=submit id="button" name = Chap4A6 value="Go to Alternate Scene 6">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/job.mp3" type="audio/mpeg" autoplay="true"></source>
</audio>
</body>
</html>