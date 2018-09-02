/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconn;

import java.sql.ResultSet;
import static dbconn.Connect.st;

/**
 *
 * @author Yashas Hr
 */
public class Db {

    public static void main(String[] args) {
        boolean found = false;
        try {
            ResultSet rs = st.executeQuery("SHOW DATABASES;");
            while (rs.next()) {
                if (rs.getString("Database").equals("project_cs121")) {
                    found = true;
                }
            }
            if (found == true) {
                st.executeUpdate("use project_cs121");
                st.executeUpdate("create table if not exists users(uid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,utype varchar(20) NOT NULL,uname varchar(150) NOT NULL,uemail varchar(100) UNIQUE NOT NULL,udob varchar(20),uphno int(10),uimg varchar(255),udate varchar(50) NOT NULL,upass varchar(100) NOT NULL) AUTO_INCREMENT=1;");
            } else {
                st.executeUpdate("create database project_cs121");
                st.executeUpdate("use project_cs121");
                st.executeUpdate("create table users(uid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,utype varchar(20) NOT NULL,uname varchar(150) NOT NULL,uemail varchar(100) UNIQUE NOT NULL,udob varchar(20),uphno int(10),uimg varchar(255),udate varchar(50) NOT NULL,upass varchar(100) NOT NULL) AUTO_INCREMENT=1;");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage() + "\nRaw: " + e);
        }
    }
}
