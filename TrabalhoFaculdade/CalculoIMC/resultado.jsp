<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.text.*" %>
<html>
	<head>
		<title>Índice de Massa Corporal</title>
	</head>
	<body style="font-family:Arial, Helvetica, sans-serif;">
		<%
			float peso, altura, imc;
			String resultado, sexo;
			DecimalFormat df = new DecimalFormat("0.00");

			peso = Float.parseFloat(request.getParameter("peso").replace(',', '.'));   
			altura = Float.parseFloat(request.getParameter("alt").replace(',', '.'));

			imc = peso / (altura * altura);
		%>
		<div style="width: 40%; margin: 0px auto; background: #f6f;">
			<div style="height: 40px; text-align: center; background: black; color: white;">
				<h3 style="padding-top: 10px;">Resultado Cálculo IMC</h3>
			</div>			
			<div style="padding: 30px 30px 30px 30px;">
				Nome: <%= request.getParameter("nome") %><br>
				Idade: <%= request.getParameter("idade") %><br>
				Sexo: <%= request.getParameter("sexo") %><br>
				Peso: <%= peso %><br>
				Altura: <%= altura %><br>
				IMC: <%= df.format(imc) %><br>
			</div>
		</div>
	</body>
</html>