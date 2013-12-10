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
	car = document.getElementById("car");
    vctx.drawImage(car,0,0,671,494,0,0,640,480);
	show();
}
var ctr = 0;

function show(){
	first = setInterval("applying()",600);
}
function applying(){
	if (ctr > 4) ctr=0; else ctr++;
	nx = 671*ctr;
	vctx.drawImage(car,nx,0,671,494,0,0,640,480);
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
<img class="img" id="car" alt="" src="images/bump.png">
</div>

<div id="right">
<h2>Chapter 4: The Downfall of Jackhalgar</h2>
<h3>Scene 4: Here Comes Dewey</h3>
<div id="caption"><p>
As he faced back, he saw a small trap vehicle nearing him.<br>
He jumped quickly to his side and evaded the trap.<br>
He saw that the driver of the vehicle was Dewey.<br>
The plan that was made was not to help him execute Jackhalgar,<br>
but instead a trap to get him. 
</p></div>
<form method="post" action="Dispatch" id="left">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene3.jsp">
<input type=submit id="button" name = Chap4A3 value = "Return to Alternate Scene 3">
</form>

<form method="post" action="Dispatch" id="right">
<input type="hidden" name="user" value="<%=user %>">
<input type="hidden" name="page" value="TheCulpritHunt_Chapter4AltScene5.jsp">
<input type=submit id="button" name = Chap4A5 value="Go to Alternate Scene 5">
</form>
<br><br><br>

</div>
</div>

<audio controls autoplay hidden loop>
<source src ="sounds/job.mp3" type="audio/mpeg" autoplay="true"></source>
</audio>
</body>
</html>