<%-- 
    Document   : index
    Created on : 06/04/2020, 17:00:37
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <div id="divLogo">
            <h2 id="logo">CATÁLOGO DE LIVROS VIRTUAL</h2>
        </div>
        <div id="divBar">
            <form style="width: 48%">
                <input type="text" name="search" id="txtPesquisar" value="Pesquise o tema">
                <input type="image" src="imagens/iconSearch.png" alt="Submit" id="btnSearch">
            </form>
            <form style="width: 48%; float: right; margin-top: -42px;" 
                  action="admin.jsp" method="post">
                <input type="text" name="usuario" id="txtUsuario" value="Usuário">
                <input type="text" name="senha" id="txtSenha" value="Senha">
                <input type="image" src="imagens/login.png" alt="Submit" id="btnLogin">
            </form>
        </div>
    </body>
</html>
