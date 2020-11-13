package com.suv.java;

import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            if(con == null ){
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","root");
                
            }
            
        }catch(Exception E){
            E.printStackTrace();
        }
        return con;
    }
}
