<%-- 
    Document   : excluir
    Created on : 30/03/2020, 18:36:58
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
           
            if(agenda.excluir(id)){
                out.println("<h2>Contato excluído com sucesso!</h2>");
            } else{
                out.println("<h3>Erro ao tentar excluir contato!</h3>");
            }
            
            conexao.fechar();
        %>
        
        <a href="listar.jsp">Voltar</a>
    </body>
</html>
