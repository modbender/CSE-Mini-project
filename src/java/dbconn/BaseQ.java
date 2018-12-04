/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconn;

import static dbconn.Connect.con;
import java.io.FileInputStream;
import java.io.InputStreamReader;

import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.json.*;

/**
 *
 * @author Yashas Hr
 */
public class BaseQ {

    public static void main(String[] args) {
        String jspath = System.getProperty("user.dir") + "\\src\\java\\dbconn\\questions.json";
        try {
            dbconn.Connect.main(null);
            PreparedStatement pst = con.prepareStatement("insert into qs(q,options,answer) values(?,?,?);");
            JsonArray jaopts, ja = Json.createReader(new InputStreamReader(new FileInputStream(jspath))).readObject().getJsonArray("results");
            JsonObject jo;
            String[] options;
            String opts,q;
            int ans = 0,jsize = ja.size();
            for (int i = 0; i < jsize; i++) {
                options = new String[4];
                jo = ja.getJsonObject(i);
                q = jo.getString("question");
                for (int k = 0; k < options.length; k++) {
                    if (k == 3) {
                        options[k] = jo.getString("correct_answer");
                    } else {
                        jaopts = jo.getJsonArray("incorrect_answers");
                        options[k] = jaopts.getString(k);
                    }
                }
                Collections.shuffle(Arrays.asList(options));
                for(int k = 0; k < options.length; k++){
                    if(options[k].equals(jo.getString("correct_answer"))){
                        ans = k;
                        break;
                    }
                }
                opts = "{'0':'"+options[0]+"','1':'"+options[1]+"','2':'"+options[2]+"','3':'"+options[3]+"'}";
                pst.setString(1, q);
                pst.setString(2, opts);
                pst.setInt(3, ans);
                pst.addBatch();
            }
            pst.executeBatch();
            System.out.println("25 Questions added succesfully to DB");
            con.close();
        } catch (Exception e) {
            System.out.println("Error at BaseQ.java.\nError: " + e);
        }
    }

}
