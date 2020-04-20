/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
import java.util.*;
/**
 *
 * @author dryro
 */
public class Agenda {
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public Agenda(){
        con = Conexao.conectar();
    }
    
    public boolean inserir(String nome, char sexo, int dia, int mes, String fone){
        try {
            int id = gerarId();
            stmt = con.prepareStatement("INSERT INTO agenda VALUES (?,?,?,?,?,?)");
            stmt.setInt(1, id);
            stmt.setString(2, nome);
            stmt.setString(3, String.valueOf(sexo));
            stmt.setInt(4, dia);
            stmt.setInt(5, mes);
            stmt.setString(6, fone);
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int gerarId(){
        String novoId;
        
        try {
            stmt = con.prepareStatement("SELECT MAX(id) as novoid FROM agenda");
            rs = stmt.executeQuery();
            rs.next();
            novoId = rs.getString("novoid");
            
            if(novoId == null){
                return 1;
            } else {
                return Integer.parseInt(novoId) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public boolean atualizar(int id, String nome, char sexo, int dia, int mes, String fone){
        try {
            stmt = con.prepareStatement("UPDATE agenda SET nome=?, sexo=?, dia_niver=?, " +
                                        "mes_niver=?, fone=? WHERE id=?");
            
            stmt.setString(1, nome);
            stmt.setString(2, String.valueOf(sexo));
            stmt.setInt(3, dia);
            stmt.setInt(4, mes);
            stmt.setString(5, fone);
            stmt.setInt(6, id);
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluir(int id){
        try {
            stmt = con.prepareStatement("DELETE FROM agenda WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ArrayList listarColecao(){
        ArrayList colecao = new ArrayList();
        Contato contato;
        String sql = "SELECT * FROM livro";
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();           
            
            while(rs.next()){
                contato = new Contato(rs.getInt("id"), rs.getString("nome"), 
                        rs.getString("sexo").charAt(0), rs.getInt("dia_niver"),
                        rs.getInt("mes_niver"),rs.getString("fone"));
                colecao.add(contato);
            }
            
            return colecao;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
