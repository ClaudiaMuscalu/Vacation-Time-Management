<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

        <head>
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <link rel="stylesheet" type="text/css" href="css/mystyle.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

        <div class="container">
            <div class="row">
                <div class="col-3">
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
                        <a href="#">Dashboard</a>

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
                            <a href="updateLeaveType.jspp">Manage Leave Type</a>
                        </div>
                        </div>


                        <div class="dropdown">
                        <button href="#" class="dropdown-btn">Employees <i class="fa fa-caret-down"></i></button>
                        <div class="dropdown-container">
                            <a href="addEmployee.jsp">Add Employee</a>
                            <a href="manageEmployee.jsp">Manage Employee</a>
                        </div>
                        </div>

                        <div class="dropdown">
                            <button href="#" class="dropdown-btn">Leave Management<i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-container">
                                <a href="allLeaves.jsp">All leaves</a>
                                <a href="pendingLeaves.jsp">Pending leaves</a>
                                <a href="approvedLeaves.jsp">Approved leaves</a>
                                <a href="notApprovedLeaves.jsp">Not Approved leaves</a>
                            </div>
                        </div>
                        <a href="#">Sign Out</a>
                    </div>
                </div>

                <div class="col-9">
                <p>Content Admin Page</p>
                </div>
            </div>
        </div>
    </body>
    <script src="scripts/script.js"></script>
</html>

