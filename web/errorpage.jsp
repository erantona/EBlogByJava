<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry something went wrong.</title>
         <!--css-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

    </head>
    <body>
        <div class="container text-center">
            <img src="img/error(1).png" class="img-fluid" style="opacity: 0.7; width: 40%;margin-top: 30px;">
            <h3 class="display-4">Sorry! Something went wrong</h3>
            <%= exception %><br>
            <a href="index.jsp" class="btn primary-Backgroung btn-lg text-white mt-3">Home</a>
        </div>
        
        
    </body>
</html>
