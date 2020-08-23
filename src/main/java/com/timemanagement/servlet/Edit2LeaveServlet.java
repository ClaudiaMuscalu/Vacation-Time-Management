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
        int id = Integer.parseInt(sid);

        RequestService requestService= RequestService.getInstance();
        Request r = requestService.get(id);

        UserService userService = UserService.getInstance();
        DepartmentService departmentService = DepartmentService.getInstance();
        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();

        out.println("<div class='col-9'>");
        out.println("</br>");
        out.println("</br>");
        out.print("<form action='EditLeaveServlet' method='post' style='margin-left: 25%'>");
        out.println("<h2 style='text-align:center;'>Update status leave</h2></br>");
        out.print("<input type='hidden' name='id' value='"+r.getId()+"'/>");
        out.print("<input type='hidden' name='userid' value='"+r.getUserId()+"'/>");
        out.print("<input type='hidden' name='depid' value='"+r.getDepartmentId()+"'/>");
        out.print("<input type='hidden' name='leaveid' value='"+r.getLeaveType()+"'/>");
        out.print("<div class='form-group'><label>Last Name:</label><input class='form-control' type='text' readonly=\"readonly\" name='lastname' value='"+userService.get(r.getUserId()).getLastName()+"'/></div>");
        out.print("<div class='form-group'><label>First Name:</label><input class='form-control' type='text' readonly=\"readonly\" name='firstname' value='"+userService.get(r.getUserId()).getFirstName()+"'/></div>");
        out.print("<div class='form-group'><label>Department Name:</label><input class='form-control' readonly=\"readonly\" type='text' name='departmentName' value='"+departmentService.get(r.getDepartmentId()).getName()+"'/></div>");
        out.print("<div class='form-group'><label>Type Of Leave:</label><input class='form-control' readonly=\"readonly\" type='text' name='leave' value='"+leaveTypeService.get(r.getLeaveType()).getTitle()+"'/></div>");
        out.print("<div class='form-group'><label>Start Date:</label><input class='form-control' readonly=\"readonly\" type='date' name='startDate' value='"+r.getStartDate()+"'/></div>");
        out.print("<div class='form-group'><label>End Date:</label><input class='form-control' readonly=\"readonly\" type='date' name='endDate' value='"+r.getEndDate()+"'/></div>");
        out.print("<div class=\"form-group\">\n<div class=\"maxl\">\n<br>\n <label>Status leave request:</label> \n <input type=\"radio\" name=\"status\" value=\"approved\" required>\n"
                 +"<span style=\"color: darkgreen; font-weight: bold;\"> approved </span>\n</label>\n<label class=\"radio inline\">\n<input type=\"radio\" name=\"status\" value=\"disapproved\" required>\n<span style=\"color: darkred; font-weight: bold;\"> disapproved </span>\n</label>\n</div>\n</div>");
        out.print("<button type=\"submit\"  class=\"btn btn-lg btn-primary\" style='width:130px;'>Edit & Save</button>");
        out.print("</form>");
        out.print("</div>");

        out.close();
    }
}
