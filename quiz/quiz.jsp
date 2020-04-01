<%-- 
    Document   : quiz
    Created on : 01/04/2020, 17:48:32
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bancoPerguntas" scope="page" class="database.BancoDePerguntas" />
<%@page import="database.Pergunta"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <body>
        <%
            HttpSession sessao = request.getSession();
            
            if (sessao.getAttribute("sexo").equals("F")){
                out.println("<h2>Bem-vinda, " + sessao.getAttribute("primeiro_nome") + "</h2>");
            } else {
                out.println("<h2>Bem-vindo, " + sessao.getAttribute("primeiro_nome") + "</h2>");
            }
        %>
        
        <h3>Você terá apenas 2 minutos para responder as perguntas. Boa sorte!</h3>
        
        <form action="quiz" method="post">
            <%
                ArrayList colecao; //conjunto de perguntas
                Pergunta pergunta; //uma pergunta
                String alternativas[]; //conjunto de alternativas de uma pergunta
                
                colecao = bancoPerguntas.getPerguntas();
                
                //colocando na sessão a coleção de perguntas
                sessao.setAttribute("bancoPerguntas", colecao);
                
                for(int i=0; i<colecao.size(); i++){
                    out.println("<p>");
                    out.println("<strong>");
                    out.println("Pergunta " + (i + 1));
                    out.println("</strong>");
                    out.println("<br>");
                    
                    pergunta = (Pergunta)colecao.get(i);
                    
                    out.println(pergunta.getPergunta());
                    out.println("<br>");
                    
                    alternativas = pergunta.getAlternativas();
                    
                    for (int j=0; j < 4; j++){
                        out.println("<input type=\"radio\" name=\"p" + (i + 1) 
                             +"\" value=\"" +(j + 1) +"\">" +alternativas[j] + "<br>");
                    }
                    
                    out.println("</p>");
                }
            %>
            
            <input type="submit" value="Enviar respostas">
        </form>
    </body>
</html>
