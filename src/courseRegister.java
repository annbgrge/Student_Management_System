

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/courseRegister"})
public class courseRegister extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
        	 String course_id = (String) request.getParameter("course_id");
            String course_name = (String) request.getParameter("course_name");
           
            String semester = (String) request.getParameter("semester");
            String branch = (String) request.getParameter("branch");
            String faculty_name = (String) request.getParameter("faculty_name");
            String username = (String) request.getParameter("username"); 
         Connection con=null;
         con=DBConnection.dbconnect();
       
               
               
          String qr="insert into courses(course_id,course_name,semester,branch,faculty_name,username) values(?,?,?,?,?,?)";
          PreparedStatement  ps = con.prepareStatement(qr);
          ps.setString(1,course_id);
         ps.setString(2,course_name);
         ps.setString(3,semester);
         ps.setString(4,branch);
         ps.setString(5,faculty_name);
         ps.setString(6,username);
         ps.executeUpdate();
         response.sendRedirect("course_register.jsp");
          
        } catch (SQLException ex) {
            Logger.getLogger(courseRegister.class.getName()).log(Level.SEVERE, null, ex);
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
