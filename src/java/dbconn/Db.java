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
            String users = "create table if not exists users(uid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,utype varchar(20) NOT NULL,uname varchar(150) NOT NULL,uemail varchar(100) UNIQUE NOT NULL,udate varchar(50) NOT NULL,upass varchar(100) NOT NULL) AUTO_INCREMENT=1;";
            String qs = "create table if not exists qs(qid int(10) unsigned  PRIMARY KEY AUTO_INCREMENT,q varchar(500) UNIQUE NOT NULL,options varchar(3000) NOT NULL,answer int(1) NOT NULL) AUTO_INCREMENT=1;";
            String feeds = "create table if not exists feeds(fid int(10) unsigned  PRIMARY KEY AUTO_INCREMENT,uid int(10) unsigned NOT NULL,qid int(10) unsigned NOT NULL,feed int(1) NOT NULL,foreign key (uid) references users(uid) on delete cascade,foreign key (qid) references qs(qid) on delete cascade) AUTO_INCREMENT=1;";
            String results = "create table if not exists results(rid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,uid int(10) unsigned NOT NULL,correct int(5) NOT NULL,wrong int(5) NOT NULL,percentage float NOT NULL,foreign key (uid) references users(uid) on delete cascade) AUTO_INCREMENT=1;";
            String winners = "create table if not exists results(wid int(10) unsigned PRIMARY KEY AUTO_INCREMENT,uit int(10) unsigned NOT NULL) AUTO_INCREMENT=1;";
            
            String trigger = "create trigger add_perc before insert on results for each row set new.percentage= ROUND((new.correct/15)*100,2)";
            if (found == true) {
                st.executeUpdate("use "+db);
            } else {
                st.executeUpdate("create database "+db);
                st.executeUpdate("use "+db);
            }
            st.executeUpdate(users);
            st.executeUpdate(qs);
            st.executeUpdate(feeds);
            st.executeUpdate(results);
            st.executeUpdate(winners);
            try{
                st.execute("CREATE PROCEDURE addWin(IN uid int)\n"+
                    "BEGIN\n"+
                    "INSERT INTO WINNERS(uid) VALUES(uid);\n"+
                    "END");
            }catch(Exception e) {System.out.println("Ignored Error : "+e);}
            try{
                st.executeUpdate(trigger);
            }catch(Exception e){System.out.println("Ignored Error : "+e);}
        } catch (Exception e) {
            System.out.println("Error at DB.java\n"+e.getMessage() + "\nRaw: " + e);
        }
    }
}
