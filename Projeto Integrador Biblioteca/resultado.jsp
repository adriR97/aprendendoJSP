<%-- 
    Document   : resultado
    Created on : 20/04/2020, 19:06:21
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <div class="menu">
            <a href="livro.jsp">Livros</a>
            <a href="editora.html">Editoras</a>
            <a href="usuario.html">Usuários</a>
        </div>
        <div class="conteudo" style="text-align: center; margin-top: 250px;">
            <h4><%=request.getAttribute("Mensagem")%></h4>
            <% conexao.fechar(); %>
        </div>
    </body>
</html>
