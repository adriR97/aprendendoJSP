<!DOCTYPE html>
	<html>
	<head>
		<title>Salario</title>
	</head>
	<body>
		<h2>Folha de Pagamento</h2><br>

		<form action="calcular.jsp" method="get">
			Salario base: <input type="text" name="sBase" style="margin-left: 15px;"><br>
			% gratificacao: <input type="text" name="grat"><br>
			% desconto: <input type="text" name="desc" style="margin-left: 18px;"><br><br>

			<input type="submit" value="Calcular">
		</form>
	</body>
</html>