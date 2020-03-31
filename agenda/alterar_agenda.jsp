<%-- 
    Document   : alterar_agenda
    Created on : 31/03/2020, 15:21:43
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
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            char sexo = request.getParameter("sexo").charAt(0);
            int dia_niver = Integer.parseInt(request.getParameter("dia_niver"));
            int mes_niver = Integer.parseInt(request.getParameter("mes_niver"));
            String fone = request.getParameter("fone");
            
            if (agenda.atualizar(id, nome, sexo, dia_niver, mes_niver, fone)){
                out.println("<h2>Contato atualizado com sucesso!</h2>");
            } else {
                out.println("<h3>Erro ao tentar atualizar contato!</h3>");
            }
            
            conexao.fechar();
        %>
        
        <a href="listar.jsp">Voltar</a>
    </body>
</html>
