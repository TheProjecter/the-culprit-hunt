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
	vi4 = document.getElementById("crackerjacker");
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

function show6(){
	ga = 0.0;
	timerId = 0;
	clearInterval(fifth);
	sixth = setInterval("gemsFade()",300);
}

function gemsFade(){
	if (ga <1.0){
	    vctx.globalAlpha = ga;
	    ga = ga + 0.1;
	    vctx.drawImage(vi3,0,0,600,480,0,0,600,480);
	    }
	    else if (ga > 1.0)
	    {
	    	vctx.drawImage(vi3,0,0,600,480,0,0,600,480);
		   show7();
	    }
}

function show7(){
	ga = 0.0;
	timerId = 0;
	clearInterval(sixth);
	seventh = setInterval("animateGem()",200);
}

function animateGem(){
	
	if(counter<3){
		dax=600*counter;
		vctx.drawImage(vi3,dax,0,600,480,0,0,600,480);			
		counter++;
	}
	else{
		counter=0;
		//show6();
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
<img class="img" id="john1" alt="" src="images/CS3S6b.png" width="800" height="480">
<img class="img" id="john2" alt="" src="images/flames.png" width="800" height="480">
<img class="img" id="john3" alt="" src="images/gem1.png" width="600" height="480">
<img class="img" id="crackerjacker" alt="" src="images/crackerbomb.png" width="600" height="480">
</div>


<div id="right">

<h2>Chapter 3: First Blood</h2>
<h3>Scene 7: Obtained</h3>


<div id="caption"><p>
He broke into Crackerjacker&quot;s lair in midnight, when every entity was asleep. Slowly and silently, John started killing numerous guards and protectors, he passed by different floors, with each floor he is successful.<br><br>
Finally, he came face to face with Crackerjacker. They started fighting, the battle was tough. John was wounded, but in the end, with the tools that John has, he defeated Crackerjacker and extracted the first Gem successfully. In his head, the main question went like, <i>&quot;Jackhalgar, you are next.&quot;</i>


</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene6.jsp">
<input type=submit id="button" name = Chap3S5 value = "Return to Scene 6">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4Scene1.jsp">
<input type=submit id="button" name = Chap3S7 value="Go to Chapter 4">
</form>
<br><br><br><br><br>
</div>
</div>

</body>
</html>