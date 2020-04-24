<%-- 
    Document   : livro
    Created on : 07/04/2020, 16:33:29
    Author     : dryro
--%>

<%@page import="classes.LivrosBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="livraria" scope="page" class="classes.LivrosModel" />
<jsp:useBean id="conexao" scope="page" class="classes.Conexao" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Livros</title>
        <link rel="stylesheet" href="estilo.css">
        
        <style>
            table, td, th {  
                border: 1px solid #ddd;
                text-align: left;
            }
            
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 15px;
            }
            
            #filtroLivro{
                background-image: url('imagens/iconSearch.png');
                background-position: 280px 3px;
                background-repeat: no-repeat;
                float: right;
                padding: 10px;
                border: 1px solid #ddd;
                width: 300px;
            }
        </style>
        
        <script>
            function filtrarLivros() {
                var input, filter, table, tr, td, i, texto;
                input = document.getElementById("filtroLivro");
                filter = input.value.toUpperCase();
                table = document.getElementById("tabelaDeLivros");
                tr = table.getElementsByTagName("tr");

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        texto = td.textContent || td.innerText;
                        if (texto.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
        <div class="menu">
            <a href="livro.jsp">Livros</a>
            <a href="editora.html">Editoras</a>
            <a href="usuario.html">Usuários</a>
        </div>        
        <div class="conteudo" style="text-align: center; margin: 20px 0 50px 160px">  
            <a href="addLivro.jsp" class="btnAdmin" style="float: left; margin-bottom: 10px;">
                Adicionar Livro
            </a>
            <input type="text" id="filtroLivro" onkeyup="filtrarLivros()" 
                   placeholder="Pesquise pelo título">
            
            <%
                ArrayList colecao;
                LivrosBean livro;
                colecao = livraria.listar();
                
                if(colecao != null){              
            %>
            
                    <table style="margin-top: 100px" id="tabelaDeLivros">
                        <tr>
                            <th>Título</th>
                            <th>Editora</th>
                            <th>Autor</th>
                            <th>Ano</th>
                            <th>Preço</th>
                        </tr>
                        
                <%
                    for(int i=0; i<colecao.size(); i++){
                        livro = (LivrosBean)colecao.get(i);
                %>
                       
                        <tr>
                            <td><%= livro.getTitulo() %></td>
                            <td><%= livro.getEditora() %></td>
                            <td><%= livro.getAutor() %></td>
                            <td><%= livro.getAno() %></td>
                            <td><%= livro.getPreco() %></td>
                            <td>
                                <a href="alterarLivro.jsp?id=<%= livro.getId() %>&titulo=<%= livro.getTitulo() %>&autor=<%= livro.getAutor() %>&ano=<%= livro.getAno() %>&preco=<%= livro.getPreco() %>">
                                    Alterar
                                </a>
                            </td>
                            <td>
                                <a href="excluirLivro.jsp?id=<%= livro.getId() %>">
                                    Excluir
                                </a>
                            </td>
                        </tr>
                            
                <%
                    }
                %>      
                            
                    </table>
                    
            <%
                } else {
                    out.println("<h3>Erro ao tentar listar os livros!</h3>");
                }
                
                conexao.fechar();
            %>          
            
        </div>        
    </body>
</html>
