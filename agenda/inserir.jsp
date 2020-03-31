<%-- 
    Document   : inserir
    Created on : 30/03/2020, 18:20:11
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conexao" scope="page" class="database.Conexao" />
<jsp:useBean id="agenda" scope="page" class="database.Agenda" /> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda</title>
    </head>
    <body>
        <%
            /* armazena os valores dos parâmetros em variáveis */
            String nome = request.getParameter("nome");
            char sexo = request.getParameter("sexo").charAt(0);
            int dia = Integer.parseInt(request.getParameter("dia"));
            int mes = Integer.parseInt(request.getParameter("mes"));
            String fone = request.getParameter("fone");
            
            if(agenda.inserir(nome, sexo, dia, mes, fone)){
                out.println("<h3>Contato cadastrado com sucesso!</h3>");
            } else {
                out.println("<h3>Erro ao tentar cadastrar contato!</h3>");
            }
            
            conexao.fechar(); 
        %>
        
        <a href="cadastrar.html">Voltar</a>
    </body>
</html>
