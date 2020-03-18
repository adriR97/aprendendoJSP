<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.text.*" %>
<html>
	<head>
		<title>Resultado da Conversão</title>
	</head>
	<body style="font-family:Arial, Helvetica, sans-serif;">
		<%
			int unidadeAnterior = 0;
			double resultado = 0, valor = 0;
			char unidadeDesejada;

			unidadeAnterior = Integer.parseInt(request.getParameter("opcao1"));

			if(request.getParameter("opcao2") != null){
				unidadeDesejada = request.getParameter("opcao2").charAt(0);
			} else {
				unidadeDesejada = ' ';
			}

			if(request.getParameter("valor") != null){
				valor = Double.parseDouble(request.getParameter("valor"));
			} else {
				valor = 0;
			}

			switch(unidadeAnterior){
				case 1:
					if(unidadeDesejada == 'a'){
						resultado = valor;
					} else if(unidadeDesejada == 'b'){
						resultado = valor * 1000;
					} else if(unidadeDesejada == 'c'){
						resultado = valor * 100000;
					} else if(unidadeDesejada == 'd'){
						resultado = valor * 1000000;
					}
					break;
				case 2: 
					if(unidadeDesejada == 'a'){
						resultado = valor / 1000;
					} else if(unidadeDesejada == 'b'){
						resultado = valor;
					} else if(unidadeDesejada == 'c'){
						resultado = valor * 100;
					} else if(unidadeDesejada == 'd'){
						resultado = valor * 1000;
					}
					break;
				case 3:
					if(unidadeDesejada == 'a'){
						resultado = valor / 100000;
					} else if(unidadeDesejada == 'b'){
						resultado = valor / 100;
					} else if(unidadeDesejada == 'c'){
						resultado = valor;
					} else if(unidadeDesejada == 'd'){
						resultado = valor * 10;
					} 
					break;
				case 4:
					if(unidadeDesejada == 'a'){
						resultado = valor / 1000000;
					} else if(unidadeDesejada == 'b'){
						resultado = valor / 1000;
					} else if(unidadeDesejada == 'c'){
						resultado = valor / 10;
					} else if(unidadeDesejada == 'd'){
						resultado = valor;
					} 
					break;
				case 5: 
					if(unidadeDesejada == 'e'){
						resultado = valor;
					} else if(unidadeDesejada == 'f'){
						resultado = valor * 1000;
					} else if(unidadeDesejada == 'g'){
						resultado = valor * 1000000;
					} else if(unidadeDesejada == 'h'){
						resultado = valor * 1000000000;
					}
					break;
				case 6: 
					if(unidadeDesejada == 'e'){
						resultado = valor / 1000;
					} else if(unidadeDesejada == 'f'){
						resultado = valor;
					} else if(unidadeDesejada == 'g'){
						resultado = valor * 1000;
					} else if(unidadeDesejada == 'h'){
						resultado = valor * 1000000;
					} 
					break;
				case 7: 
					if(unidadeDesejada == 'e'){
						resultado = valor / 1000000;
					} else if(unidadeDesejada == 'f'){
						resultado = valor / 1000;
					} else if(unidadeDesejada == 'g'){
						resultado = valor;
					} else if(unidadeDesejada == 'h'){
						resultado = valor * 1000;
					} 
					break;
				case 8: 
					if(unidadeDesejada == 'e'){
						resultado = valor / 1000000000;
					} else if(unidadeDesejada == 'f'){
						resultado = valor / 1000000;
					} else if(unidadeDesejada == 'g'){
						resultado = valor / 1000;
					} else if(unidadeDesejada == 'h'){
						resultado = valor;
					} 
					break;
				case 9: 
					if(unidadeDesejada == 'i'){
						resultado = valor;
					} else if(unidadeDesejada == 'j'){
						resultado = (valor * 9/5) + 32;
					} else if(unidadeDesejada == 'k'){
						resultado = (5/9 * (valor - 32) + 273.15);
					}
					break;
				case 10: 
					if(unidadeDesejada == 'i'){
						resultado = (valor - 32) * 5/9;
					} else if(unidadeDesejada == 'j'){
						resultado = valor;
					} else if(unidadeDesejada == 'k'){
						resultado = (valor + 459.67) * 5/9;
					}
					break;
				case 11: 
					if(unidadeDesejada == 'i'){
						resultado = valor - 273.15;
					} else if(unidadeDesejada == 'j'){
						resultado = valor * 9/5 - 459.67;
					} else if(unidadeDesejada == 'k'){
						resultado = valor;
					}
					break;
			}
		%>
		<div style="width: 40%; margin: 0px auto; background: #f6f;">
			<div style="height: 40px; text-align: center; background: black; color: white;">
				<h3 style="padding-top: 10px;">Resultado da Conversão</h3>
			</div>			
			<div style="padding: 30px 30px 30px 30px;">
				Resultado: <%= resultado %>
			</div>
		</div>
	</body>
</html>