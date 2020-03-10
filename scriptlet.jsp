<html>
    <head>
        <title>JSP - Hello, World!</title>
    </head>
    <body>
        <!--O scriptlet (<%%>) é usado para inserção de 
        código Java que será executado a cada nova solicitação
        da página-->
        <%
            out.println("<h2>Primeira pagina JSP</h2>");
            out.println("<p>Hello, World!</p>");
        %>
    </body>
</html>