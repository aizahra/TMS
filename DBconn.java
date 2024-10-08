/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
/**
 *
 * @author Sejal
 */
public class DBconn {
           //this class is used to connect the project with database
         Connection conn;
         Statement stat ;
    public DBconn(){                          //Constructor 
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root"," ");
            stat=conn.createStatement();
            stat.close();
        }catch(Exception e){
            System.out.println(e);
        }   
    }
        public static void main(String[] args) {
        new DBconn();
    }
}

