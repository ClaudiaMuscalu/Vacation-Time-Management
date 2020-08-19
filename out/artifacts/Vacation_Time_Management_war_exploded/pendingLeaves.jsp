<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.repository.RequestRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.model.Request" %>
<%@ page import="com.timemanagement.service.DepartmentService" %>
<%@ page import="com.timemanagement.service.LeaveTypeService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                        <h4 class="alert-heading">Manager Access</h4>
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

                    <div class="vertical-menu">
                        <div class="dropdown">
                            <button href="#"  class="dropdown-btn">Department <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-container">
                                <a href="createDepartment.jsp">Add department</a>
                                <a href="updateDepartment.jsp">Manage department</a>
                            </div>
                        </div>

                        <div class="dropdown">
                            <button href="#"  class="dropdown-btn">Leave Type <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-container">
                                <a href="addLeaveType.jsp">Add Leave Type</a>
                                <a href="leaveTypes.jsp">Leave Types</a>
                            </div>
                        </div>


                        <div class="dropdown">
                            <button href="#" class="dropdown-btn">Employees <i class="fa fa-caret-down"></i></button>
                            <div class="dropdown-container">
                                <a href="allEmployees.jsp">All Employees</a>
                                <a href="addEmployee.jsp">Add Employee</a>
                            </div>
                        </div>

                        <div class="dropdown">
                            <button class="dropdown-btn">Leave Management<i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-container">
                                <a href="allLeaves.jsp">All leaves</a>
                                <a href="pendingLeaves.jsp">Pending leaves</a>
                                <a href="approvedLeaves.jsp">Approved leaves</a>
                                <a href="notApprovedLeaves.jsp">Disapproved leaves</a>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="col-sm-9 container-center">
                    <table class="table">
                        <caption>Pending leaves</caption>
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
                                if(r.getStatus().equals("pending approval"))
                                {
                        %>
                        <tbody>
                        <tr>
                            <td><%=userService.get(r.getUserId()).getLastName() + " " + userService.get(r.getUserId()).getFirstName()%></td>
                            <td><%=departmentService.get(r.getDepartmentId()).getName()%></td>
                            <td><%=leaveTypeService.get(r.getLeaveType()).getTitle()%></td>
                            <td><%=r.getStartDate()%></td>
                            <td><%=r.getEndDate()%></td>
                            <td><%=r.getStatus()%></td>
                            <td>
                                <a href='Edit2LeaveServlet?id=<%=r.getId()%>'><i class="fa fa-edit" style="margin-right: 3px;"></i>Edit status</a>
                            </td>
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


