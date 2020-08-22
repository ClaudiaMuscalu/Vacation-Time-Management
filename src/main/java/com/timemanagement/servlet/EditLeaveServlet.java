package com.timemanagement.servlet;

import com.timemanagement.model.Request;
import com.timemanagement.model.User;
import com.timemanagement.service.RequestService;
import com.timemanagement.service.UserService;
import com.timemanagement.service.ValidationRequestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/EditLeaveServlet")
public class EditLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        ValidationRequestService validatorRequests = new ValidationRequestService();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String sid = request.getParameter("id");
        int id = Integer.parseInt(sid);
        int idUser = Integer.parseInt(request.getParameter("userid"));
        int idDepartment = Integer.parseInt(request.getParameter("depid"));
        int idLeave = Integer.parseInt(request.getParameter("leaveid"));
        String status = request.getParameter("status");
        String startDateString = request.getParameter("startDate");
        String endDateString = request.getParameter("endDate");

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

        RequestService requestService = RequestService.getInstance();
        Request r = new Request();
        r.setId(id);
        r.setDepartmentId(idDepartment);
        r.setLeaveType(idLeave);
        r.setUserId(idUser);
        r.setStartDate(startDate);
        r.setEndDate(endDate);
        r.setStatus(status);

        int daysBetween = (int) validatorRequests.daysBetweenTwoDates(startDateString, endDateString);
        r.setPeriod(daysBetween);

        UserService userService = UserService.getInstance();
        User user = userService.get(idUser);

        if(status.equals("disapproved"))
        {
            user.setDaysLeft(user.getDaysLeft() + r.getPeriod());
            user.setPeriodsLeft(user.getPeriodsLeft() + 1);
            boolean x = userService.update(user);
        }

        boolean ok = requestService.update(r);
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
