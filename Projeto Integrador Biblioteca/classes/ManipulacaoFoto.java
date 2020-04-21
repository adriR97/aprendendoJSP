/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author dryro
 */
@WebServlet("/manipulacaoFoto")
@MultipartConfig(maxFileSize = 1024*1024*50) // 50MB


public class ManipulacaoFoto extends HttpServlet {

    private LivrosModel livro;
    
    @Override
    public void init() {
        livro = new LivrosModel();
    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        int id, resultado;      
        int opcao = Integer.parseInt(request.getParameter("opcao"));
        int idEditora = Integer.parseInt(request.getParameter("editora"));
        String titulo = request.getParameter("titulo").trim();
        String autor = request.getParameter("autor").trim();
        int ano = Integer.parseInt(request.getParameter("ano").trim());
        double preco = Double.parseDouble(request.getParameter("preco").trim());      
        Part filePart = request.getPart("foto");        
        InputStream inputStream = null;
        String mensagem = null;
        
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        
        if(opcao == 1){            
            if(filePart != null){
                resultado = livro.novoLivro(idEditora, titulo, autor, ano, preco, inputStream);
                
                if(resultado > 0){
                    mensagem = "O livro foi adicionado com sucesso!";
                } else {
                    mensagem = "Não foi possível adicionar um novo livro!";
                }
            } else {
                mensagem = "É necessário selecionar uma imagem para o livro!";
            }
        } else if (opcao == 2){
            id = Integer.parseInt(request.getParameter("id").trim());
            resultado = livro.alterarL(id, idEditora, titulo, autor, ano, preco, inputStream);
        
            if(resultado > 0){
                mensagem = "O livro foi atualizado com sucesso";
            } else {
                mensagem = "Não foi possível atualizar o livro";
            }
            
        }    
        
        request.setAttribute("Mensagem", mensagem);
        getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
