<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<title>Histórico Escolar</title>
	</head>
	<body>
		<%
			String situacao;
			char sexo;
			int nota1, nota2;

			if(request.getParameter("sexo") != null){
				sexo = request.getParameter("sexo").charAt(0);
			} else{
				sexo = ' ';
			}

			nota1 = Integer.parseInt(request.getParameter("nota1"));
			nota2 = Integer.parseInt(request.getParameter("nota2"));

			if((nota1 + nota2) / 2 >= 7){
				if(sexo == 'F'){
					situacao = "Aprovada";
				} else{
					situacao = "Aprovado";
				}
			} else{
				if(sexo == 'F'){
					situacao = "Reprovada";
				} else{
					situacao = "Reprovado";
				}
			}
		%>

		<h2>Histórico Escolar</h2>
		<p>Nome: <%= request.getParameter("nome") %></p>
		<p>Média: <%= (nota1 + nota2) / 2 %></p>
		<p>Situação: <%= situacao %></p>
	</body>
</html>