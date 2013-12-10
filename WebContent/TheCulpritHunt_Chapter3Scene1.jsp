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
var vc, vctx, vi1, vi2, vi3, ani;
var dax=629; counter=0; 
var xLoc=629;
var x=-100;

var imgpos=0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		imgpos=vc.width*.11;
		vi1 = document.getElementById("sleep1");
		vctx.drawImage(vi1,0,0,629,476,0,0,629,480);
		setInterval("showImg()",200);
		//startanim();

	}

	
	function showImg(){
		if(counter>=3){counter=0;}
		else{
			dax=629*counter;
			vctx.drawImage(vi1,dax,0,629,476,0,0,629,480);
			counter++;}
		
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
<img class="img" id="sleep1" alt="" src="images/C3S1.png" width="800" height="480">


</div>

<div id="right">
<h2>Chapter 3: First Blood</h2>
<h3>Scene 1: Restlessness</h3>


<div id="caption"><p>The next few months were very excruciating for John. The mixture of anger, sorrow, and longing, to him, was not the best combination. 
He experienced long sleepless nights with nightmares. The image of his family always has always haunted him, making him more eager to seek for revenge. </p></div>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene5.jsp">
<input type=submit id="button" name = Chap2S4 value = "Return to Chapter 2">
</form>
<br>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2AltScene6.jsp">
<input type=submit id="button" name = Chap2A6 value = "Return to Alternate Chapter 2">
</form>
<br>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene2.jsp">
<input type=submit id="button" name = Chap3S1 value="Go to Scene 2">
</form>
<br><br><br><br><br><br><br><br><br><br>
</div>
</div><div>
</body>
</html>