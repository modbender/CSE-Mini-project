/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package def;

import static dbconn.Connect.st;
import static dbconn.Connect.con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yashas Hr
 */
public class Quit extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        String uid = session.getAttribute("uid").toString();
        String type = request.getParameter("type");
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            dbconn.Connect.main(null);
            out.println("<!DOCTYPE html>");
            out.println("<center>");
            if (type.equals("force")) {
                st.executeUpdate("delete from feeds where uid="+uid+";");
            }else{
                ResultSet rs1 = st.executeQuery("select count(*) from qs q,feeds f where f.qid=q.qid and f.uid="+uid+" and q.answer = f.feed;");
                dbconn.Connect.main(null);
                ResultSet rs2 = st.executeQuery("select count(*) from qs q,feeds f where f.qid=q.qid and f.uid="+uid+";");
                int total = rs2.getInt(1);
                int correct = rs1.getInt(1);
                out.println("<h1>You were able to answer "+correct+" correct out of "+total+" questions</h1>");
                out.println("Congrats!");
            }
            out.println("</center>");
            con.close();
        }catch(Exception e){
            System.out.println("Error at Quit.java\nError: "+e);
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
