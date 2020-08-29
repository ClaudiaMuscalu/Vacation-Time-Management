<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <%
        UserService userService = UserService.getInstance();
        HttpSession requestSession = request.getSession();
        String userEmail = String.valueOf(requestSession.getAttribute("email"));
        User user = userService.get(userEmail);
    %>
<script>
    // Ignore this in your implementation
    window.isMbscDemo = true;
</script>

<title>Marked, colored & labels</title>


<link rel="stylesheet" href="css/mobiscroll.javascript.min.css">
<script src="js/mobiscroll.javascript.min.js"></script>

<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }

    body,
    html {
        height: 100%;
    }

</style>

</head>

<body style="background: url('images/background.jpg');">
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-nav">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loginPage.jsp">Log out</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<div>
    <div class="row">
        <div class="col-sm-3">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Employee Access</h4>
                <hr><p style="font-weight: bold;">Department<span> <%=user.getDepartment().getName()%></span></p>
                <p>Welcome, <span> <%=user.getFirstName()%></span>!</p>
            </div>

            <div class="vertical-menu">
                <a href="employeePage.jsp">My Profile</a>
                <div class="dropdown">
                    <button href="#"  class="dropdown-btn">Leaves <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-container">
                        <a href="requestLeave.jsp">Leave Request</a>
                        <a href="historyRequests.jsp">Leave History</a>
                    </div>
                </div>
                <a href="leaveDepartment.jsp">Leaves in my department</a>
                <a href="calendar.jsp">Calendar</a>
                <div class="dropdown">
                    <button href="#"  class="dropdown-btn">The Legend <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-container">
                    <a>Color 1</a>
                    <a>Color 2</a>
                    <a>Color 3</a>
                    </div>
                </div>
            </div>
            <br>
        </div>

        <div class="col-sm-9 container-center">
                        <div class="mbsc-col-sm-12 mbsc-col-md-4" style="margin-left: 5%; margin-right: 10%;height: 90%;">
                            <div class="mbsc-form-group">
                                <div class="mbsc-form-group-title"><h4 style="text-align: center;">Leaves in my department</h4></div>
                                <br>
                                <div id="demo-marked"></div>
                            </div>
                        </div>
    </div>
</div>
</div>

<script>

    mobiscroll.settings = {
        lang: 'en',            // Specify language like: lang: 'pl' or omit setting to use default
        theme: 'ios',          // Specify theme like: theme: 'ios' or omit setting to use default
        themeVariant: 'light'  // More info about themeVariant: https://docs.mobiscroll.com/4-10-6/javascript/calendar#opt-themeVariant
    };

    var now = new Date();

    mobiscroll.form('#md-form');

    mobiscroll.calendar('#demo-marked', {
        display: 'inline',     // Specify display mode like: display: 'bottom' or omit setting to use default
        marked: [              // More info about marked: https://docs.mobiscroll.com/4-10-6/javascript/calendar#opt-marked
            { d: '5/1', color: '#ffc400' },
            { d: '12/24', color: '#ffee00' },
            { d: '12/25', color: 'red' },
            { d: new Date(now.getFullYear(), now.getMonth() + 1, 4) },
            { d: new Date(now.getFullYear(), now.getMonth() - 2, 13) },
            { d: new Date(now.getFullYear(), now.getMonth(), 2), color: '#46c4f3' },
            { d: new Date(now.getFullYear(), now.getMonth(), 6), color: '#7e56bd' },
            { d: new Date(now.getFullYear(), now.getMonth(), 11), color: '#7e56bd' },
            { d: new Date(now.getFullYear(), now.getMonth(), 19), color: '#89d7c9' },
            { d: new Date(now.getFullYear(), now.getMonth(), 28), color: '#ea4986' },
            { d: new Date(now.getFullYear(), now.getMonth(), 13), color: '#7e56bd' },
            { d: new Date(now.getFullYear(), now.getMonth(), 13), color: '#f13f77' },
            { d: new Date(now.getFullYear(), now.getMonth(), 13), color: '#89d7c9' },
            { d: new Date(now.getFullYear(), now.getMonth(), 13), color: '#8dec7d' },
            { d: new Date(now.getFullYear(), now.getMonth(), 21), color: '#ffc400' },
            { d: new Date(now.getFullYear(), now.getMonth(), 21), color: '#8dec7d' },
            { start: new Date(now.getFullYear(), now.getMonth() + 1, 15), end: new Date(now.getFullYear(), now.getMonth() + 1, 18), color: '#f4511e' }
        ]
    });

</script>
        </div>
    </div>
</div>
<script src="scripts/DropdownScript.js"></script>
</body>
</html>
