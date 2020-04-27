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
