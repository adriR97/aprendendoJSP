<!DOCTYPE html>
	<%@ page import="java.text.*" %>
	<html>
	<head>
		<title>Salario</title>
	</head>
	<body>
		<h2>Folha de Pagamento</h2>

		<%
			float salarioBase, grat, desc, salarioBruto, salarioLiquido;
			DecimalFormat df = new DecimalFormat("R$ 0.00");

			salarioBase = Float.parseFloat(request.getParameter("sBase").replace(',','.'));
			grat = Float.parseFloat(request.getParameter("grat").replace(',','.'));
			desc = Float.parseFloat(request.getParameter("desc").replace(',','.'));

			salarioBruto = salarioBase + salarioBase * (grat / 100);
			salarioLiquido = salarioBruto - salarioBruto * (desc / 100);

			out.println("<p>Salario liquido:" + df.format(salarioLiquido) + "</p>");
		%>
	</body>
</html>