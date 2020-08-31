<%@ page import="java.util.ArrayList" %>
<%@ page import="com.timemanagement.model.Department" %>
<%@ page import="com.timemanagement.service.DepartmentService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    </head>

    <body style="background: url('images/background.jpg');">
            <nav class="navbar navbar-expand-lg navbar-light bg-nav">

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginPage.jsp">Log in</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <form method="post" action="RegisterServlet" class="form" style="margin-top: 15%;">
                <h3>Register</h3>
                <br>
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" class="form-control" name="firstname" required/>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" class="form-control" name="lastname" required/>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" required/>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" required/>
                </div>

                <div class="form-group">
                    <div class="maxl">
                        <br>
                        <label class="radio inline">Role
                            <input type="radio" name="usertype" value="2" required>
                            <span> Manager </span>
                        </label>
                        <label class="radio inline">
                            <input type="radio" name="usertype" value="1" required>
                            <span> Worker </span>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Job Name</label>
                    <input class="form-control" type="text" name="jobName" required/>
                </div>

                <div class="form-group">
                    <label>Department</label>
                    <select name="department" class="form-control" id="exampleFormControlSelect1" required>
                        <option></option>
                        <%
                            DepartmentService departmentService = DepartmentService.getInstance();

                            ArrayList<Department> departments = departmentService.getAll();

                            for(Department d: departments)
                            {
                                %>

                        <option value=<%=d.getId()%> > <%=d.getName()%> </option>
                        <%
                            }
                        %>
                    </select>
                    <br>
                </div>

                <div class="form-group">
                    <label for="favcolor">Pick your color:</label>
                    <input type="color" id="favcolor" name="favcolor" value="#ff0000"/><br><br>
                </div>

                    <button type="submit"  class="btn btn-lg btn-primary">Submit</button>
            </form>
            <br>
        </body>
</html>