/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author dryro
 */
public class EditoraBean {
    int idEditora;
    String nome;
    
    public EditoraBean(int idEditora, String nome){
        this.idEditora = idEditora;
        this.nome = nome;
    }
    
    public int getIdEditora() {
        return idEditora;    
    }
    
    public String getNome() {
        return nome;    
    }
}
