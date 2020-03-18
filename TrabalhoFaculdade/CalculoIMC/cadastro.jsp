<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<title>Cadastro</title>
		<style type="text/css">
			#botao{ font-size: 14px; color: white; background: black; border-radius: 2px; border: none; height: 40px; width: 100px; }
			#botao:hover{ background: #c0c0c0; color: black;}
		</style>
	</head>
	<body style="font-family:Arial, Helvetica, sans-serif;">
		<form action="resultado.jsp" method="get">
			<div style="width: 40%; margin: 0px auto; background: #f6f;">
				<div style="height: 40px; text-align: center; background: black; color: white;">
					<h3 style="padding-top: 10px;">Informações Pessoais</h3>					
				</div>
				<div style="padding: 30px 30px 30px 30px;">
					Nome: <input type="text" name="nome" style="margin-right: 60px;">
					Idade: <input type="text" name="idade" style="margin-left: 3px;"><br><br>
					
					Peso: <input type="text" name="peso" style="margin-left: 7px; margin-right: 60px;">
					Altura: <input type="text" name="alt"><br><br>
					Sexo: 
						<input type="radio" name="sexo"	value="Feminino">Feminino
						<input type="radio" name="sexo" value="Masculino">Masculino<br><br>

					<input id="botao" type="submit" value="Calcular IMC">						
				</div>								
			</div>			
		</form>		
	</body>
</html>