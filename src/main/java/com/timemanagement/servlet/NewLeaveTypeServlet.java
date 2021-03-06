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

@WebServlet("/NewLeaveTypeServlet")
public class NewLeaveTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();

        String leaveTitle = request.getParameter("leavetitle");

        LeaveType leaveType = new LeaveType(leaveTitle);
        leaveTypeService.add(leaveType);

        HttpSession session = request.getSession();
        response.sendRedirect("successAction.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
