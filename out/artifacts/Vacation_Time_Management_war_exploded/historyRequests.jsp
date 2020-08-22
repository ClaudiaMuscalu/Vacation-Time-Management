<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.model.LeaveType" %>
<%@ page import="com.timemanagement.service.LeaveTypeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserService userService = UserService.getInstance();

    HttpSession requestSession = request.getSession();
    String userEmail = String.valueOf(requestSession.getAttribute("email"));

    User user = userService.get(userEmail);
%>
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
                    </div>
                </div>
                <a href="leaveDepartment.jsp">Leaves in my department</a>
            </div>
            <br>
        </div>

            <div class="col-sm-9 container-center">
                <div class="yellow">
                    <div id="calendar">
                        <div id="toolbar"></div>
                        <div id="color-picker" class="show"></div>
                        <div id="dates" class="show">
                            <div id="lastMt">&lsaquo;</div>
                            <div id="nextMt">&rsaquo;</div>
                            <div id="months-cont">
                                <div id="months">
                                    <span class="active month">January</span><span class="month">February</span><span class="month">March</span><span class="month">April</span><span class="month">May</span><span class="month">June</span><span class="month">July</span><span class="month">August</span><span class="month">September</span><span class="month">October</span><span class="month">November</span><span class="month">December</span>
                                </div>
                            </div>
                            <div id="daysotweek">
                                <div class="day">S</div>
                                <div class="day">M</div>
                                <div class="day">T</div>
                                <div class="day">W</div>
                                <div class="day">T</div>
                                <div class="day">F</div>
                                <div class="day">S</div>
                            </div>
                            <div id="days">
                            </div>
                        </div>
                        <div id="info" class="hide">
                            <div id="actual-date"></div>
                            <div id="back"><</div>
                            <div id="month-name"></div>
                            <div id="weather">
                                <div id="sun"></div>
                                <div id="mountains"></div>
                                <div id="rain">
                                    <div class="raindrop" id="drop-1"></div>
                                    <div class="raindrop center" id="drop-2"></div>
                                    <div class="raindrop center" id="drop-3"></div>
                                    <div class="raindrop" id="drop-4"></div>
                                </div>
                                <div id="temp">57&deg;<span>F</span></div>
                            </div>
                            <div id="bg-card">
                                <div class="content"></div>
                            </div>
                            <div id="card">
                                <div class="content">
                                    <div id="event-name"></div>
                                    <div id="event-details">
                                        <div class="col-3">
                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                                            <h3>Location</h3>
                                            <p>12345 Generic Ave., Some City, Some State, 12345
                                        </div>
                                        <div class="col-3">
                                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                                            <h3>Time</h3>
                                            <p> 12:00 AM </p>
                                        </div>
                                        <div class="col-3">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                            <h3>Attendee</h3>
                                            <p>Me, You, and 2+</p>
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div id="colors" class="hide">
                            <div id="close">&times;</div>
                            <p>Choose theme color</p>
                            <div class="color" id="salmon"></div>
                            <div class="color" id="dkpink"></div>
                            <div class="color" id="red"></div>
                            <div class="color" id="redorg"></div>
                            <div class="color" id="orange"></div>
                            <div class="color" id="orgylw"></div>
                            <div class="color active" id="yellow"></div>
                            <div class="color" id="green"></div>
                            <div class="color" id="aqua"></div>
                            <div class="color" id="teal"></div>
                            <div class="color" id="sltbl"></div>
                            <div class="color" id="pwdbl"></div>
                            <div class="color" id="blue"></div>
                            <div class="color" id="purple"></div>
                            <div class="color" id="dkprpl"></div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>
</body>
</html>