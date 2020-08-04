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

@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DepartmentService departmentService = DepartmentService.getInstance();

        int departmentId = Integer.parseInt(request.getParameter("departmentid"));
        int managerId = Integer.parseInt(request.getParameter("managerid"));
        String newName = request.getParameter("newname");

        departmentService.update(departmentId, newName, managerId);

        HttpSession session = request.getSession();
        response.sendRedirect("updateDepartment.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
