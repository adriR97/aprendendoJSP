<!DOCTYPE html>
	<html>
	<head>
		<title>Tabuada</title>
	</head>
	<body>
		<%
			int num, i = 1;

			//convertendo string para inteiro
			num = Integer.parseInt(request.getParameter("numero"));

			out.println("<h2>Tabuada do " + num + "</h2>");

			while(i <= 10){
				out.println(num + "x" + i + "=" + num * i + "<br>");
				i++;
			}
		%>
	</body>
</html>