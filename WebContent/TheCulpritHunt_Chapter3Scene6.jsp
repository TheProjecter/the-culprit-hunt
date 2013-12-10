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

var vc, vctx, vi1, vi2, vi3, vi4;
var dax=0;
var counter=0;
var counter2=0;

function init(){
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	imgpos=vc.width*.3;
	vi1 = document.getElementById("bg");
	vi2 = document.getElementById("john1");
	vi3 = document.getElementById("john2");
	vi4 = document.getElementById("john3");
	vctx.drawImage(vi1,0,0,800,480,-100,0,800,580);
	s1=setInterval("move()",200);
}
	
function move(){
	if(counter>=3){counter=0;}
	else{
		dax=800*counter;
		vctx.drawImage(vi1,dax,0,800,480,-100,0,800,580);			
		counter++;
		}
	s2=setInterval("drawJohn()",3000);
}


var alpha=0.0;
vctx.globalAlpha=alpha;

function drawJohn(){
	clearInterval(s1);
	if(alpha<1.0){
		alpha=alpha+0.1;
		vctx.globalAlpha=alpha;
		vctx.drawImage(vi1,dax,0,800,480,-100,0,800,580);
		vctx.drawImage(vi2,0,0,200,350,200,150,200,350);	
		}
		else if(alpha>1.0){
			dax=0;
			if(counter<7){
			dax=200*counter;
			vctx.drawImage(vi2,dax,0,200,350,200,150,200,350);
			counter++;
			}
			else if(counter>=7){
				tunnelJohn();
			}
		}
	
	
	
}


function tunnelJohn(){
	clearInterval(s2);
	if(counter2<6){
	dax=600*counter2;
	vctx.drawImage(vi3,dax,0,600,480,0,0,600,480);
	counter2++;
	}
	else{
		counter2=0;
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
<img class="img" id="bg" alt="" src="images/CS3S6bg.png" width="800" height="480">
<img class="img" id="john1" alt="" src="images/CS3S6.png" width="800" height="480">
<img class="img" id="john2" alt="" src="images/CS3S6a.png" width="600" height="480">
<img class="img" id="john3" alt="" src="images/CS3S6b.png" width="600" height="480">
</div>


<div id="right">

<h2>Chapter 3: First Blood</h2>
<h3>Scene 6: Deuce Vengeauce</h3>


<div id="caption"><p>
For John, he knows that this is his stepping stone towards winning the first part of his plan. <br>
His first mission required him to traverse the heart of Luzan. He met with some people who hated Crackerjacker just as the same. They provided John with all the information he needs, starting from the essential tools that he will use to defeat Crackerjacker, to how to extract the first Gem of Visage.
</p></div>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene7.jsp">
<input type=submit id="button" name=Chap1S1 value = "Go to Scene 7">
</form>


<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene5.jsp">
<input type=submit id="button" name=Chap1S1 value = "Return to  Scene 5">
</form>



</div>
</div>

</body>
</html>