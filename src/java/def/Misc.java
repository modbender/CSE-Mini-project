/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package def;

import static dbconn.Connect.con;
import static dbconn.Connect.st;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yashas Hr
 */
public class Misc {

    public static String uri(String url) {
        return url.substring(url.indexOf("/", url.indexOf("/CS121/") + 1) + 1, url.length());
    }

    public static void checkCon() throws SQLException {
        if (con == null || con.isClosed()) {
            dbconn.Connect.main(null);
        }
    }
    public static List<String> umails(){
        List<String> mails = new ArrayList<>();
        try{
            checkCon();
            ResultSet r = st.executeQuery("select uemail from users");
            while(r.next()){
                mails.add(r.getString(1));
            }
        }catch(SQLException e){
            Logger.getLogger(Misc.class.getName()).log(Level.SEVERE, null, e);
        }
        return mails;
    }
}
