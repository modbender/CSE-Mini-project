/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package def;

import static dbconn.Connect.con;
import static dbconn.Connect.st;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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
public class KbcResults extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            dbconn.Connect.main(null);
            HttpSession sess = request.getSession(false);
            String uid = sess.getAttribute("uid").toString();
            ResultSet rs = st.executeQuery("select count(*) from qs q,feeds f where f.qid=q.qid and f.uid="+uid+" and q.answer = f.feed");
            if(rs.next()){
                int correct = Integer.parseInt(rs.getString(1));
                if(correct == 15){
                    CallableStatement cs = con.prepareCall("{call addWin(?)}");
                    cs.setString(1, uid);
                    cs.execute();
                    response.sendRedirect("/CS121/kbc/result?win=true");
                }else{
                    st.executeUpdate("insert into results(uid,correct,wrong) values("+uid+","+correct+","+(15-correct)+")");
                    response.sendRedirect("/CS121/kbc/result?correct="+correct);
                }
            }else{
                System.out.println("Error at KBCResults\nError : Count error");
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error at KBCResults\nError : "+e);
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
