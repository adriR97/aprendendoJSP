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
public class Usuario {
    private Connection con;   
    private PreparedStatement ps;   
    private ResultSet rs;
    private String primeiro_nome;   
    private String sobrenome;   
    private char sexo;
    
    public Usuario(){
        con = Conexao.conectar();
    }
    
    public String getPrimeiroNome(){      
        return primeiro_nome;
    }
    
    public String getSobrenome(){      
        return sobrenome;
    }
    
    public char getSexo(){      
        return sexo;
    }
    
    public boolean usuarioExiste(String nome_usuario){
        int qtde;
        String sql = "SELECT COUNT(*) as qtde FROM usuario WHERE nome_usuario=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nome_usuario);
            rs.next();
            
            qtde = rs.getInt("qtde");
            
            if(qtde == 0){
                return false;
            } else{
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int inserir(String primeiro_nome, String sobrenome, char sexo, 
            String nome_usuario, String senha){
        String sql = "INSERT INTO usuario VALUES (?,?,?,?,?)";
        
        try {
            if(usuarioExiste(nome_usuario)){
                return 1;//usuário já existe
            } else{
                ps = con.prepareStatement(sql);
                ps.setString(1, nome_usuario);
                ps.setString(2, senha);
                ps.setString(3, primeiro_nome);
                ps.setString(4, sobrenome);
                ps.setString(5, String.valueOf(sexo));
                ps.executeUpdate();
                return 0;//usuário registrado
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;//erro na tentativa de inserção
        }
        
    }
    
    public int autenticar(String nome_usuario, String senha){
        int qtde;
        String sql = "SELECT primeiro_nome, sobrenome, sexo, COUNT(*) as qtde"
                + " FROM usuario WHERE nome_usuario=? and senha=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nome_usuario);
            ps.setString(2, senha);
            rs = ps.executeQuery();
            rs.next();
            
            qtde = rs.getInt("qtde");
            
            if(qtde == 1){
                this.primeiro_nome = rs.getString("primeiro_nome");
                this.sobrenome = rs.getString("sobrenome");     
                this.sexo = rs.getString("sexo").charAt(0);
            }
            
            return qtde;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
