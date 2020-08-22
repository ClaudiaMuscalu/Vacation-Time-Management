<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.model.Department" %>
<%@ page import="com.timemanagement.service.DepartmentService" %>
<%@ page import="com.timemanagement.model.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>

<body style="background-image: url('images/background.jpg');">
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
                <%
                    UserService userService = UserService.getInstance();

                    HttpSession requestSession = request.getSession();
                    String userEmail = String.valueOf(requestSession.getAttribute("email"));

                    User user = userService.get(userEmail);

                %>
                <h4 class="alert-heading">Employee Access</h4>
                <hr>
                <p>Welcome, <span> <%=user.getFirstName()%></span>!</p>
            </div>

            <div class="vertical-menu">
                <a href="employeePage.jsp">My Profile</a>
                <div class="dropdown">
                    <button href="#"  class="dropdown-btn">Leaves <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-container">
                        <a href="requestLeave.jsp">Leave Request</a>
                        <a href="historyRequests.jsp">Leave History</a>
                    </div><a href="myProfile.jsp">My Profile</a>
                </div>
                <a href="leaveDepartment.jsp">Leaves in my department</a>
            </div>
            <br>

            <div class="col-sm-9 container-center">
            </div>
        </div>
    </div>
</div>
</body>
<script src="scripts/script.js"></script>
</html>

