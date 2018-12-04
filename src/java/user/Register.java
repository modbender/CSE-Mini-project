/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;  

import static dbconn.Connect.st;
import static dbconn.Connect.con;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;

/**
 *
 * @author Yashas Hr
 */
public class Register extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        boolean check;
        try {
            dbconn.Connect.main(null);
            SimpleDateFormat dForm = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date tday = new Date(); 
            String type, name, email, dob, phno, pass, cols = "", vals = "";
            type = request.getParameter("type").trim();
            name = request.getParameter("fname").trim();
            email = request.getParameter("email").trim();
            pass = request.getParameter("pass").trim();
            cols = "utype,uname,uemail,udate,upass";
            vals = "'"+type+"','"+name+"','"+email+"','"+dForm.format(tday)+"','"+pass+"'";
            String q = "insert into users("+cols+") values("+vals+")";
            System.out.println(q);
            check = st.executeUpdate(q) > 0;
            if(check == true){
                response.sendRedirect("loginS.jsp?type=Signup&signReport=Success");
            }else{
                System.out.print(vals);
                response.sendRedirect("loginS.jsp?type=Signup&signReport=Fail");
            }
            con.close();
        }catch(SQLException ex){
            System.out.println("SQL ERROR : "+ ex);
        }catch(Exception e){
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, e);
            System.out.println(e);
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
