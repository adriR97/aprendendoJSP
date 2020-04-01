/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.*;
/**
 *
 * @author dryro
 */
public class Conexao {
    Connection con;
    
    public static Connection conectar(){
        java.sql.Connection conexao = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/projeto";
        String user = "root";
        String password = "";
        
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);    
            return conexao;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void fechar(){
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConexao(){
        return con;
    }
        
}
