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
public class BancoDePerguntas {
    private Connection con;
    private PreparedStatement psPer, psAlt;   
    private ResultSet rsPer, rsAlt;
    
    public BancoDePerguntas(){
        con = Conexao.conectar();
    }
    
    public ArrayList getPerguntas(){
        ArrayList colecao = new ArrayList();
        Pergunta pergunta;
        String sql, sql2;
        sql = "SELECT * FROM perguntas ORDER BY id";
        sql2 = "SELECT * FROM alternativas WHERE id_pergunta = ?";
        
        try {
            psPer = con.prepareStatement(sql);
            rsPer = psPer.executeQuery();
            
            while(rsPer.next()){
                //anota a pergunta   
                pergunta = new Pergunta();   
                pergunta.setId(rsPer.getInt("id"));   
                pergunta.setPergunta(rsPer.getString("pergunta"));
                
                //enviando o id da pergunta para receber as alternativas
                psAlt = con.prepareStatement(sql2);
                psAlt.setInt(1, rsPer.getInt("id"));          
                rsAlt = psAlt.executeQuery();
                
                while(rsAlt.next()){
                    //anota a alternativa
                    pergunta.setAlternativa(rsAlt.getString("alternativa"));
                    
                    //verificando se é a correta
                    if(rsAlt.getBoolean("alternativa_correta"))
                        pergunta.setCorreta(rsAlt.getInt("id_alternativa"));
                }
                
                colecao.add(pergunta);
            }
            
            return colecao;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
