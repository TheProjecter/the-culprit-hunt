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
var xLoc=800;
var x=-100;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		vi1 = document.getElementById("background");
		vi2 = document.getElementById("bg1");
		vctx.drawImage(vi1,0,0,800,480);
		setInterval("showImg()",480);
		//startanim();

	}

	var alpha=0.0;
	vctx.globalAlpha=alpha;
	
	function showImg(){
		
		if(alpha<1.0){
		alpha=alpha+0.1;
		vctx.globalAlpha=alpha;
		vctx.drawImage(vi2,0,0,800,480);
		}
		
		else if(alpha>1.0){
			vctx.drawImage(vi2,0,0,800,480);
			setInterval("animate()",100);
		}
	}
	
	
	function animate(){
		if (counter>=2) counter=0; else counter++;
		dax=200*counter;
		xLoc-=1;
		if(xLoc<=0) xLoc=800;
		vctx.drawImage(vi2,0,0,800,480);
		vctx.drawImage(vi3,dax,0,200,191,xLoc,180,200,191);
		
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



<center><br><br><img src="images/login_header.png" width=35% height=20% align="center"/></center>
<p class="loginas">You are logged in as: <% out.print(user); %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<a href="logout.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</p>
<p class="credit"><%@ include file="header.jsp" %><% out.print(concat); %></p><br><br>

<div id="main">

<div id="left">
<canvas id="canvas" width="600" height="480" style="border-bottom: 15px solid #000; border-top: 15px solid #000;">Browser does not Support HTML 5</canvas>
<img class="img" id="background" alt="" src="images/gazebo.png" width="800" height="480">
<img class="img" id="bg1" alt="" src="images/dry.png" width="800" height="480">
<img class="img" id="harbor" alt="" src="images/harbor.png" width="600" height="191">
</div>

<div id="right">
<h2>Chapter 1: Napoleonithe Before</h2>
<h3>Scene 2: Flashback</h3>


<div id="caption"><p>It was once a place where the most beautiful flowers bloomed, a place where the people helped one another for the betterment of the nation. Until one day, something unexpected occurred.
<br><br>Foreigners from the nearby and most powerful country New World came to pay a visit. At first, their intentions were pure, they only wanted to see the rich country of Napoleonithe and see how true it was that everyone was living in harmony. However, time passed and the New Worlders started to be consumed by greed, slowly possessing the natural resources, gradually exploiting the people, and took certain positions in the government step by step.
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene1.jsp">
<input type=submit id="button" name = Chap1S0 value = "Return to Scene 1">
</form>


<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter1Scene3.jsp">
<input type=submit id="button" name=Chap1S1 value = "Go to Scene 3">
</form>
<br><br><br>
</div>
</div>

</body>
</html>