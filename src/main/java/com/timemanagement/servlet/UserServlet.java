package com.timemanagement.servlet;

import com.timemanagement.model.User;
import com.timemanagement.repository.UserRepository;
import com.timemanagement.service.HasherService;
import com.timemanagement.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {

        HasherService hasherService = HasherService.getInstance();
        UserService userService = UserService.getInstance();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try{
            User user = userService.get(email);
            if(hasherService.checkPassword(user.getPassword(),password))
            {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                if(user.getRoleId() == 1)
                    response.sendRedirect("employeePage.jsp");
                else
                response.sendRedirect("adminPage.jsp");

            }
            else
            {
                response.sendRedirect("loginPage.jsp");
            }
        }
        catch(Exception e){
            System.out.println("This email doesn't exist!");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}
