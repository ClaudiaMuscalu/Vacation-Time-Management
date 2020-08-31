<%@ page import="com.timemanagement.service.UserService" %>
<%@ page import="com.timemanagement.model.User" %>
<%@ page import="com.timemanagement.model.Request" %>
<%@ page import="java.util.List" %>
<%@ page import="com.timemanagement.service.RequestService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <%
        UserService userService = UserService.getInstance();
        HttpSession requestSession = request.getSession();
        String userEmail = String.valueOf(requestSession.getAttribute("email"));
        User user = userService.get(userEmail);
        List<User> listOfUsers = userService.getAll();
    %>
<script>
    window.isMbscDemo = true;
</script>

<title>Marked, colored & labels</title>


<link rel="stylesheet" href="css/mobiscroll.javascript.min.css">
<script src="js/mobiscroll.javascript.min.js"></script>

<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }

    body,
    html {
        height: 100%;
    }

</style>

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
                <h4 class="alert-heading"><i class="fa fa-user" aria-hidden="true"></i>Employee Access</h4>
                <hr><p style="font-weight: bold;">Department<span> <%=user.getDepartment().getName()%></span></p>
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
                <div class="dropdown">
                    <button href="#"  class="dropdown-btn">The Legend <i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-container">
                    <ul id="coloritem"></ul>
                        <% for(User userr: listOfUsers)
                        {
                            if(userr.getDepartment().getId() == user.getDepartment().getId())
                            {
                                System.out.println(userr.getFavColor());
                                %>
                        <div><%=userr.getFirstName()%> <%=userr.getLastName()%><span> <i class="fa fa-arrow-right" aria-hidden="true"></i> </span><input type="color" id="favcolor" name="favcolor" value=<%=userr.getFavColor()%> disabled/></div>
                           <% }

                        }%>
                    </div>
                </div>
            </div>
            <br>
        </div>

        <div class="col-sm-9 container-center">
                        <div class="mbsc-col-sm-12 mbsc-col-md-4" style="margin-left: 5%; margin-right: 10%;height: 90%;">
                            <div class="mbsc-form-group">
                                <div class="mbsc-form-group-title"><h4 style="text-align: center;">Leaves in my department</h4></div>
                                <br>
                                <div id="demo-marked" ></div>
                            </div>
                        </div>
    </div>
</div>
</div>
<%
    RequestService requestService = RequestService.getInstance();
    List<Request> approvedLeaves = requestService.getAllApprovedLeaveRequestsForADepartment(user.getDepartment().getId());
%>
<script>

    mobiscroll.settings = {
        lang: 'en',            // Specify language like: lang: 'pl' or omit setting to use default
        theme: 'ios',          // Specify theme like: theme: 'ios' or omit setting to use default
        themeVariant: 'light'  // More info about themeVariant: https://docs.mobiscroll.com/4-10-6/javascript/calendar#opt-themeVariant
    };

    mobiscroll.form('#md-form');

    mobiscroll.calendar('#demo-marked', {
        display: 'inline',
        marked: [
            <%
            for(Request r : approvedLeaves)
        {
            User u = userService.get(r.getUserId());
            String color = u.getFavColor();

            Date startDate = r.getStartDate();

            String pattern = "MM/dd/yyyy";
            DateFormat df = new SimpleDateFormat(pattern);
            String startDateString = df.format(startDate);

            int monthS = Integer.parseInt(startDateString.substring(0,2)) - 1;
            int dayS = Integer.parseInt(startDateString.substring(3,5));
            int yearS = Integer.parseInt(startDateString.substring(6,10));

            Date endDate = r.getEndDate();
            String endDateString = df.format(endDate);

            int monthE = Integer.parseInt(endDateString.substring(0,2)) - 1;
            int dayE = Integer.parseInt(endDateString.substring(3,5));
            int yearE = Integer.parseInt(endDateString.substring(6,10));

            System.out.println("startDate: " + dayS + "/" + monthS + "/" + yearS);
            System.out.println("endDate: " + dayE + "/" + monthE + "/" + yearE);
            %>
            { start: new Date(<%=yearS%>, <%=monthS%>, <%=dayS%>), end: new Date(<%=yearE%>,<%=monthE%>, <%=dayE%>), color: '<%=color%>' },
    <%}%>]
    });

</script>
        </div>
    </div>
</div>
<script src="scripts/DropdownScript.js"></script>
</body>
</html>
