<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2><font color= "red">The table is</font></h2>
<script src="<java-script-url>">

</script>

<table border=1>
<tr>
	
<%! String sample[]={"apple" ,"aaa","cc","css","adg","ckh","afk","atfgk","cl"}; %>

<td>

<% 
out.println("<h2><font color=green>The program id of edn and json doesnot match<font></h2>");

int index=-1;
String match="json";
 for(int i=1;i<sample.length;i++)
 {
	 if(sample[i].equals(match))
	 {
		 index=i;
		out.println(index);
		 break;
	 }
 }
%>
</td>
<td>
<%
if(index!=-1)
{
for(int i=1;i<index;i++)
 {
	 out.println(sample[i]);
	 %>
	 <br>
	 <%
 }
}
  %>
</td>

<td align="center">
<% 
if(index!=-1)
{
for(int i=index;i<sample.length;i++)
{
out.println(sample[i]);
%>
	<br>
	<%
	}

}
	%>
</td>


<td align="center">
<% 
if(index==-1)
{
for(int i=1;i<sample.length;i++)
{
out.println(sample[i]);
%>
	<br>
	<%
	}

}
	%>
</td>

</tr>
</table>
 <input type="text" id="abc" onkeyup="s()">
 <input type="submit" id="abc2" disabled >
<script type="text/javascript">
function myFunction() {
    alert("I am an alert box!");
}
function s(){
var i=document.getElementById("abc");
if(i.value=="")
    {
    document.getElementById("abc2").disabled=true;
    }
else
    document.getElementById("abc2").disabled=false;}</script>
    
 <script type="text/javascript">myFunction();</script>
   
</body>
</html>