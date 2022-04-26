/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.User.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
 private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }
 public boolean addUser(UserDetails u)
 {
     boolean f=false;
     try{
         String q="insert into users values(u_id.nextval,?,?,?)";
         PreparedStatement ps=conn.prepareStatement(q);
         ps.setString(1,u.getName());
         ps.setString(2,u.getEmail());
         ps.setString(3,u.getPassword());
         int i=ps.executeUpdate();
         if(i==1){
             f=true;
         }
     }
     catch(Exception e)
        {
            e.printStackTrace();
        }
     return f;
 }
 
 public UserDetails loginUser(UserDetails u){
     UserDetails  user=null;
     try{
        String q="select * from users where email=? and password=?";
         PreparedStatement ps=conn.prepareStatement(q);
         ps.setString(1,u.getEmail());
         ps.setString(2,u.getPassword());
         ResultSet rs=ps.executeQuery();
         if(rs.next()){
             user=new UserDetails();
             user.setId(rs.getInt(1));
             user.setName(rs.getString(2));
             user.setEmail(rs.getString(3));
             user.setPassword(rs.getString(4));
         }
     }
     catch(Exception e)
        {
            e.printStackTrace();
        }
    return user;
 }
}

