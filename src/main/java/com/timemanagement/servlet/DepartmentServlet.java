package com.timemanagement.servlet;

import com.timemanagement.model.Department;
import com.timemanagement.service.DepartmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DepartmentService departmentService = DepartmentService.getInstance();

        String departmentName = request.getParameter("departmentname");
        int managerId = Integer.parseInt(request.getParameter("managerid"));


        Department department = new Department(departmentName, managerId);
        departmentService.add(department);

        HttpSession session = request.getSession();
        response.sendRedirect("createDepartment.jsp");

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
