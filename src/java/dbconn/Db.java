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
            String db="online_quiz121";
            ResultSet rs = st.executeQuery("SHOW DATABASES;");
            while (rs.next()) {
                if (rs.getString("Database").equals(db)) {
                    found = true;
                    break;
                }
            }
            String users = "create table if not exists users(uid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,utype varchar(20) NOT NULL,uname varchar(150) NOT NULL,uemail varchar(100) UNIQUE NOT NULL,udob varchar(20),uphno int(10),udate varchar(50) NOT NULL,upass varchar(100) NOT NULL) AUTO_INCREMENT=1;";
            String qs = "create table if not exists qs(qid int(10) unsigned  PRIMARY KEY AUTO_INCREMENT,q varchar(500) UNIQUE NOT NULL,options varchar(3000) NOT NULL,answer int(1)) AUTO_INCREMENT=1;";
            String feeds = "create table if not exists feeds(fid int(10) unsigned  PRIMARY KEY AUTO_INCREMENT,uid int(10) unsigned NOT NULL,qid int(10) unsigned NOT NULL,feed varchar(10) NOT NULL,foreign key (uid) references users(uid) on delete cascade,foreign key (qid) references qs(qid) on delete cascade) AUTO_INCREMENT=1;";
            if (found == true) {
                st.executeUpdate("use "+db);
            } else {
                st.executeUpdate("create database "+db);
                st.executeUpdate("use "+db);
            }
            st.executeUpdate(users);
            st.executeUpdate(qs);
            st.executeUpdate(feeds);
        } catch (Exception e) {
            System.out.println(e.getMessage() + "\nRaw: " + e);
        }
    }
}
