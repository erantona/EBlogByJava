<%@page import="com.suv.java.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        
    </head>
    <body>
        <%@include file="page.jsp" %>
        
        <!--//container-->

        <div class="container-fluid p-0 m-0 text-white">
            <div class="jumbotron primary-Backgroung banner-background">
                <div class="container">
                    <h3 class="display-5">Welcome to eBlog</h3>
                <p>A programming language is a formal language comprising a set of instructions
                    that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
                <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
                <a href="register.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Get Started!</a>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle"></span> Login</a>

                </div>
            </div>
        </div>
        
        <!--//Cards-->
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Java Programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-Backgroung text-white">Read more..</a>
                        </div>
                    </div>
                </div>                
            </div>            
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="js/Script1.js" type="text/javascript"></script>

    </body>
</html>
