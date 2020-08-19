package com.timemanagement.servlet;

import com.timemanagement.model.Department;
import com.timemanagement.model.User;
import com.timemanagement.service.DepartmentService;
import com.timemanagement.service.HasherService;
import com.timemanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HasherService hasherService = HasherService.getInstance();
        DepartmentService departmentService = DepartmentService.getInstance();
        UserService userService = UserService.getInstance();

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String jobName = request.getParameter("jobname");

        int departmentId = Integer.parseInt(request.getParameter("department"));
        int userType = Integer.parseInt(request.getParameter("usertype"));

        String password = hasherService.hash("1234");
        Department department = departmentService.get(departmentId);

        User user = new User(department.getManagerId(),  userType, department, firstName, lastName, jobName, email, password);
        userService.add(user);

        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        response.sendRedirect("successAction.jsp");
    }
}
