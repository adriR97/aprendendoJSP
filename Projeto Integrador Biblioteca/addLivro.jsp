<%-- 
    Document   : addLivro
    Created on : 20/04/2020, 15:57:06
    Author     : dryro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="classes.EditoraBean"%>
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
                ArrayList colecao;
                EditoraBean editora;
                
                colecao = livraria.listarEditoras();
            %>
            
            <form action="manipulacaoFoto" method="post" style="margin: 190px 0px 0px 410px" enctype="multipart/form-data">
                Título:  <input type="text" name="titulo" class="campo" style="margin-left: 30px;"> <br>        
                
                Editora:  <select style="margin-left: 19px; width: 256px; text-align: center" name="editora">
                             <%
                                for(int i=0; i<colecao.size(); i++){
                                   editora = (EditoraBean)colecao.get(i);
                                   out.print("<option value=\"" + editora.getIdEditora() 
                                           + "\">" + editora.getNome() + "</option>");
                                }                               
                             %>
                          </select><br>             
                
                Autor:  <input type="text" name="autor" class="campo" style="margin-left: 32px;"> <br>
                Ano:  <input type="text" name="ano" class="campo" style="margin-left: 42px;"> <br>
                Preço:  <input type="text" name="preco" class="campo" style="margin-left: 28px;"> <br><br>
                Selecione a foto do livro:<br>
                <input type="file" name="foto" accept="image/png, image/jpeg"><br>
                <input type="hidden" name="opcao" value="1"><br>
                <input type="submit" value="Adicionar Livro" class="btnAdmin">
            </form>
        </div>
    </body>
</html>
