<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>

<body style="background-image: url('images/background.jpg');">
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-nav">
                <a class="navbar-brand" href="#"></a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="request.jsp">Form Leave</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="history.jsp">History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginPage.jsp">Login</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Successful login</h4>
            <hr>
            <p>Welcome,<span>
                <%
                UserService userService = UserService.getInstance();

                HttpSession requestSession = request.getSession();
                String userEmail = String.valueOf(requestSession.getAttribute("email"));

                User user = userService.get(userEmail);
                %>
                <%=user.getFirstName()%></span>!</p>
        </div>
    </body>
</html>

