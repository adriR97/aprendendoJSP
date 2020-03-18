<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Conversão de Medidas</title>
		<script type="text/javascript">
			function mostrar_abas(NOMEDADIV) 			{
				if(document.getElementById(NOMEDADIV).style.display != 'none') {
					document.getElementById(NOMEDADIV).style.display = 'none';
				} else{
					document.getElementById(NOMEDADIV).style.display = 'block';
				}				
			}
	    </script>
	    <style type="text/css">
	     .tipo{background:black; color:#fff; display:inline-block; text-align:center; text-decoration:none; width:140px; margin-right:10px;}
	     .tipo:hover{background-color: #6e6a6a; color: #000;}
	    #botao{ font-size: 14px; color: white; background: black; border-radius: 2px; border: none; height: 40px; width: 100px; margin-top: 20px;}
		#botao:hover{ background: #c0c0c0; color: black;}
	    </style>
	</head>
	<body style="font-family:Arial, Helvetica, sans-serif;">
		<form action="conversao.jsp" method="get">			
			<div style="width: 40%; margin: 0px auto; background: #f6f;">
				<div style="height: 40px; text-align: center; background: black; color: white;">
					<h3 style="padding-top: 10px;">Conversão de Medidas</h3>					
				</div>
				<div style="padding: 30px 30px 30px 30px;">
					<p>Tipo de conversão:</p>
					<a href="javascript:mostrar_abas('comp')" class="tipo"> Comprimento </a>
					<a href="javascript:mostrar_abas('massa')" class="tipo"> Massa </a>
					<a href="javascript:mostrar_abas('temp')" class="tipo"> Temperatura </a>

					<div id="comp" style="display:none"> 
						<p>Unidade atual:</p>
						<input type="radio" name="opcao1" value="1">Quilômetro
						<input type="radio" name="opcao1" value="2">Metro
						<input type="radio" name="opcao1" value="3">Centímetro
						<input type="radio" name="opcao1" value="4">Milímetro<br>
						<p>Unidade desejada:</p>
						<input type="radio" name="opcao2" value="a">Quilômetro
						<input type="radio" name="opcao2" value="b">Metro
						<input type="radio" name="opcao2" value="c">Centímetro
						<input type="radio" name="opcao2" value="d">Milímetro<br>						
					</div>
						
					<div id="massa" style="display:none"> 
						<p>Unidade atual:</p>
						<input type="radio" name="opcao1" value="5">Tonelada
						<input type="radio" name="opcao1" value="6">Quilograma
						<input type="radio" name="opcao1" value="7">Grama
						<input type="radio" name="opcao1" value="8">Miligrama<br>
						<p>Unidade desejada:</p>
						<input type="radio" name="opcao2" value="e">Tonelada
						<input type="radio" name="opcao2" value="f">Quilograma
						<input type="radio" name="opcao2" value="g">Grama
						<input type="radio" name="opcao2" value="h">Miligrama<br>			
					</div>

					<div id="temp" style="display:none">
						<p>Unidade atual:</p>
						<input type="radio" name="opcao1" value="9">Celsius
						<input type="radio" name="opcao1" value="10">Fahrenheit
						<input type="radio" name="opcao1" value="11">Kelvin<br>
						<p>Unidade desejada:</p>
						<input type="radio" name="opcao2" value="i">Celsius
						<input type="radio" name="opcao2" value="j">Fahrenheit
						<input type="radio" name="opcao2" value="k">Kelvin<br>	
					</div>

					<p>Valor: </p>
					<input type="text" name="valor"><br>
					<input type="submit" value="Enviar" id="botao">
				</div>
			</div>
		</form>
	</body>
</html>