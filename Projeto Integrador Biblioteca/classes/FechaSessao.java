package classes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dryro
 */
public class FechaSessao extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        
        HttpSession sessao = req.getSession();        
        sessao.invalidate();
        resp.sendRedirect("index.jsp");
        System.out.print(sessao);
    }
}
