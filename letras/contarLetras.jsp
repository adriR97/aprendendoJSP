<!DOCTYPE html>
	<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<title>Vogais e Consoantes</title>
	</head>
	<body>
		<%
			String nome;
			int vogais = 0, consoantes = 0;

			nome = request.getParameter("nome").toUpperCase();

			for(int i=0; i<nome.length(); i++){
				switch(nome.charAt(i)){
					case 'A':
					case 'E':
					case 'I':
					case 'O':
					case 'U': vogais++; break;
					case ' ': break;
					default: consoantes++;
				}
			}
		%>

		<h2>Seu nome</h2>
		<p>Qtde. de caracteres: <%= nome.length() %></p>
		<p>Qtde. de vogais: <%= vogais %></p>
		<p>Qtde. de consoantes: <%= consoantes %></p>
	</body>
</html>