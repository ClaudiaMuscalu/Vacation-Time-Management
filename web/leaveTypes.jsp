<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.service.LeaveTypeService" %>
<%@ page import="com.timemanagement.model.LeaveType" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <%int role = user.getRoleId();
                            if(role == 2){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Manager Access</h4><%}%>
                        <% if(role == 3){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Admin Access</h4><%}%>
                        <hr>
                        <p>Welcome, <span><%=user.getFirstName()%></span>!</p>
                    </div>
                    <input id="employeeRole" value="<%=role%>" style="display: none;">
                    <div class="vertical-menu">
                        <div class="dropdown" id="departmentDropdown">
                            <button href="#"  class="dropdown-btn">Department <i class="fa fa-caret-down"></i></button>
                            <div class="dropdown-container">
                                <a href="createDepartment.jsp">Add department</a>
                                <a href="updateDepartment.jsp">Manage department</a>
                            </div>
                        </div>

                        <div class="dropdown" id="leaveDropdown">
                            <button href="#"  class="dropdown-btn">Leave Type <i class="fa fa-caret-down"></i></button>
                            <div class="dropdown-container">
                                <a href="addLeaveType.jsp">Add Leave Type</a>
                                <a href="leaveTypes.jsp">Leave Types</a>
                                <a href="updateLeaveType.jsp">Update leave</a>
                            </div>
                        </div>

                        <div class="dropdown">
                            <button href="#" class="dropdown-btn">Employees <i class="fa fa-caret-down"></i></button>
                            <div class="dropdown-container">
                                <a href="allEmployees.jsp">All Employees</a>
                                <a href="addEmployee.jsp" id="addEmployee">Add Employee</a>
                            </div>
                        </div>

                        <div class="dropdown">
                            <button class="dropdown-btn">Leave Management<i class="fa fa-caret-down"></i></button>
                            <div class="dropdown-container">
                                <a href="allLeaves.jsp">All leaves</a>
                                <a href="pendingLeaves.jsp">Pending leaves</a>
                                <a href="approvedLeaves.jsp">Approved leaves</a>
                                <a href="notApprovedLeaves.jsp">Disapproved leaves</a>
                            </div>
                        </div>
                    <hr/>
                    <a href="employeePage.jsp">My Profile</a>
                    <div class="dropdown">
                        <button href="#"  class="dropdown-btn">Leaves <i class="fa fa-caret-down"></i></button>
                        <div class="dropdown-container">
                            <a href="requestLeave.jsp">Leave Request</a>
                            <a href="historyRequests.jsp">Leave History</a>
                        </div>
                    </div>
                    <a href="leaveDepartment.jsp">Leaves in my department</a>
                </div>
            </div>
                <div class="col-sm-9 container-center">
                    <table class="table">
                        <caption>Types of leave</caption>
                        <thead class="thead-light">
                        <tr>
                            <th scope="row">Id</th>
                            <th scope="row">Title</th>
                            <th scope="row"></th>
                        </tr>
                        </thead>
                        <%
                            LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();
                            ArrayList<LeaveType> leaves = leaveTypeService.getAll();
                            for(LeaveType l : leaves)
                            {
                        %>
                        <tbody>
                        <tr>
                            <td><%=l.getId()%></td>
                            <td><%=l.getTitle()%></td>
                            <td>
                                <a href='DeleteLeaveTypeServlet?id=<%=l.getId()%>'><i class="fa fa-trash" aria-hidden="true" style="margin-right: 3px;"></i>Delete</a>
                            </td>
                        </tr>
                        <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="scripts/DropdownScript.js"></script>
    <script src="scripts/script.js"></script>
</html>


