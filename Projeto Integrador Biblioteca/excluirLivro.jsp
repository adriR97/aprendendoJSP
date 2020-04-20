<%-- 
    Document   : excluirLivro
    Created on : 20/04/2020, 15:21:03
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="livraria" scope="page" class="classes.LivrosModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Livro</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <div class="menu">
            <a href="livro.jsp">Livros</a>
            <a href="editora.html">Editoras</a>
            <a href="usuario.html">Usuários</a>
        </div>
        <div class="conteudo" style="text-align: center; margin-top: 270px;">
            <%
                int id = Integer.parseInt(request.getParameter("id").trim());
                
                if(livraria.excluirLivro(id)){
            %>
            
                    <h4>O livro foi excluído com sucesso!</h4>
                    
            <%
                } else {
            %>        
            
                    <h4>Não foi possível fazer a exclusão do livro!</h4>
                    
            <%  } 
                conexao.fechar();
            %>
        </div>
    </body>
</html>
