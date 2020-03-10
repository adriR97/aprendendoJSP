<html>
	<head>
		<title>Declaracoes</title>
	</head>
	<body>
		<!--A tag <%!%> serve para declarar variáveis, 
			ela é executada uma única vez-->
		<%! int i = 0; %>

		<%
			int x = 0;

			out.println("<h2>Simulacao de contagem de acessos</h2>");
			out.println("<br>");

			i++;
			x++;
		%>

		<p>Voce acessou esta pagina <%= i %> vezes.</p>
		<p>Valor da variavel X: <%= x %>.</p>
	</body>
</html>