<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page import="java.util.ArrayList" %>
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
                            <button class="dropdown-btn">Leave Type <i class="fa fa-caret-down"></i>
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
                            <button href="#" class="dropdown-btn">Leave Management<i class="fa fa-caret-down"></i>
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

                <div class="col-sm-9 container-center">
                    <br>
                    <form method="post" action="DepartmentServlet">
                        <br>
                        <h3 style="text-align: center;">Create a department</h3>
                        <br>
                        <div class="form-group">
                            <label>Department name:</label>
                            <input type="text" class="form-control" name="departmentname"/>
                        </div>

                        <div class="form-group">
                            <label>Manager:</label>

                        <select name="managerid" class="form-control" id="exampleFormControlSelect1">
                            <%

                                ArrayList<User> users = userService.getAll();

                                for(User u: users)
                                {
                            %>

                            <option value=<%=u.getId()%> > <%=u.getLastName() + " " + u.getFirstName()%> </option>
                            <%
                                }
                            %>
                        </select>
                        </div>
                        <button type="submit"  class="btn btn-lg btn-primary create-depart">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
    <script src="scripts/script.js"></script>
</html>
