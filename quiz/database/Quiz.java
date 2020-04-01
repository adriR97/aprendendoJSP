/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import database.*;

/**
 *
 * @author dryro
 */
public class Quiz extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException    {
    
        PrintWriter out;
        resp.setContentType("text/html");
        out = resp.getWriter();
        long lastAccessedTime, submitTime, intervalTime;
        
        HttpSession sessao = req.getSession();
    
        lastAccessedTime = sessao.getLastAccessedTime();
        submitTime = System.currentTimeMillis();
        intervalTime = (submitTime - lastAccessedTime) / 1000;
        
        out.println("<html>"); 
        out.println("<head>"); 
        out.println("<title>Quiz</title>"); 
        out.println("</head>"); 
        out.println("<body>");
        
        if (intervalTime > 120){            
            out.println("<p>Que pena! Você não respondeu no tempo permitido!</p>");
        } else {
            int acertos = 0;      
            String param;
            
            //retorna o banco de perguntas contido na sessão
            ArrayList colecao = (ArrayList) sessao.getAttribute("bancoPerguntas");
            //declara um objeto para acessar perguntas individualmente
            Pergunta p;
            
            for (int i=0; i < colecao.size(); i++) {
                param = "p" + (i + 1);       
                p = (Pergunta) colecao.get(i);
                
                if (req.getParameter(param) != null &&
                        Integer.parseInt(req.getParameter(param)) == p.getCorreta()){
                    acertos++;
                }
            }
            
            if (acertos == 0){
                out.println("<p>Que pena. Você não acertou nenhuma</p>");
            } else {
                out.println("<p>Você acertou " + acertos + " resposta(s).</p>");
            }
        }
        
        out.println("<a href=\"quiz.jsp\">Responder novamente</a>");        
        out.println("<br>");
        out.println("<a href=\"quiz\">Sair</a>");
        out.println("</body>");
        out.println("</html>");
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        
        PrintWriter out;
        resp.setContentType("text/html");
        out = resp.getWriter();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Quiz</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>Obrigado por ter participado!</p>");
        out.println("</body>");
        out.println("</html>");
        
        HttpSession sessao = req.getSession();        
        sessao.invalidate();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
