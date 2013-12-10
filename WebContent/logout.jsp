<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie [] call = request.getCookies();
	String type = "";
	String concat ="";
	String user = "";
	
	if(call!=null){
		for(int j =0; j<call.length;j++){
			Cookie b = call[j];
			if(b.getName().equals("type")){
				type = b.getValue();
			}
			if(b.getName().equals("user")){
				user = b.getValue();
			}
		}
	}
	
	if(type.equals("admin")){
		HttpSession s1 = request.getSession(false);
		if(s1!=null) s1.invalidate();
		response.sendRedirect("tch_index.jsp");
	}

	else{
	HttpSession s2 = request.getSession(false);
	if(s2!=null) s2.invalidate();
	response.sendRedirect("tch_index.jsp");
	}
%>

</body>
</html>