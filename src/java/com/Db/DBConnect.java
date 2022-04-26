/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Divyansh
 */
public class DBConnect {
       private static Connection conn;
    public static Connection getConn()
    {
        try{
            if(conn==null){
                Class.forName("oracle.jdbc.OracleDriver");
         conn=DriverManager.getConnection("jdbc:oracle:thin:@//Divyansh-pc:1521/XE","onlineexam","student");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return conn;
        
    }
}
