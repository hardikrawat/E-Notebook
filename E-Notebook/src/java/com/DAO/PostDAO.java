/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.User.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private Connection conn;

    public PostDAO(Connection conn) {
        this.conn = conn;
    }
    
    public boolean AddNotes(String tit,String cont,int uid){
        boolean f=false;
        try{
            String q="insert into post(id,title,content,uiid) values(uiid.nextval,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setString(1,tit);
            ps.setString(2,cont);
            ps.setInt(3,uid);
            int i=ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Post> getData(int id)
    {
        List<Post> list=new ArrayList<Post>();
        Post po=null;
        try{
            String q="select * from post where uiid=? order by id desc";
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {   po=new Post();
                po.setId(rs.getInt(1));
                po.setTitle(rs.getString(2));
                po.setContent(rs.getString(3));
                po.setPdate(rs.getTimestamp(4));
                list.add(po);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }    
    
    public Post getDataById(int noteid)
    {
        Post p=null;
        try{
            String q="select *from post where id=?";
            PreparedStatement ps =conn.prepareStatement(q);
            ps.setInt(1,noteid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                p=new Post();
                p.setId(rs.getInt(1));
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return p;
    }
    
    public boolean postUpdate(int id ,String ti,String con)
    {
        boolean f=false;
        try{
            String q="update post set title=?,content=? where id=?";
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setString(1,ti);
            ps.setString(2,con);
            ps.setInt(3,id);
            
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
               }
         
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteNotes(int id)
    {
        boolean f=false;
        try{
            String q="delete from post where id=?";
            PreparedStatement ps=conn.prepareStatement(q);
            ps.setInt(1,id);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
               }
         
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
