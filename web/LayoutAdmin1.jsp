<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserService userService = UserService.getInstance();

    HttpSession requestSession = request.getSession();
    String userEmail = String.valueOf(requestSession.getAttribute("email"));

    User user = userService.get(userEmail);%>
<html>

    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="scripts/script.js"></script>
    </head>

    <body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-nav">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div>
        <div class="row">
            <div class="col-sm-3">
                <div class="alert alert-success" role="alert">
                    <p style="font-weight: bold;">Department<span> <%=user.getDepartment().getName()%></span></p>
                    <% int role = user.getRoleId();
                        if(role == 2){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Manager Access</h4><%}%>
                    <% if(role == 3){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Admin Access</h4><%}%>
                    <hr>
                    <p>Welcome, <span><%=user.getFirstName()%></span>!</p>
                </div>

                <div class="vertical-menu">
                    <a href="adminPage.jsp">Back<i class="fa fa-arrow-left"></i></a>
                </div>
            </div>

