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

var alpha2=0.0;

function init(){
	vc = document.getElementById("canvas");
	vctx = vc.getContext("2d");
	vi1 = document.getElementById("john1");
	vi2 = document.getElementById("john2");
	vi3 = document.getElementById("john3");
	vi4 = document.getElementById("fraudemonia");
	show();
}
	
var ga=0.0;
vctx.globalAlpha=ga;


function show(){
	first = setInterval("john1()",300);
}
function john1(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(vi1,0,0,600,480,0,0,600,480);
	    }
	    else if (ga > 1.0)
	    {
	    	vctx.drawImage(vi1,0,0,600,480,0,0,600,480);
		   show2();
	    }
}

function show2(){
	clearInterval(first);
	second = setInterval("moveJohn()",400);
}


function moveJohn(){
	
	if(counter<4){
		dax=600*counter;
		vctx.drawImage(vi1,dax,0,600,480,0,0,600,480);			
		counter++;
	}
	else{
		counter=0;
		show3();
	}
}


function show3(){
	ga = 0.0;
	timerId = 0;
	clearInterval(second);
	third = setInterval("johnAngry()",500);
}

function johnAngry(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(vi2,0,0,600,480,0,0,600,480);
	    }
	    else if (ga > 1.0)
	    {
	    	vctx.drawImage(vi2,0,0,600,480,0,0,600,480);
		   show4();
	    }
}

function show4(){
	ga = 0.0;
	timerId = 0;
	clearInterval(third);
	fourth = setInterval("crackerJacker()",700);
}

function crackerJacker(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(vi4,0,0,600,480,0,0,600,480);
	    }
	    else if (ga > 1.0)
	    {
	    	vctx.drawImage(vi4,0,0,600,480,0,0,600,480);
		   show5();
	    }
}

function show5(){
	ga = 0.0;
	timerId = 0;
	clearInterval(fourth);
	fifth = setInterval("crackerJackerMove()",550);
}


function crackerJackerMove(){
	
	if(counter<4){
		dax=600*counter;
		vctx.drawImage(vi4,dax,0,600,480,0,0,600,480);			
		counter++;
	}
	else{
		counter=0;
		show6();
	}
}



</script>
</head>
<body onload="init()">


<link rel="stylesheet" type="text/css" href="css/<%out.print(style);%>">

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
<img class="img" id="john1" alt="" src="images/C5John.png" width="800" height="480">
<img class="img" id="john2" alt="" src="images/paradise2.jpg" width="800" height="480">
<img class="img" id="john3" alt="" src="images/gem1.png" width="600" height="480">
<img class="img" id="fraudemonia" alt="" src="images/c5fraudemonia.png" width="600" height="480">
</div>


<div id="right">

<h2>Chapter 5: Of the Hardest Battles</h2>
<h3>Scene 1: Dilemma</h3>


<div id="caption"><p>
&quot;Fraudemonia will be the ultimate test of my journey.&quot;
This is the thought that has been haunting John for the past few weeks. Fraudemonia, the best known queen of evil and dark magic, is recognized to be the most vicious among the three. She has killed thousands of people, disregarding the significance of their existence. What gets in her way gets killed. She was the most feared Boss, apparently.
To John, she was the ultimate thing that will test how far he can go with this missions of vengeance. That is why he had to prepare the most for Fraudemonia.
<br>
He can remember when he was young that Fraudemonia was one of those foreigners who led the exploiting of resources from his old town. He can vividly picture how his old city, that used to be beautiful, turned to dry lands, with rarely growing plants everywhere.
</p></div>
<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene5.jsp">
<input type=submit id="button" name = Chap4S4 value = "Return to Chapter 4">
</form>

<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene7.jsp">
<input type=submit id="button" name = Chap4A7 value = "Return to Alternate Scene 7">
</form>

<form method="post" action="Dispatch">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter5Scene2.jsp">
<input type=submit id="button" name = Chap5S1 value="Go to Scene 2">
</form>
<br><br>
</div>
</div>

</body>
</html>