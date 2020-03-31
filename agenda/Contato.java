/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author dryro
 */
public class Contato {
    int id;
    String nome;
    char sexo;
    int dia_niver;
    int mes_niver;
    String fone;
    
    public Contato(int id, String nome, char sexo, int dia_niver, int mes_niver, String fone) {
        this.id = id;
        this.nome = nome;
        this.sexo = sexo;
        this.dia_niver = dia_niver;
        this.mes_niver = mes_niver;
        this.fone = fone;        
    }
    
    public int getId() {
        return id;    
    }    
    
    public String getNome() {
        return nome;    
    }    
    
    public char getSexo() {
        return sexo;    
    }    
    
    public int getDiaNiver() {
        return dia_niver;    
    }    
    
    public int getMesNiver() {
        return mes_niver;    
    }    
    
    public String getFone() {
        return fone;
    }
}
