<%@page import="java.util.List"%>
<%@page import="com.suv.entities.Post"%>
<%@page import="com.suv.java.ConnectionProvider"%>
<%@page import="com.suv.dao.PostDao"%>
<div class="row">
    <%
        List<Post> posts = null;
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No posts in this category</h3>");
            return;
        }
        for (Post p : posts) {

    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img src="pics_blog/<%=p.getpPic()%>" class="card-img-top" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer primary-Backgroung text-center">
                <a href="showBlog.jsp?postId=<%=p.getPid() %>" class="btn btn-outline-light btn-small">Read more..</a>
                <a href="#!" class="btn btn-outline-light btn-small"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="#!" class="btn btn-outline-light btn-small"><i class="fa fa-commenting-o"></i><span>10</span></a>
            </div>
        </div>
    </div>


    <%
}

    %>
</div>