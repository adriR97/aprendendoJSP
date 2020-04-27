package classes;

import java.sql.*;
import java.util.*;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dryro
 */
public class LivrosModel {
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public LivrosModel(){
        con = Conexao.conectar();
    }
    
    public ArrayList listar(){
        ArrayList colecao = new ArrayList();
        LivrosBean livro;
        String sql = "SELECT livro.*, editora.nome FROM livro INNER JOIN editora ON livro.idEditora = editora.id;";
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();   
            
            while(rs.next()){
                livro = new LivrosBean(rs.getInt("id"), rs.getInt("idEditora"), 
                        rs.getString("nome"), rs.getString("titulo"), rs.getString("autor"),
                        rs.getInt("ano"), rs.getDouble("preco"));
                colecao.add(livro);
            }
            
            return colecao;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public ArrayList listarEditoras(){
        ArrayList colecao = new ArrayList();
        EditoraBean editora;
        String sql = "SELECT id, nome FROM editora";
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                editora = new EditoraBean(rs.getInt("id"), rs.getString("nome"));
                colecao.add(editora);
            }
            
            return colecao;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean editoraExiste(String editora, String cidade){
        int qtde;
        String sql = "SELECT COUNT(*) as qtde FROM editora WHERE nome=? and cidade=?";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, editora);
            stmt.setString(2, cidade);
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
    
    public int novaEditora(String editora, String cidade){
        String sql = "INSERT INTO editora(nome, cidade) VALUES (?,?)";
        
        try {
            if(editoraExiste(editora, cidade)){
                return 1;
            } else{
                stmt = con.prepareStatement(sql);
                stmt.setString(1, editora);
                stmt.setString(2, cidade);
                stmt.executeUpdate();
                return 0;
            }   
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    } 
    
    public int novoLivro(int idEditora, String titulo, String autor, int ano, double preco, InputStream foto){
        String sql = "INSERT INTO livro(idEditora, titulo, autor, ano, preco, foto) "
                + "VALUES (?,?,?,?,?,?)";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idEditora);
            stmt.setString(2, titulo);
            stmt.setString(3, autor);
            stmt.setInt(4, ano);
            stmt.setDouble(5, preco);
            stmt.setBlob(6, foto);
            stmt.executeUpdate();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    } 
    
    public int alterarL(int id, int idEditora, String titulo, String autor, int ano, double preco, InputStream foto){
        int resultado = 0;
        String sql = "UPDATE livro SET idEditora=?, titulo=?, autor=?, ano=?, "
                    + "preco=?, foto=? WHERE id=?"; 
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idEditora);
            stmt.setString(2, titulo);
            stmt.setString(3, autor);
            stmt.setInt(4, ano);
            stmt.setDouble(5, preco);
            if(foto != null){
                stmt.setBlob(6, foto);
            }            
            stmt.setInt(7, id);
            resultado = stmt.executeUpdate(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(LivrosModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
    
    public boolean excluirLivro(int id){
        String sql = "DELETE FROM livro WHERE id=?";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
