/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author dryro
 */
public class LivrosBean {
    int id;
    int idEditora;
    String editora;
    String titulo;
    String autor;
    int ano;
    double preco;
    String foto;
    
    public LivrosBean(int id, int idEditora, String editora,String titulo, String autor,
    int ano, double preco, String foto){
        this.id = id;
        this.idEditora = idEditora;
        this.editora = editora;
        this.titulo = titulo;
        this.autor = autor;
        this.ano = ano;
        this.preco = preco;
        this.foto = foto;
    }
    
    public int getId() {
        return id;    
    }
    
    public int getIdEditora() {
        return idEditora;    
    }
    
    public String getEditora() {
        return editora;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public String getAutor(){
        return autor;
    }
    
    public int getAno(){
        return ano;
    }
    
    public double getPreco(){
        return preco;
    }
    
    public String getFoto(){
        return foto;
    }
}
