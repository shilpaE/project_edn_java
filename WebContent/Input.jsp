<%@page import="JavaCode.editing"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="JavaCode.*"%>
<%!String fname = "C:\\Users\\se056529\\Documents\\ednvalidator-result.txt";%>
<%!String line = null;%>
<%!String match = "json";%>
<%!int index = -1;%>
<%!String prgmid = null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
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

	function HandleBrowseClick1() {
		var fileinput = document.getElementById("browsejson");
		fileinput.click();
		document.getElementById("submit").disabled = false;
	}
	function Handlechange1() {
		var fileinput = document.getElementById("browsejson");
		var textinput = document.getElementById("jsonname");
		textinput.value = fileinput.value;
	}
	function myFunction() {
		alert("Select files according to the mentioned format!");
	}
</script>
</head>
<body>
	<form action="Callingclj" method="post">
	<br>
	<br>
	<h2 align="center"><i><b><font size=20 color="blue" ><u> Welcome to EDN Validator</u></font></b></i></h2>
	<br>
	<br>
		<table  border=1 align="center" cellpadding="10">
			<tr>
				<td><h2>select an edn file</h2></td>
				<td><input type="file" id="browsedn" name="fileupload"
					style="display: none" onChange="Handlechange();" /> <input
					type="text" id="ednname" name="edn" readonly="readonly" /> <input
					type="button" value="Click here to select edn file" id="fakeBrowse"
					onclick="HandleBrowseClick();" /> <br> <br></td>
			</tr>
			<tr>
				<td>
					<h2>select an json file</h2>
				</td>
				<td><br><br><input type="file" id="browsejson" name="fileupload"
					style="display: none" onChange="Handlechange1();" /> <input
					type="text" id="jsonname" name="json" readonly="readonly" /> <input
					type="button" value="Click here to select json file"
					id="fakeBrowse1" onclick="HandleBrowseClick1();" /> <br> <br>
					
					<br></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="submit" id="submit" value="submit" disabled /> <br>
			</td>
			</tr>
		</table>
		<br>
		<br>
		
		<table border=1>
			<tr>

				<%
					String prgmid = (String) request.getAttribute("var");
					if (prgmid == "false")
						out.println("<h2><font color = red>The program id of edn and json does not match</font></h2>");
					if (prgmid == "true")
						out.println("<h2><font color = green>The program id of edn and json match</font></h2>");

					if (prgmid == "redo") {
				%>
				<script>
					myFunction();
				</script>
				<%
					}
					//out.println("<h2>Please select the correct edn and json file</h2>");

					//Printing the edn-result data		

					if (prgmid == "false" || prgmid == "true") {
				%>
			</tr>
			<tr>

				<%
					try {
							FileReader fileReader = new FileReader(fname);
							BufferedReader bufferedReader = new BufferedReader(fileReader);
							String data = "";
							while ((line = bufferedReader.readLine()) != null) {
								line = line.replace("#{", "");
								line = line.replace("}", "");
								line = line.replace("\"", " ");
								data = data.concat(line);

							}
							data = data.replace(" ", "\n  ");
							String[] words = data.split("\\s+");
				%>
				<td>
					<%
						try {
									for (int i = 1; i < words.length; i++) {

										boolean result = words[i].equals(match);
										if (result == true) {
											index = i;
											//out.println(index);
											break;
										}

									}
								} catch (Exception e) {
									out.print("1." + e);
								}
					%>
				</td>
				<td bordercolor="black">
					<%
						if (index != -1) {
									try {
										for (int i = 1; i < index - 1; i++) {
											out.println(words[i]);

											if (i >= 4) {
					%> <br> <%
 	out.println("<br>");
 						}
 					}
 				} catch (Exception e) {
 					out.println();
 				}
 %>
				</td>
				<td bordercolor="black">
					<%
						try {
										for (int i = index - 1; i < words.length; i++) {
											out.println(words[i]);
											if (i >= index + 2) {
					%> <br> <%
 	out.println("<br>");
 						}
 					}
 				} catch (Exception e) {
 					out.println("3." + e);
 				}
 			}
 %>
				</td>
				<td>
					<%
						if (index == -1) {
									try {
										for (int i = 1; i < words.length; i++) {
											out.println(words[i]);
											if (i >= 4) {
					%> <br> <%
 	out.println("<br>");
 						}
 					}
 				} catch (Exception e) {
 					out.println("4." + e);
 				}
 			}
 %> <%
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