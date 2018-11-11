/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import static dbconn.Connect.st;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yashas Hr
 */
public class Login extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try{
            String type = request.getParameter("type");
            String uname = request.getParameter("lemail");
            String pass = request.getParameter("lpass");
            dbconn.Connect.main(null);
            ResultSet rs = st.executeQuery("select uid,utype,uemail,upass from users where utype='"+type+"' and uemail='"+uname+"' and upass='"+pass+"';");
            if(rs.next()){
                HttpSession session = request.getSession(true);
                session.setAttribute("type", type);
                session.setAttribute("name", uname);
                session.setAttribute("uid", rs.getString("uid"));
                response.sendRedirect("loginResult?type=Login&signReport=Success");
            }else{
                response.sendRedirect("loginResult?type=Login&signReport=Fail");
            }
        }catch(Exception e){
            System.out.println("Error in login_go \n"+e);
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
