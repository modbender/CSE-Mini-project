/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package def;

import static dbconn.Connect.st;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yashas Hr
 */
public class Kbc {
    public static ResultSet getQ() {
        ResultSet rs = null;
        try {
            Misc.checkCon();
            String sql = "select * from qs order by rand() limit 15;";
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            Logger.getLogger(Kbc.class.getName()).log(Level.SEVERE, null, e);
            System.out.println("Raw Error : KBC\n"+e);
        }
        return rs;
    }
}
