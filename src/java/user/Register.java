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

import static dbconn.Connect.st;

/**
 *
 * @author Yashas Hr
 */
public class Register extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        boolean er = false;
        try {
            String type, name, email, dob, phno, pass, cols;
            type = request.getParameter("type");
            name = request.getParameter("fname");
            email = request.getParameter("email");
            dob = request.getParameter("dob");
            phno = request.getParameter("phno");
            pass = request.getParameter("pass");
            if (dob == null && phno == null) {
                cols = "utype,uname,uemail,udate,upass";
            } else if (dob == null) {
                cols = "utype,uname,uemail,uphno,udate,upass";
            } else if (phno == null) {
                cols = "utype,uname,uemail,udob,udate,upass";
            } else {
                cols = "utype,uname,uemail,udob,uphno,udate,upass";
            }
            er = st.executeUpdate("insert into users("+cols+") values(") > 0;
        }catch(Exception e){
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, e);
        }

    }

}
