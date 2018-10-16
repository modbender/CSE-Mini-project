/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import static dbconn.Connect.st;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            ResultSet rs = st.executeQuery("select type,uemail,upass from users where type='"+type+" and uemail='"+uname+" and upass='"+pass+"'");
            if(rs.next()){
                HttpSession session = request.getSession(true);
                session.setAttribute("type", type);
                session.setAttribute("name", uname);
                response.sendRedirect("loginS.jsp?type=Login&signReport=Success");
            }else{
                response.sendRedirect("loginS.jsp?type=Login&signReport=Fail");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
