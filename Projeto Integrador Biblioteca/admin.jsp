<%-- 
    Document   : admin
    Created on : 06/04/2020, 16:56:34
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="classes.UsuarioModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Administrativa</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <%@ page import="javax.servlet.http.*" %>
        
        
            <%
                String usuario = request.getParameter("usuario");
                String senha = request.getParameter("senha");
                
                if(user.verificaUsuario(usuario, senha)){
                    HttpSession sessao = request.getSession();
                    
                    sessao.setAttribute("usuario", usuario);
                    sessao.setAttribute("senha", senha);
                
            %>
                    <div class="menu">
                        <a href="livro.jsp">Livros</a>
                        <a href="editora.html">Editoras</a>
                        <a href="usuario.html">Usuários</a>
                    </div>
        
                    <div class="conteudo" style="text-align: center">
                        <h3 style="margin-top: 270px">Bem-vindo(a) 
                            <%= session.getAttribute("usuario") %></h3>            
                    </div>
            
            <%
                } else {
            %>
                    
                    <div style="text-align: center; margin-top: 270px;">
                        <h3>Usuário ou senha incorretos</h3>
                        <a href="index.jsp" id="btnErroLogin">Voltar para página inicial</a>
                    </div>
            
            <%  }  
                
                conexao.fechar();
            %>
    </body>
</html>
