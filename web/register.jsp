
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>



        <!--css-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

    </head>
    <body>
        <%@include file="page.jsp" %>

        <main class="primary-Backgroung banner-background" style="padding-bottom: 80px;">
            <div class="reg-container">
                <div class="col-md-5 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-Backgroung text-white text-center">
                            <span class="fa fa-user-circle fa-2x"></span>
                            <p>Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id ="reg-form" action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email name</label>
                                    <input name="user_name" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                -->
                                </div>

                                <div class="form-group">

                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <input type="radio" id="gender" name="gender" value="male"> Male
                                    <input type="radio" id="gender" name="gender" value="female"> Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" rows="1" placeholder="Enter something about yourself"></textarea>
                                </div>

                                <div class="form-group form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms & conditions</label>
                                </div>

                                <br>

                                <div class ="container text-center" id="loder" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please Wait..</h4>

                                </div>

                                <button id="sub-btn" type="submit" class="btn btn-primary">Sign up</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("lodded....")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
                    $("#sub-btn").hide();
                    $("#loder").show();


                    $.ajax({
                        url: "RegisterServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            
                            $("#sub-btn").show();
                            $("#loder").hide();
                            
                            if (data.trim()=='done'){
                            swal("Register Sucessful. Redirecting you to Login page.")
                                    .then((value) => {
                                        window.location="login.jsp"
                                    });
                                }else{
                                    swal(data);
                                }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sub-btn").show();
                            $("#loder").hide();
                            swal("Something went wrong. Try again. ");

                        },
                        processData: false,
                        contentType: false
                    });
                });

            });
        </script>
    </body>
</html>
