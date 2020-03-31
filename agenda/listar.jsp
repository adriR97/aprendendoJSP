<%-- 
    Document   : listar
    Created on : 30/03/2020, 18:25:13
    Author     : dryro
--%>

<%@ page import="java.util.*" %>
<%@ page import="database.Contato" %>
<jsp:useBean id="conexao" scope="page" class="database.Conexao" />
<jsp:useBean id="agenda" scope="page" class="database.Agenda" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda</title>
    </head>
    <body>
        <h3>Contatos cadastrados</h3>
        
        <%
            ArrayList colecao;
            Contato contato;
            colecao = agenda.listarColecao();
            
            if(colecao != null){
                out.println("<table>");
                out.println("<tr><th>Nome</th><th>Sexo</th><th>Dia Nasc.</th>"); 
                out.println("    <th>Mês Nasc.</th><th>Telefone</th></tr>");
                
                for(int i=0; i<colecao.size(); i++){
                    contato = (Contato)colecao.get(i);
                    
                    out.print("<tr>");
                    out.print("<td>" + contato.getNome() + "</td>" +"<td>" + 
                            contato.getSexo() + "</td>" +"<td>" + contato.getDiaNiver() + 
                            "</td>" +"<td>" + contato.getMesNiver() + "</td>" +
                            "<td>" + contato.getFone() + "</td>");
                    out.print("<td><a href=\"excluir.jsp?id=" + 
                            contato.getId() + "\">Excluir</a></td>");
                    out.print("<td><a href=\"alterar.jsp?id=" + 
                            contato.getId() + "&nome=" + contato.getNome().replace(' ', '+') 
                            +"&sexo=" + contato.getSexo() + "&dia_niver=" + 
                            contato.getDiaNiver() + "&mes_niver=" + contato.getMesNiver() 
                            + "&fone=" + contato.getFone().replace(' ', '+') + 
                            "\">Alterar</a></td>");
                    out.print("</tr>");
                }
                
                out.println("</table>");
            } else{
                out.println("<h3>Erro ao tentar listar contatos!</h3>");
            }
            
            conexao.fechar(); 
        %>
    </body>
</html>
