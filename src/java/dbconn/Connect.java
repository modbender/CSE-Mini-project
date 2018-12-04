/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Arrays;

/**
 *
 * @author Yashas Hr
 */
public class Connect {

    public static Connection con = null;
    public static Statement st = null;

    public static void main(String[] args) {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String mysqldb = "jdbc:mysql://localhost:3306/?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
            String mysqlun = "root";
            String mysqlp = "system";
            con = (Connection) DriverManager.getConnection(mysqldb, mysqlun, mysqlp);
            st = (Statement) con.createStatement();
            con.setAutoCommit(true);
            try{
                Db.main(null);
            }catch(Exception e){ }
            System.out.println("MYSQL Connection success");
        } catch (Exception e) {
            System.out.println(e.getMessage() + "\nLocalError: " + e.getLocalizedMessage() + "\nCause: " + e.getCause() + "\nClause: " + Arrays.toString(e.getStackTrace()));
        }
    }
}
