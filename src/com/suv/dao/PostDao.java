package com.suv.dao;

import com.suv.entities.Category;
import com.suv.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {

            String query = "select * from  categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {

                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, p.getpTitle());
            pstm.setString(2, p.getpContent());
            pstm.setString(3, p.getpCode());
            pstm.setString(4, p.getpPic());
            pstm.setInt(5, p.getCatId());
            pstm.setInt(6, p.getUserId());
            pstm.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();

        try {
            PreparedStatement psmt = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = psmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

        try {
            PreparedStatement psmt = con.prepareStatement("select * from posts where catId=?");
            psmt.setInt(1, catId);
            ResultSet set = psmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) throws SQLException {
        Post post = null;
        String query = "select * from posts where pid=?";
        try {
            PreparedStatement pstmStatement = this.con.prepareStatement(query);
            pstmStatement.setInt(1, postId);
            
            ResultSet set = pstmStatement.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
