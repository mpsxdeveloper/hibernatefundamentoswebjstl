package hibernatefundamentosweb.controllers;

import hibernatefundamentos.pojos.Curso;
import hibernatefundamentos.pojos.Estudante;
import hibernatefundamentosweb.util.HibernateManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ServletController", urlPatterns = {"/ServletController"})
public class ServletController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String r = request.getParameter("r");
        if(r.equals("list")) {
            HibernateManager manager = new HibernateManager();
            List<Estudante> estudantes = manager.readAll();
            RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
            request.setAttribute("estudantes", estudantes);
            rd.forward(request, response);
        }
        else if(r.equals("delete")) {
            int id = Integer.valueOf(request.getParameter("id"));
            HibernateManager manager = new HibernateManager();
            manager.delete(id);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else if(r.equals("read")) {
            int id = Integer.valueOf(request.getParameter("id"));
            HibernateManager manager = new HibernateManager();
            Estudante estudante = manager.read(id);
            RequestDispatcher rd = request.getRequestDispatcher("read.jsp");
            request.setAttribute("estudante", estudante);
            rd.forward(request, response);
        }
        else if(r.equals("search")) {
            String nome = request.getParameter("nome").toUpperCase();
            HibernateManager manager = new HibernateManager();
            List<Estudante> estudantes = manager.search(nome);
            RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
            request.setAttribute("estudantes", estudantes);
            rd.forward(request, response);
        }
        else if(r.equals("new")) {
            RequestDispatcher rd = request.getRequestDispatcher("save.jsp");
            rd.forward(request, response);
        }
        else if(r.equals("save")) {
            String nome = request.getParameter("nome").toUpperCase();
            String titulo1 = request.getParameter("titulo1").toUpperCase();
            String titulo2 = request.getParameter("titulo2").toUpperCase();
            String titulo3 = request.getParameter("titulo3").toUpperCase();
            List<String> nomes = new ArrayList<>();
            nomes.add(titulo1);
            if(titulo2 != null && !titulo2.equals("")) {
                nomes.add(titulo2);
            }
            if(titulo3 != null && !titulo3.equals("")) {
                nomes.add(titulo3);
            }
            List<Curso> cursos = new ArrayList<>();
            for(String n : nomes) {
                Curso c = new Curso();
                c.setTitulo(n);
                cursos.add(c);
            }            
            HibernateManager manager = new HibernateManager();
            Estudante estudante = new Estudante();
            estudante.setNome(nome);
            estudante.setCursos(cursos);
            boolean b = manager.save(estudante);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);                    
        }
        else if(r.equals("edit")) {
            int id = Integer.valueOf(request.getParameter("id"));
            HibernateManager manager = new HibernateManager();
            Estudante estudante = manager.read(id);
            RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
            request.setAttribute("estudante", estudante);
            rd.forward(request, response);
        }
        else if(r.equals("update")) {
            Integer id = Integer.valueOf(request.getParameter("id"));
            String nome = request.getParameter("nome").toUpperCase();
            String titulo1 = request.getParameter("titulo1").toUpperCase();
            String titulo2 = request.getParameter("titulo2").toUpperCase();
            String titulo3 = request.getParameter("titulo3").toUpperCase();
            List<String> nomes = new ArrayList<>();
            nomes.add(titulo1);
            if(titulo2 != null && !titulo2.equals("")) {
                nomes.add(titulo2);
            }
            if(titulo3 != null && !titulo3.equals("")) {
                nomes.add(titulo3);
            }
            List<Curso> cursos = new ArrayList<>();
            for(String n : nomes) {
                Curso c = new Curso();
                c.setTitulo(n);
                cursos.add(c);
            }            
            HibernateManager manager = new HibernateManager();
            Estudante estudante = new Estudante();
            estudante.setId(id);
            estudante.setNome(nome);
            estudante.setCursos(cursos);
            manager.update(estudante);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else if(r.equals("index")){
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("erro404.jsp");
            rd.forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
