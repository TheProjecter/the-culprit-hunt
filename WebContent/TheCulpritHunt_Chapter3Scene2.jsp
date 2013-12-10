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

var imgpos=0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		imgpos=vc.width*.3;
		vi1 = document.getElementById("scene2");
		vi2 = document.getElementById("bg");
		vctx.drawImage(vi1,0,0,250,315,imgpos,170,250,315);
		setInterval("showImg()",170);
		//startanim();

	}

	
	function showImg(){
		if(counter>=2){counter=0;}
		else{
			dax=250*counter;
			vctx.drawImage(vi2,x,0,800,480);
			if(x2<=0 || x <= -800){
				x=0;
				x2=800;
			}
			x=x-15;
			x2=x2-15;
			vctx.drawImage(vi2,x2,0,800,480);
			vctx.drawImage(vi1,dax,0,250,315,imgpos,170,250,315);
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
<img class="img" id="scene2" alt="" src="images/C3S2a.png" width="500" height="315">
<img class="img" id="bg" alt="" src="images/C3S2bg.png" width="800" height="480">
</div>

<div id="right">

<h2>Chapter 3: First Blood</h2>
<h3>Scene 2: The Preparation</h3>

<div id="caption"><p>He spent most of his time in planning his next move. He wanted to know what path to take, who to punish, and what to obtain.
John underwent a lot of training to make him physically fit for the battle that he is going to face.</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene1.jsp">
<input type=submit id="button" name = Chap2S5 value = "Return to Scene 1">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene3.jsp">
<input type=submit id="button" name = Chap3S2 value="Go to Scene 3">
</form>
<br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>



</body>
</html>