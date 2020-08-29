<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.service.LeaveTypeService" %>
<%@ page import="com.timemanagement.repository.RequestRepository" %>
<%@ page import="com.timemanagement.model.Request" %>
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
                        <p style="font-weight: bold;">Department <span> <%=user.getDepartment().getName()%></span></p>
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
                    </div><br>
                </div>

                <div class="col-sm-9 container-center">
                    <table class="table">
                        <caption>History leave requests</caption>
                        <thead class="thead-light">
                        <tr>
                            <th scope="row">Leave Type</th>
                            <th scope="row">From Date</th>
                            <th scope="row">To Date</th>
                            <th scope="row">Status</th>
                        </tr>
                        </thead>
                        <%
                            RequestRepository requestRepository = new RequestRepository();
                            LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();
                            ArrayList<Request> requests = requestRepository.getAllRequestForAnEmployee(user.getId());

                            for(Request r : requests)
                            {
                        %>
                        <tbody>
                        <tr>
                            <td><%=leaveTypeService.get(r.getLeaveType()).getTitle()%></td>
                            <td><%=r.getStartDate()%></td>
                            <td><%=r.getEndDate()%></td>
                            <%if(r.getStatus().equals("approved"))
                                {%>
                            <td style="color: darkgreen; font-weight: bold;"><%=r.getStatus()%></td>
                            <%}%>

                            <%if(r.getStatus().equals("disapproved"))
                            {%>
                            <td style="color: darkred; font-weight: bold;"><%=r.getStatus()%></td>
                            <%}%>

                            <%if(r.getStatus().equals("pending approval"))
                            {%>
                            <td style="color: darkblue; font-weight: bold;"><%=r.getStatus()%></td>
                            <%}%>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="scripts/DropdownScript.js"></script>
</html>
