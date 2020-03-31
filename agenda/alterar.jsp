<%-- 
    Document   : alterar
    Created on : 30/03/2020, 18:43:54
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda</title>
    </head>
    <body>
        <h3>Atualizar Contato</h3>
        
        <%
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String sexo = request.getParameter("sexo");
            String dia_niver = request.getParameter("dia_niver");
            String mes_niver = request.getParameter("mes_niver");
            String fone = request.getParameter("fone");            
        %>
        
        <form action="alterar_agenda.jsp" method="post">
            Nome: <input type="text" name="nome" value="<%= nome %>"> <br>
            
            <% if (sexo.equals("F")){%>
            
            Sexo: 
            <input type="radio" name="sexo" value="F" checked="checked">Feminino
            <input type="radio" name="sexo" value="M">Masculino<br>
                
            <% }else if (sexo.equals("M")){%>
            
            Sexo: 
            <input type="radio" name="sexo" value="F">Feminino
            <input type="radio" name="sexo" value="M" checked="checked">Masculino<br>
            
            <% } %>
            
            Dia Nasc.: <input type="text" name="dia_niver" value="<%= dia_niver %>"><br>
            Mês Nasc.: <input type="text" name="mes_niver" value="<%= mes_niver %>"><br>
            Telefone: <input type="text" name="fone" value="<%= fone %>"> <br>
            <input type="hidden" name="id" value="<%= id %>">
            <input type="submit" value="Atualizar">
        </form>
    </body>
</html>
