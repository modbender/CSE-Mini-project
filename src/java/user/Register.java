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

/**
 *
 * @author Yashas Hr
 */
public class Register extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        boolean check = false;
        try {
            SimpleDateFormat dForm = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date tday = new Date(); 
            String type, name, email, dob, phno, pass, cols = "", vals = "";
            type = request.getParameter("type");
            name = request.getParameter("fname");
            email = request.getParameter("email");
            dob = request.getParameter("dob");
            phno = request.getParameter("phno");
            pass = request.getParameter("pass");
            if (dob == null && phno == null) {
                cols = "utype,uname,uemail,udate,upass";
                vals = "'"+type+"','"+name+"','"+email+"','"+dForm.format(tday)+"','"+pass+"'";
            } else if (dob == null && phno != null) {
                cols = "utype,uname,uemail,uphno,udate,upass";
                vals = "'"+type+"','"+name+"','"+email+"',"+phno+",'"+dForm.format(tday)+"','"+pass+"'";
            } else if (dob != null && phno == null) {
                cols = "utype,uname,uemail,udob,udate,upass";
                vals = "'"+type+"','"+name+"','"+email+"','"+dob+"','"+dForm.format(tday)+"','"+pass+"'";
            } else if (dob != null && phno != null) {
                cols = "utype,uname,uemail,udob,uphno,udate,upass";
                vals = "'"+type+"','"+name+"','"+email+"','"+dob+"',"+phno+",'"+dForm.format(tday)+"','"+pass+"'";
            }
            check = st.executeUpdate("insert into users("+cols+") values("+vals+");") > 0;
            if(check == true){
                response.sendRedirect("loginS.jsp?type=Signup&signReport=Success");
            }else{
                response.sendRedirect("loginS.jsp?type=Login&signReport=Fail");
            }
        }catch(Exception e){
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, e);
        }

    }

}
