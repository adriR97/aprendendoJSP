package classes;

import java.sql.*;
/**
 *
 * @author dryro
 */
public class UsuarioModel {
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public UsuarioModel(){
        con = Conexao.conectar();
    }
    
    public boolean verificaUsuario(String usuario, String senha){
        String sql = "SELECT * FROM usuario WHERE nome=? and senha=?";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();
            
            if (rs.next() == true) {
		return true;
            } else {
		return false;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean usuarioExiste(String usuario){
        int qtde;
        String sql = "SELECT COUNT(*) as qtde FROM usuario WHERE nome=?";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario);
            rs = stmt.executeQuery();
            rs.next();
            
            qtde = rs.getInt("qtde");
            
            if(qtde > 0){
                return true;
            } else{
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int novoUsuario(String usuario, String senha){
        String sql = "INSERT INTO usuario(nome, senha) VALUES (?,?)";
        
        try {
            if(usuarioExiste(usuario)){
                return 1;
            } else{
                stmt = con.prepareStatement(sql);
                stmt.setString(1, usuario);
                stmt.setString(2, senha);
                stmt.executeUpdate();
                return 0;
            }   
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }    
}
