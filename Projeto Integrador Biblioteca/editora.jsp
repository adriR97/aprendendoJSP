<%-- 
    Document   : editora
    Created on : 07/04/2020, 15:30:44
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="livraria" scope="page" class="classes.LivrosModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editora</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <div class="menu">
            <a href="livro.jsp">Livros</a>
            <a href="editora.html">Editoras</a>
            <a href="usuario.html">Usuários</a>
        </div>
        <div class="conteudo" style="margin-top: 230px; text-align: center;">  
            <%
                String editora = request.getParameter("editora");
                String cidade = request.getParameter("cidade");
                int resultado = livraria.novaEditora(editora, cidade);

                if(resultado == 1){            
            %>

                    <h4>Editora já cadastrada</h4>
                    <a href="editora.html" class="btnAdmin">Tentar novamente</a>

            <%
                } else if(resultado == 0){         
            %>

                    <h4>Editora cadastrada com sucesso</h4>
                    <a href="editora.html" class="btnAdmin">Cadastrar nova editora</a>

            <%
                } else {
            %>        

                    <h4>Ocorreu um erro ao tentar salvar uma nova editora!</h4>

            <%  }  

                conexao.fechar();
            %>
        </div>
    </body>
</html>
