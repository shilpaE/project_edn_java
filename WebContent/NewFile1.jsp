<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

function HandleBrowseClick() {
	var fileinput = document.getElementById("browsedn");
	fileinput.click();
	document.getElementById("submit").disabled = false;
}
function Handlechange() {
	var fileinput = document.getElementById("browsedn");
	var textinput = document.getElementById("ednname");
	textinput.value = fileinput.value;
}

    </script>
</head>
<body>
<h2>select an edn file</h2>
		<input type="file" id="browsedn" name="fileupload"
			style="display: none" onChange="Handlechange();" /> <input
			type="text" id="ednname" name="edn" readonly="readonly" /> <input
			type="button" value="Click to select edn file" id="fakeBrowse"
			onclick="HandleBrowseClick();" /> <br> <br>
    
<input type="button"/>
<%
String str=request.getParameter("ednname");
out.println(str);
%>
</body>
</html>