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
                <p style="font-weight: bold;">Department<span> <%=user.getDepartment().getName()%></span></p>
                <h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Employee Access</h4>
                <hr>
                <p>Welcome, <span> <%=user.getFirstName()%></span>!</p>
            </div>

            <div class="vertical-menu">
                <a href="employeePage.jsp">My Profile</a>
                <div class="dropdown">
                    <button href="#" class="dropdown-btn">Leaves <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-container">
                        <a href="requestLeave.jsp">Leave Request</a>
                        <a href="historyRequests.jsp">Leave History</a>
                    </div>
                </div>
                <a href="leaveDepartment.jsp">Leaves in my department</a>
                <a href="calendar.jsp">Calendar</a>
            </div>
            <br>
        </div>

        <div class="col-sm-9 container-center">
            <form method="post" action="LeaveServlet">
                <div style="display: none;"><input name="holiday" id="holidayBetween1June31Aug"
                                                   value=<%=user.getHoliday1June31August()%>></div>
                <h3 style="text-align: center"><%=user.getFirstName()%> <%=user.getLastName()%>'s Leave Request</h3>
                <br/>
                <div class="alert alert-info" role="alert">
                    This is a info alert about your leave status
                    <ul>
                        <li>Days left: <span><%=user.getDaysLeft()%></span></li>
                        <li>Periods left: <span><%=user.getPeriodsLeft()%></span></li>
                        <li>1 June - 31 August:
                            <%
                                if (user.getHoliday1June31August() == 0) { %>
                            <span style="color: darkgreen">available period</span>
                            <%} else {%>
                            <span style="color: darkred"> period unavailable</span>
                            <%}%>
                        </li>
                    </ul>
                    </br>
                </div>

                <div style="display: none;">
                    <input id="daysLeft" value=<%=user.getDaysLeft()%>>
                    <input id="periodsLeft" value=<%=user.getPeriodsLeft()%>>
                </div>

                <div class="form-group" style="display: none;">
                    <label>User id</label>
                    <input type="text" class="form-control" name="userid" value=<%=user.getId()%>>
                </div>

                <div class="form-group" style="display: none;">
                    <label>Department id</label>
                    <input class="form-control" name="departmentid" value=<%=user.getDepartment().getId()%>>
                </div>

                <div class="form-group">
                    <label>Leave Type</label>
                    <select name="leavetype" class="form-control" id="exampleFormControlSelect1" required>
                        <%

                            LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();
                            ArrayList<LeaveType> leaveTypes = leaveTypeService.getAll();

                            for (LeaveType l : leaveTypes) {
                        %>

                        <option value=<%=l.getId()%>><%=l.getTitle()%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="form-group" style="display: none;">
                    <label>Status leave request</label>
                    <input class="form-control" name="status" value="pending approval">
                </div>

                <div class="form-group">
                    <label>From Date</label>
                    <input class="form-control" type="date" name="startdate" id="start" required>
                </div>
                <span id="wrongStart" style="color: darkred;display: none;">The start date cannot be in the past!</span>

                <div class="form-group">
                    <label>To Date</label>
                    <input class="form-control" type="date" name="enddate" id="end" required>
                </div>
                <span id="wrongEnd" style="color: darkred; display: none;">The end date cannot be in the past!</span>
                <span id="wrongPeriod" style="color: darkred; display: none;">The end date cannot be smaller than start date!</span>
                <span id="wrongData" style="color: darkred; display: none;">Please enter valid data!</span>
                <br>
                <span id="notDaysLeft" style="color: darkred; display: none;">You don't have so many days off left!Check how many days you have left at the top of the page.</span>
                <span id="notPeriodsLeft" style="color: darkred; display: none;">"You have just one period left!You have to take all the remaining days!</span>
                <br>
                <span id="minPeriodLeave" style="color: darkred; display: none;">A period of leave may not be less than 5 days!</span>
                <span id="restrictivePeriod" style="color: darkred; display: none;">The maximum period that can be taken during this period is 21 days</span>
                <br>
                <span id="specialPeriod" style="color: darkred; display: none;">You have exhausted this period(1 June -> 31 August)</span>
                <br>
                <button type="submit" class="btn btn-lg btn-primary" id="btn-submit">Process</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="scripts/DropdownScript.js"></script>
<script src="scripts/RequestLeaveModule.js"></script>
</html>