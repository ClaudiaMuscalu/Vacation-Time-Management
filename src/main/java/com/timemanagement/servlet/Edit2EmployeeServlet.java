package com.timemanagement.servlet;

import com.timemanagement.model.Department;
import com.timemanagement.model.User;
import com.timemanagement.service.DepartmentService;
import com.timemanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/Edit2EmployeeServlet")
public class Edit2EmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        request.getRequestDispatcher("LayoutAdmin1.jsp").include(request, response);

        String sid = request.getParameter("id");
        int id = Integer.parseInt(sid);

        UserService userService= UserService.getInstance();
        DepartmentService departmentService = DepartmentService.getInstance();

        User u = userService.get(id);
        ArrayList<Department> departments = departmentService.getAll();

        out.println("<div class='col-9'>");
        out.println("</br>");
        out.println("</br>");
        out.print("<form action='EditEmployeeServlet' method='post' style='margin-left: 25%'>");
        out.println("<h1 style='text-align: center;'>Update employee</h1>");
        out.println("</br>");
        out.print("<input type='hidden' name='id' value='"+u.getId()+"'/>");
        out.print("<div class='form-group'><label>Last Name:</label><input class='form-control' type='text' name='lastname' value='"+u.getLastName()+"'/></div>");
        out.print("<div class='form-group'><label>First Name:</label><input class='form-control' type='text' name='firstname' value='"+u.getFirstName()+"'/></div>");
        out.print("<div class='form-group'><label>Department:</label>");
        out.print("<select name='department' class='form-control' id='exampleFormControlSelect1'>");
        for(Department d : departments) {
            if(u.getDepartment().getId() == d.getId())
            out.print("<option value='" + d.getId() +"' selected" + ">" + d.getName() + "</option>");
            else
                out.print("<option value=" + d.getId() + ">" + d.getName() + "</option>");

        }
        out.println("</select></div>");
        out.println("<div class=\"form-group\">\n" + "<div class=\"maxl\">\n" + "<label class=\"radio inline\">Role\n" +
                "<input type=\"radio\" name=\"usertype\" value=\"2\">\n" + "<span> Manager </span>\n" + "</label>\n" + "<label class=\"radio inline\">\n" +
                "<input type=\"radio\" name=\"usertype\" value=\"1\" checked>\n" + "<span> Worker </span>\n" + "</label>\n" + "</div>\n" + "</div>");

        out.print("<div class='form-group'><label>Job Title:</label><input class='form-control' type='text' name='jobtitle' value='"+u.getJobName()+"'/></div>");
        out.print("<button type=\"submit\"  class=\"btn btn-lg btn-primary\" style='width:130px;'>Edit & Save</button>");
        out.print("</form>");
        out.print("</div>");

        out.close();
    }
}
