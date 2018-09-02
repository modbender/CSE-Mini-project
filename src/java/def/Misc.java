/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package def;

import static dbconn.Connect.con;
import java.sql.SQLException;

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
}
