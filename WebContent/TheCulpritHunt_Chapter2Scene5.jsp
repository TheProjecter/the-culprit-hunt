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
var vc, vctx, raging, guzzing,nx, stopanim;
var ctr =0;

	function init(){
		vc = document.getElementById("canvas");
		vctx = vc.getContext("2d");
		raging = document.getElementById("rage");
		guzzing = document.getElementById("guzz");
		vctx.drawImage(raging,0,0,412,318,0,0,640,480);
		vctx.drawImage(guzzing,100,280,300,240);
		onrage();
	}
	
	function onrage(){
		ignite = setInterval("johninrage()",200);
	}
	function johninrage(){
		if (ctr > 4) ctr = 0; else ctr++;
		nx = 412 *ctr;
		vctx.drawImage(raging,nx,0,412,318,0,0,640,480);
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
<img class="img" id="rage" alt="" src="images/johnrage.png" width="600" height="480">
<img class="img" id="guzz" alt="" src="images/guzz.png" width="600" height="480">
</div>

<div id="right">
<h2>Chapter 2: The Awakening</h2>
<h3>Scene 5: This Is Enough!</h3>
<div id="caption"><p><br><br>
The feeling of breaking down turned into a feeling of rising up and<br>
having a stronger will to claim justice for his family and for the society.<br>
The only word that came out of his mouth, with full conviction he said,<br><br>
&quot;<b>This is enough!</b>&quot;
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter2Scene4.jsp">
<input type=submit id="button" name = Chap2S3 value = "Return to Scene 4">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter3Scene1.jsp">
<input type=submit id="button" name = Chap2S5 value="Go to Chapter 3">
</form>
<br><br><br>

</div>
</div>
<audio controls autoplay hidden> <source src ="sounds/fire.mp3" type="audio/mpeg" autoplay="true"></audio>
</body>
</html>