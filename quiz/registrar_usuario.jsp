<%-- 
    Document   : registrar_usuario
    Created on : 01/04/2020, 16:46:36
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String primeiro_nome = request.getParameter("primeiro_nome");    
            String sobrenome = request.getParameter("sobrenome");    
            char sexo = request.getParameter("sexo").charAt(0);    
            String nome_usuario = request.getParameter("nome_usuario");    
            String senha = request.getParameter("senha");
            
            int resultado = usuario.inserir(primeiro_nome, sobrenome, sexo,                                           
                    nome_usuario, senha);
            
            if(resultado == 0){
                out.println("<h3>Usuário registrado com sucesso!</h3>");
            } else if(resultado == 1){
                out.println("<h2>Usuário já registrado!</h2>");
            } else {
                out.println("<h2>Erro ao registrar usuário.</h2>");
            }
            
            conexao.fechar();
        %>
        
        <a href="index.html">Página de login</a>
    </body>
</html>
