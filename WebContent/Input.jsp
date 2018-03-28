<%@page import="JavaCode.editing"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="JavaCode.*"%>
<%!String fname = "C:\\Users\\se056529\\Documents\\ednvalidator-result.txt";%>
<%!String line = null;%>
<%!String content = " ";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	function HandleBrowseClick() {
		var fileinput = document.getElementById("browsedn");
		fileinput.click();
	}
	function Handlechange() {
		var fileinput = document.getElementById("browsedn");
		var textinput = document.getElementById("ednname");
		textinput.value = fileinput.value;
	}

	function HandleBrowseClick1() {
		var fileinput = document.getElementById("browsejson");
		fileinput.click();
	}
	function Handlechange1() {
		var fileinput = document.getElementById("browsejson");
		var textinput = document.getElementById("jsonname");
		textinput.value = fileinput.value;
	}
</script>
</head>
<body>
	<form action="Callingclj" method="post">
		<h2>select an edn file</h2>
		<input type="file" id="browsedn" name="fileupload"
			style="display: none" onChange="Handlechange();" /> <input
			type="text" id="ednname" name="edn" /> <input type="button"
			value="Click to edn file" id="fakeBrowse"
			onclick="HandleBrowseClick();" /> <br> <br>
		<h2>select an json file</h2>
		<input type="file" id="browsejson" name="fileupload"
			style="display: none" onChange="Handlechange1();" /> <input
			type="text" id="jsonname" name="json" /> <input type="button"
			value="Click to select json file" id="fakeBrowse1"
			onclick="HandleBrowseClick1();" /> <br> <br> <input
			type="submit" /> <br> <br>


		<%
			String name = (String) request.getAttribute("var");
			//out.print("result is " + name);
		%>

		<h2>The unique files in edn and json :</h2>

		<% 
	
//Printing the edn-result data		
           if (name != null) {
        	   %>
		<table border=1>
			<tr>
				<td>
					<%
						try {
					FileReader fileReader = new FileReader(fname);
					BufferedReader bufferedReader = new BufferedReader(fileReader);
					 String data="";
					while ((line = bufferedReader.readLine()) != null)
					{
			        	line = line.replace("#{", "");
			        	line = line.replace("}", "");
			        	line = line.replace("\""," ");
			        	data= data.concat(line);
	                  
					}
					data=data.replace(" ","\n  ");
				       String[] words =data.split("\\s+");
				       for(int i=1;i<words.length;i++)
				       {
				    	   if(i!=5)
				    		   out.print(words[i]+" ");
				    	   else
				    	   {
				    		   for(int j=1;j<=(words.length)-5;j++)
				    		   {
				    			   try {
				    			   if(j==1)
				    				   out.println("<br>");
				    		out.print("<br>");  
				    		out.println(j+ ".  ");
				    		out.println(words[i+j-1]);
				    			   }
				    			   catch(Exception e) {
				    				  // System.out.println(e);
				    			   }

				    		   }
				    	   }
				    	   
				    if(i==5)
				    	break;
				       }


					bufferedReader.close();
				} catch (IOException ex) {
					out.println("Error reading file named '" + fname + "'");
				}
           }
			
				
           
			%>
				</td>
			</tr>
		</table>
		<br> <br>

	</form>
</body>
</html>