<html>
	<head>
		<title>Seu nome</title>
	</head>
	<body>
		<% 
			String nome_completo;
			nome_completo = request.getParameter("nome") + " " + request.getParameter("sobrenome");
		%>
		<p>Seu nome completo: <%= nome_completo %></p>
	</body>
</html>