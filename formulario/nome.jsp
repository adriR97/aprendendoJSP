<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<title>Seu nome</title>
	</head>
	<body>
		<%
			String nomeCompleto, pronome;
			char sexo;

			nomeCompleto = request.getParameter("nome") + " " + request.getParameter("sobre");

			if(request.getParameter("sexo") != null){
				sexo = request.getParameter("sexo").charAt(0);
			} else {
				sexo = ' ';
			}

			if(sexo == 'F') {
				pronome = "Sra. ";
			} else if(sexo == 'M') {
				pronome = "Sr. ";
			} else {
				pronome = "";
			}
		%>

		<p>Olá, <%= pronome + nomeCompleto + "!"%></p>
	</body>
</html>