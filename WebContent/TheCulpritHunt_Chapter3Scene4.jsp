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
var dax=0; counter=0; 
var x2=800;
var x=0;
var alpha=0.0;
var s1, s2;

var imgpos=0;

	function stopInterval(stop){
		if(stop!=null){
			clearInterval(stop);
		}
	
	}


	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		imgpos=vc.width*.3;
		vi1 = document.getElementById("harbor");
		vi2 = document.getElementById("bg");
		vctx.drawImage(vi2,0,0,800,480,0,0,800,580);
		s1=setInterval("move()",300);

	}


	function move(){
		
		if(counter>=3){counter=0;}
		else{
			dax=800*counter;
			vctx.drawImage(vi2,dax,0,800,480,0,0,800,580);			
			counter++;
			}
		//stopInterval(s1);
		s2=setInterval("showImg()",300);
	}
	
	
	
function showImg(){
		
		//stopInterval(s2);
		if(alpha<1.0){
			alpha=alpha+0.1;
			vctx.globalAlpha=alpha;
			vctx.drawImage(vi2,dax,0,800,480,0,0,800,580);	
			vctx.drawImage(vi1,80,0,500,857);
		}
		//vctx.drawImage(vi2,0,0,800,480,0,0,800,480);	
		vctx.drawImage(vi1,80,0,500,857);
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
<img class="img" id="bg" alt="" src="images/C3S4.png" width="500" height="480">
<img class="img" id="harbor" alt="" src="images/Harbor2.png" width="800" height="480">
</div>


<div id="right">

<h2>Chapter 3: First Blood</h2>
<h3>Scene 4: Crackerjacker</h3>


<div id="caption"><p>His first target was Crackerjacker, the Boss who instructed the bombing of Swineville. Located in the heart of the state of Luzan was his lair. With Crackerjacker was the first Gem of Visage, it is one of the three gems that is spread all throughout the country of Napoleonithe that is said to be the main source of power of the Culprit Bosses and the Culprit Council. </p></div>


<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene5.jsp">
<input type=submit id="button" name=Chap1S1 value = "Go to Scene 5">
</form>


<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene3.jsp">
<input type=submit id="button" name=Chap1S1 value = "Return to  Scene 3">
</form>


</div>
</div>

</body>
</html>