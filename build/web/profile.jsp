
<%@page import="java.util.ArrayList"%>
<%@page import="com.suv.entities.Category"%>
<%@page import="com.suv.java.ConnectionProvider"%>
<%@page import="com.suv.dao.PostDao"%>
<%@page import="com.suv.dao.Message"%>
<%@page import="com.suv.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorpage.jsp' %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

    </head>
    <body>
        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark  primary-Backgroung">
            <a class="navbar-brand" href="index.jsp"><span clas="fa fa-houzz"></span> eBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-at"></span> Contact</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-wpforms"></span> Categories</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">JavaScript</a>
                            <a class="dropdown-item" href="#">Python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-edit"></span> Do Post</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-bell-o"></span> Logout</a>
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-simplybuilt"></span> <%= user.getName()%></a>
                    </li>
                </ul>
            </div>
        </nav>
                    
             <!--Navbar end-->       
        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="alert <%= msg.getCssClass()%>" role="alert">
            <%= msg.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }


        %>
        
        <!--Blog & Categories-->

        <main>
            <div class="container">
                <div class="row mt-3">
                    <div class="col-md-4 ">

                        <div class="list-group" >
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Posts</a>
                            <%                                
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%=cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>


                </div>

            </div>
        </main>
        <!--Blog & Categories End-->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-Backgroung text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">eBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center"> 
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%" width="100px">
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--Details//-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Register Date</th>
                                            <td><%= user.getRdate().toString()%></td>

                                        </tr>

                                    </tbody>
                                </table>
                            </div>


                            <!--Profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>

                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id: </td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name: </td>
                                            <td><input type="text" class="form-control" name="user-name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>
                                            <td><input type="email" class="form-control" name="user-email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password: </td>
                                            <td><input type="password" class="form-control" name="user-password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender </td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About: </td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user-about" >
                                                    <%= user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile</td>
                                            <td>
                                                <input type="file" name="newImage" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary primary-Backgroung">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal 2 -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide blog details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">

                                <select class="form-control" name="cid">
                                    <option selected disable>---Select Category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getCategories();
                                        for (Category c : list) {


                                    %>

                                    <option value="<%= c.getCid()%>"><%=c.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>

                            </div><br>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 100px;" placeholder="Enter your code(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic</label><br/>
                                <input name="pic" type="file" >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>





        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="js/Script1.js" type="text/javascript"></script>
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-btn').click(function () {

                                        if (editStatus === false) {
                                            $('#profile-details').hide();
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $('#profile-details').show();
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit");

                                        }

                                    });
                                });
        </script>
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("Submitted")
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == 'done') {
                                swal("Good job!", "Blog Posted..", "success");
                            } else {
                                swal("Error", "Something went wrong, try again!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Something went wrong, try again!", "error");

                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <script>
            function getPosts(catId, temp) {


                $(".c-link").removeClass('active')
                $("#loader").show();
                $("#post-container").hide();


                $.ajax({
                    url: "loadPost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef);

            })
        </script>

    </body>
</html>
