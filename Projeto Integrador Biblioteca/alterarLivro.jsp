<%-- 
    Document   : alterarLivro
    Created on : 08/04/2020, 16:07:50
    Author     : dryro
--%>

<%@page import="classes.EditoraBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="livraria" scope="page" class="classes.LivrosModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Livro</title>
        <link rel="stylesheet" href="estilo.css">
        
        <style>
            .campo{
                width: 250px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@ page import="javax.servlet.http.*" %>
        <div class="menu">
            <a href="livro.jsp">Livros</a>
            <a href="editora.html">Editoras</a>
            <a href="usuario.html">Usuários</a>
        </div>
        <div class="conteudo">
            <%
                String id = request.getParameter("id").trim();
                String titulo = request.getParameter("titulo").trim();
                String autor = request.getParameter("autor").trim();
                String ano = request.getParameter("ano").trim();
                String preco = request.getParameter("preco").trim();
                
                ArrayList colecao;
                EditoraBean editora;
                
                colecao = livraria.listarEditoras();
            %>
            
            <form action="manipulacaoFoto" method="post" style="margin: 190px 0px 0px 410px" enctype="multipart/form-data">
                Título:  <input type="text" name="titulo" class="campo"
                                value="<%= titulo %>" style="margin-left: 30px;"> <br>        
                
                Editora:  <select style="margin-left: 19px; width: 256px; text-align: center" name="editora">
                             <%
                                for(int i=0; i<colecao.size(); i++){
                                   editora = (EditoraBean)colecao.get(i);
                                   out.print("<option value=\"" + editora.getIdEditora() 
                                           + "\">" + editora.getNome() + "</option>");
                                }                               
                             %>
                          </select><br>             
                
                Autor:  <input type="text" name="autor" class="campo"
                               value="<%= autor %>" style="margin-left: 32px;"> <br>
                Ano:  <input type="text" name="ano" class="campo"
                             value="<%= ano %>" style="margin-left: 42px;"> <br>
                Preço:  <input type="text" name="preco" class="campo"
                               value="<%= preco %>" style="margin-left: 28px;"> <br><br>
                Selecione a foto do livro:<br>
                <input type="file" name="foto" accept="image/png, image/jpeg"><br>
                <input type="hidden" name="id" value="<%= id %>"><br>
                <input type="hidden" name="opcao" value="2"><br>
                <input type="submit" value="Alterar Livro" class="btnAdmin">
                
                <% conexao.fechar(); %>
            </form>
        </div>
    </body>
</html>
