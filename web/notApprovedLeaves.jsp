<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.repository.RequestRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.model.Request" %>
<%@ page import="com.timemanagement.service.DepartmentService" %>
<%@ page import="com.timemanagement.service.LeaveTypeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserService userService = UserService.getInstance();

    HttpSession requestSession = request.getSession();
    String userEmail = String.valueOf(requestSession.getAttribute("email"));

    User currentUser = userService.get(userEmail);
%>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
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
                        <p style="font-weight: bold;">Department<span> <%=currentUser.getDepartment().getName()%></span></p>
                            <%int role = currentUser.getRoleId();
                            if(role == 2){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Manager Access</h4><%}%>
                        <% if(role == 3){%><h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Admin Access</h4><%}%>
                        <hr>
                        <p>Welcome, <span><%=currentUser.getFirstName()%></span>!</p>
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
                                <a href="leaveTypes.jsp">Add Leave Type</a>
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
                        <caption>Disapproved leaves</caption>
                        <thead class="thead-light">
                        <tr>
                            <th scope="row">Employee Name</th>
                            <th scope="row">Department</th>
                            <th scope="row">Leave Type</th>
                            <th scope="row">Start Date</th>
                            <th scope="row">End Date</th>
                            <th scope="row">Status</th>
                            <th scope="row"></th>
                        </tr>
                        </thead>
                        <%
                            DepartmentService departmentService = DepartmentService.getInstance();
                            RequestRepository requestRepository = new RequestRepository();
                            LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();
                            ArrayList<Request> requests = requestRepository.getAll();
                            for(Request r : requests)
                            {
                                User user1 = userService.get(r.getUserId());
                                if(r.getStatus().equals("disapproved") && ((role == 2 && user1.getDepartment().getId() == currentUser.getDepartment().getId()) && user1.getRoleId() == 1)
                                        || (role == 3 && user1.getRoleId() == 2))
                                {
                        %>
                        <tbody>
                        <tr>
                            <td><%=user1.getLastName() + " " + user1.getFirstName()%></td>
                            <td><%=departmentService.get(r.getDepartmentId()).getName()%></td>
                            <td><%=leaveTypeService.get(r.getLeaveType()).getTitle()%></td>
                            <td><%=r.getStartDate()%></td>
                            <td><%=r.getEndDate()%></td>
                            <td style="color: darkred; font-weight: bold;"><%=r.getStatus()%></td>
                        </tr>
                        <% }
                        }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="scripts/script.js"></script>
</html>


