<%-- 
    Document   : getImagem
    Created on : 27/04/2020, 16:10:24
    Author     : dryro
--%>

<%@page import="classes.Conexao"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("id");

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try{
        con = Conexao.conectar();
        PreparedStatement ps = con.prepareStatement("select foto from livro where id=?");
        ps.setString(1, id);
        rs = ps.executeQuery();

        if(rs.next()){
            Blob blob = rs.getBlob("foto");
            byte byteArray[] = blob.getBytes(1, (int)blob.length());

            response.setContentType("image/gif");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        }
    } catch(Exception e){
        e.printStackTrace();
    } finally{
        if(con != null){
            try{
                con.close();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
%>
