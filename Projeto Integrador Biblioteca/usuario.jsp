<%-- 
    Document   : usuario
    Created on : 07/04/2020, 13:36:50
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="classes.UsuarioModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários</title>
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
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            int resultado = user.novoUsuario(usuario, senha);
            
            if(resultado == 1){            
        %>
        
                <h4>Usuário já cadastrado</h4>
                <a href="usuario.html" class="btnAdmin">Tentar novamente</a>
        
        <%
            } else if(resultado == 0){         
        %>
        
                <h4>Usuário cadastrado com sucesso</h4>
                <a href="usuario.html" class="btnAdmin">Cadastrar novo usuário</a>
                
        <%
            } else {
        %>        
                
                <h4>Ocorreu um erro ao tentar salvar o usuário!</h4>
                
        <%  }  
            
            conexao.fechar();
        %>      
                
        </div>
    </body>
</html>
