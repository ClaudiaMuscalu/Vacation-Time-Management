package com.timemanagement.servlet;

import com.timemanagement.model.Request;
import com.timemanagement.service.DepartmentService;
import com.timemanagement.service.LeaveTypeService;
import com.timemanagement.service.RequestService;
import com.timemanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Edit2LeaveServlet")
public class Edit2LeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("LayoutAdmin1.jsp").include(request, response);

        String sid = request.getParameter("id");
        int id=Integer.parseInt(sid);

        RequestService requestService= RequestService.getInstance();
        Request r = requestService.get(id);

        UserService userService = UserService.getInstance();
        DepartmentService departmentService = DepartmentService.getInstance();
        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();

        out.println("<div class='col-9'>");
        out.println("</br>");
        out.println("</br>");
        out.println("<h1 style='margin-left: 41.5%'>Update status leave</h1>");
        out.println("</br>");
        out.println("</br>");
        out.print("<form action='EditLeaveServlet' method='post' style='margin-left: 25%'>");
        out.print("<input type='hidden' name='id' value='"+r.getId()+"'/>");
        out.print("<input type='hidden' name='userid' value='"+r.getUserId()+"'/>");
        out.print("<input type='hidden' name='depid' value='"+r.getDepartmentId()+"'/>");
        out.print("<input type='hidden' name='leaveid' value='"+r.getLeaveType()+"'/>");
        out.print("<div class='form-group'><label>Last Name:</label><input class='form-control' type='text' name='lastname' value='"+userService.get(r.getUserId()).getLastName()+"'/></div>");
        out.print("<div class='form-group'><label>First Name:</label><input class='form-control' type='text' name='firstname' value='"+userService.get(r.getUserId()).getFirstName()+"'/></div>");
        out.print("<div class='form-group'><label>Department Name:</label><input class='form-control' type='text' name='departmentName' value='"+departmentService.get(r.getDepartmentId()).getName()+"'/></div>");
        out.print("<div class='form-group'><label>Type Of Leave:</label><input class='form-control' type='text' name='leave' value='"+leaveTypeService.get(r.getLeaveType()).getTitle()+"'/></div>");
        out.print("<div class='form-group'><label>Start Date:</label><input class='form-control' type='date' name='startDate' value='"+r.getStartDate()+"'/></div>");
        out.print("<div class='form-group'><label>End Date:</label><input class='form-control' type='date' name='endDate' value='"+r.getEndDate()+"'/></div>");
        out.print("<div class='form-group'><label>Status leave request:</label><input class='form-control' type='text' style='color:red;' name='status' value='"+r.getStatus()+"'/></div>");
        out.print("<button type=\"submit\"  class=\"btn btn-lg btn-primary\" style='width:130px;'>Edit & Save</button>");
        out.print("</form>");
        out.print("</div>");

        out.close();
    }
}
