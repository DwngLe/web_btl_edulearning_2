package controller.User;

import entity.User;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duong
 */
@WebServlet(name="ForgetPassword", urlPatterns={"/forgetpassword/*"})
public class UserForgetPassword extends HttpServlet {
    UserDAO userDAO = new UserDAO();
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if ("true".equals(request.getParameter("formSubmitted"))) {
            List<User> listUser = new ArrayList<>();
            String phoneNumber = request.getParameter("phoneNumber");
            System.out.println("PhoneNum:" + phoneNumber);
            listUser = userDAO.findUserByPhone(phoneNumber);
            request.setAttribute("listAccount", listUser);
        }
        request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
