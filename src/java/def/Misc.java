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

    static String[] options = {"A", "B", "C", "D"};

    public static String uri(String url) {
        return url.substring(url.indexOf("/", url.indexOf("/CS121/") + 1) + 1, url.length());
    }

    public static void checkCon() throws SQLException {
        if (con == null || con.isClosed()) {
            dbconn.Connect.main(null);
        }
    }

    public static List<String> umails() {
        List<String> mails = new ArrayList<>();
        try {
            dbconn.Connect.main(null);
            ResultSet r = st.executeQuery("select uemail from users");
            while (r.next()) {
                mails.add(r.getString(1));
            }
        } catch (SQLException e) {
            Logger.getLogger(Misc.class.getName()).log(Level.SEVERE, null, e);
        }
        return mails;
    }

    public static String res(String f) {
        String res = "/CS121/res/";
        String t = f.substring(f.lastIndexOf(".") + 1);
        if (t.equals("jpg") || t.equals("png") || t.equals("gif") || t.equals("bmp") || t.equals("jpeg") || t.equals("png") || t.equals("ico")) {
            return res + "img/" + f;
        } else {
            return res + t + "/" + f;
        }
    }
    public static String kres(String f) {
        String res = "/CS121/kbc/res/";
        String t = f.substring(f.lastIndexOf(".") + 1);
        if (t.equals("jpg") || t.equals("png") || t.equals("gif") || t.equals("bmp") || t.equals("jpeg") || t.equals("png") || t.equals("ico")) {
            return res + "img/"+f;
        } else {
            return res+f;
        }
    }

    public static String opt(int i) {
        return options[i];
    }
}
