<%-- 
    Document   : index
    Created on : 06/04/2020, 17:00:37
    Author     : dryro
--%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.mysql.jdbc.Blob"%>
<%@page import="java.io.InputStream"%>
<%@page import="classes.LivrosBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="livraria" scope="page" class="classes.LivrosModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial</title>
        <link rel="stylesheet" href="estilo.css">
        <style>
            #filtroLivro{
                background-image: url('imagens/iconSearch.png');
                background-position: 580px 4px;
                background-repeat: no-repeat;
                float: left;
                padding: 10px;
                border: 1px solid #ddd;
                width: 600px;
                margin: 5px;
                font-size: 16px;
                height: 18px;
            }
            .texto{
                height: 18px;
                font-size: 16px;
                margin: 5px;
                padding: 10px;
            }
            #btnLogin{
                padding: 9.5px;
                font-size: 16px;
                margin-right: 5px;
                border: none;
            } 
            #btnLogin:hover{
                background: #0086b3;
                border:none;
                color: white;
            }
            #conteudo{
                width: 90%;
                height: 200px;
                margin: 0px auto;
                margin-top: 20px;
                background: #99ff99;
            }
            .coluna {
                float: left;
                width: 25%;
                padding: 10px;
                border: 1px solid black;
            }
        </style>
    </head>
    <body style="margin-top: -20px;">
        <div id="divLogo">
            <h2 id="logo">CATÁLOGO DE LIVROS VIRTUAL</h2>
        </div>
        <div id="divBar">
            <input type="text" id="filtroLivro" onkeyup="filtrarLivros()" 
                   placeholder="Pesquise pelo título">
            <form style="float: right;" action="admin.jsp" method="post">
                <input type="text" name="usuario" class="texto" placeholder="Usuário"
                       style="margin-right: -3px;">
                <input type="password" name="senha" class="texto" placeholder="Senha"
                       style="margin-right: 0px;">
                <input type="submit" value="Entrar" id="btnLogin">
            </form>
        </div>
        
        <%
            ArrayList colecao;
            LivrosBean livro;
            colecao = livraria.listar();  
        %>
        
        <div id="conteudo">
        <%
            for(int i=0; i<colecao.size(); i++){
                livro = (LivrosBean)colecao.get(i);
                Blob blob = (Blob)livro.getFoto();
                InputStream in = blob.getBinaryStream();
                StringBuilder ret = new StringBuilder();
                int lidos=0;
                byte[] buffer = new byte[2048];
                String temp = null;
                while ( (lidos=in.read(buffer)) != -1){
                    temp = new String(buffer,0,lidos);
                    ret.append(temp);
                    String ret2;
                    ret2 = ret.toString();
                }
}
        %>   
            
                <div class="coluna">
                </div>
                
        <%
            }
        %>
                    
        </div>
    </body>
</html>
