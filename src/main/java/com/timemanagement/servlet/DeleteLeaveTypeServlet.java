package com.timemanagement.servlet;

import com.timemanagement.service.LeaveTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteLeaveTypeServlet")
public class DeleteLeaveTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LeaveTypeService leaveTypeService = LeaveTypeService.getInstance();

        String sid = request.getParameter("id");
        int id = Integer.parseInt(sid);

        leaveTypeService.delete(id);

        response.sendRedirect("leaveTypes.jsp");
    }
}
