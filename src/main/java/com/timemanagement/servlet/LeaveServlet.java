package com.timemanagement.servlet;

import com.timemanagement.model.Request;
import com.timemanagement.model.User;
import com.timemanagement.repository.RequestRepository;
import com.timemanagement.service.UserService;
import com.timemanagement.service.ValidationRequestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/LeaveServlet")
public class LeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserService userService = UserService.getInstance();
        RequestRepository requestRepository = new RequestRepository();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        ValidationRequestService validatorRequests = new ValidationRequestService();

        int userId = Integer.parseInt(request.getParameter("userid"));
        int departmentId = Integer.parseInt(request.getParameter("departmentid"));
        int leaveType = Integer.parseInt(request.getParameter("leavetype"));
        String startDateString = request.getParameter("startdate");
        String endDateString = request.getParameter("enddate");
        String statusLeave = request.getParameter("status");
        java.util.Date startDate = null;
        java.util.Date endDate = null;
        try {

             startDate = dateFormat.parse(startDateString);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
             endDate = dateFormat.parse(endDateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
        java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

        Request newRequest = new Request(userId, departmentId, leaveType, statusLeave, sqlStartDate, sqlEndDate);

        int daysBetween = (int) validatorRequests.daysBetweenTwoDates(startDateString, endDateString) + 1;
        newRequest.setPeriod(daysBetween);

        User user = userService.get(userId);
        user.setDaysLeft(user.getDaysLeft()- daysBetween);
        user.setPeriodsLeft(user.getPeriodsLeft() - 1);

        userService.update(user);

        requestRepository.add(newRequest);

        HttpSession session = request.getSession();
        session.setAttribute("user", userId);
        response.sendRedirect("successAction.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}
