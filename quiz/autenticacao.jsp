<%-- 
    Document   : autenticacao
    Created on : 01/04/2020, 16:53:19
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<jsp:useBean id="conexao" scope="page" class="database.Conexao" />
<jsp:useBean id="usuario" scope="page" class="database.Usuario" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <body>
        <%
            String nome_usuario = request.getParameter("nome_usuario");   
            String senha = request.getParameter("senha");
            
            int resultado = usuario.autenticar(nome_usuario, senha);
            
            if (resultado == 0){
                out.println("<h2>Nome de usuário e/ou senha inválidos</h2>");      
                out.println("<a href=\"index.html\">Tentar novamente</a>");
            } else if(resultado == 1){
                HttpSession sessao = request.getSession();
                sessao.setAttribute("primeiro_nome", usuario.getPrimeiroNome());
                sessao.setAttribute("sexo", String.valueOf(usuario.getSexo()));
                out.println("<h3>Vamos começar?</h3>");              
                out.println("<a href=\"quiz.jsp\">Começar!</a>");
            } else{
                out.println("<h2>Erro ao registrar usuário.</h2>");
            }
            
            conexao.fechar();
        %>
    </body>
</html>
