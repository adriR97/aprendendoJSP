<!--As diretivas são utilizadas para importar classes-->
<%@ page import="java.util.Date" %>
<html>
	<head>
		<title>Diretivas</title>
	</head>
	<body>
		<h2>Calendario</h2>
		<% Date hoje = new Date(); %>
		<p>Data e hora atual do sistema: <%= hoje %></p>

		<!--Tag include serve para incluir arquivos de texto ou código JSP-->
		<%@ include file="diretiva2.jsp" %>
	</body>
</html>