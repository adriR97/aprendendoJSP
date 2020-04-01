/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author dryro
 */
public class Pergunta {
    int id;
    String pergunta;
    String alternativas[] = new String[4];
    int correta;
    int indice = 0;
    
    public void setId(int id) {
        this.id = id;    
    }
    
    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;    
    }
    
    public void setAlternativa(String alternativa) {
        this.alternativas[indice] = alternativa;indice++;    
    }
    
    public void setCorreta(int correta) {
        this.correta = correta;
    }
    
    public int getId() {
        return id;    
    }
    
    public String getPergunta() {
        return pergunta;    
    }    
    
    public String[] getAlternativas() {
        return alternativas;    
    }    
    
    public int getCorreta() {
        return correta;    
    }
}
