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

    public static Connection con;
    public static Statement st = null;

    public static void main(String[] args) {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String mysqldb = "jdbc:mysql://localhost:3306/?autoReconnect=true&useSSL=false";
            String mysqlun = "root";
            String mysqlp = "system";
            con = (Connection) DriverManager.getConnection(mysqldb, mysqlun, mysqlp);
            st = (Statement) con.createStatement();
            con.setAutoCommit(true);
            System.out.println("MYSQL Connection success");
            try{
                Db.main(null);
                System.out.println("No error in creating DB");
            }catch(Exception e){
                System.out.println("Error in creating DB\nError : "+e);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage() + "\nLocalError: " + e.getLocalizedMessage() + "\nCause: " + e.getCause() + "\nClause: " + Arrays.toString(e.getStackTrace()));
        }
    }
}
