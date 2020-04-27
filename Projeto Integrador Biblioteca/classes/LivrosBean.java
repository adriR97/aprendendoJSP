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
    
    public LivrosBean(int id, int idEditora, String editora,String titulo, String autor,
    int ano, double preco){
        this.id = id;
        this.idEditora = idEditora;
        this.editora = editora;
        this.titulo = titulo;
        this.autor = autor;
        this.ano = ano;
        this.preco = preco;
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
}
