package com.timemanagement.servlet;

import com.timemanagement.model.Request;
import com.timemanagement.model.User;
import com.timemanagement.service.DepartmentService;
import com.timemanagement.service.RequestService;
import com.timemanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String sid = request.getParameter("id");
        int id = Integer.parseInt(sid);

        int idDepartment = Integer.parseInt(request.getParameter("department"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String jobtitle = request.getParameter("jobtitle");
        int role = Integer.parseInt(request.getParameter("usertype"));

        DepartmentService departmentService = DepartmentService.getInstance();
        UserService userService = UserService.getInstance();
        User user = new User();
        user.setId(id);
        user.setDepartment(departmentService.get(idDepartment));
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setJobName(jobtitle);
        user.setRoleId(role);

        boolean ok = userService.update(user);
        if(ok){
            response.sendRedirect("successAction.jsp");
        }
        else
        {
            out.println("Sorry! unable to update record");
        }

        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
