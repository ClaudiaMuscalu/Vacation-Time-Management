package com.timemanagement.servlet;

import com.timemanagement.model.LeaveType;
import com.timemanagement.service.LeaveTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdateLeaveType")
public class UpdateLeaveType extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();

        int idLeaveType = Integer.parseInt(request.getParameter("leavetypeid"));
        String newName = request.getParameter("newname");

        leaveTypeService.update(idLeaveType, newName);

        HttpSession session = request.getSession();
        response.sendRedirect("updateLeaveType.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
