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
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body style="background-image: url('images/background.jpg');">
        <nav class="navbar navbar-expand-lg navbar-light bg-nav">
            <a class="navbar-brand" href="#"></a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="requestLeave.jsp">Form Leave</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="historyRequests.jsp">History</a>
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

        <br>
        <h5 style="text-align: center"><%=user.getFirstName()%> <%=user.getLastName()%>'s Leave Request</h5>

        <form method="post" action="LeaveServlet" class="form">
            <div class="form-group">
                <label>User id</label>
                <input type="text" class="form-control" name="userid" value=<%=user.getId()%>>
            </div>

            <div class="form-group">
                <label>Department id</label>
                <input class="form-control" name="departmentid" value=<%=user.getDepartment().getId()%>>
            </div>

            <div class="form-group">
                <label>Leave Type</label>
                <select name="leavetype" class="form-control" id="exampleFormControlSelect1">
                    <%

                        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();
                        ArrayList<LeaveType> leaveTypes = leaveTypeService.getAll();

                        for(LeaveType l: leaveTypes)
                        {
                    %>

                    <option value=<%=l.getId()%> > <%=l.getTitle()%> </option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Status leave request</label>
                <input class="form-control" name="status" value="pending approval" >
            </div>

            <div class="form-group">
                <label>Start Date</label>
                <input class="form-control" type="date" name="startdate">
            </div>

            <div class="form-group">
                <label>End Date</label>
                <input class="form-control" type="date" name="enddate">
            </div>

            <button type="submit"  class="btn btn-lg btn-primary">Submit</button>
        </form>
        <br>
    </body>
</html>