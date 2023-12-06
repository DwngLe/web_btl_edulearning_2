/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Enrolled;

import com.sun.java.swing.plaf.windows.resources.windows;
import dao.EnrollDAO;
import dao.UserDAO;
import entity.EnrolledCourse;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javafx.scene.control.Alert;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddEnrolled", urlPatterns = {"/addenrolled"})
public class AddEnrolled extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Successfully!!!</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Successfully!!!</h1>");
            out.println("</body>");
            out.println("</html>");
        }
         String referer = request.getHeader("Referer");
         response.sendRedirect(referer);
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
        User user;
        UserDAO udao = new UserDAO();
        String idUser = (String) request.getSession().getAttribute("id");
        user = udao.getUserById(idUser);
        String id_course = request.getParameter("id");
        
        EnrolledCourse e = new EnrolledCourse(id_course, idUser);
        
        EnrollDAO dao = new EnrollDAO();
        dao.addNewEnroll(e);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
       
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
