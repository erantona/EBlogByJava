package com.suv.dao;

import com.suv.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sun.security.util.Password;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean test = false;
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    public User getUserByEmailAndPassword(String email, String paasword) {
        User iUser = null;
        try {
            String query = "select * from user Where email =? and password =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, paasword);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                iUser = new User();
                String name = set.getString("name");
                iUser.setName(name);

                iUser.setId(set.getInt("id"));
                iUser.setEmail(set.getString("email"));
                iUser.setPassword(set.getString("password"));
                iUser.setGender(set.getString("gender"));
                iUser.setAbout(set.getString("about"));
                iUser.setRdate(set.getTimestamp("rdate"));
                iUser.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return iUser;
    }

    public boolean updateUser(User user) {
        boolean test = false;
        try {
            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());
            ps.executeUpdate();
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    public User getUserByUserId(int userId) throws SQLException {
        User u = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement pstm = this.con.prepareStatement(query);
            pstm.setInt(1, userId);
            ResultSet set = pstm.executeQuery();
            if (set.next()) {
                u=new User();
                
                
                u.setName(set.getString("name"));   
                u.setId(set.getInt("id"));
                u.setEmail(set.getString("email"));
                u.setPassword(set.getString("password"));
                u.setGender(set.getString("gender"));
                u.setAbout(set.getString("about"));
                u.setRdate(set.getTimestamp("rdate"));
                u.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
}
