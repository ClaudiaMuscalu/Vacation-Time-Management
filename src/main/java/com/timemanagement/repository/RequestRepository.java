package com.timemanagement.repository;

import com.timemanagement.model.Request;
import com.timemanagement.model.User;

import java.sql.*;
import java.util.ArrayList;

public class RequestRepository implements IRepository {

    private static final String Url = "jdbc:mysql://localhost:3306/sys";
    private static final String User = "root";
    private static final String Password = "1234";

    private static ArrayList<Request> requests = new ArrayList<>();

    @Override
    public Object get(int id) {
        return null;
    }

    @Override
    public void add(Object item) {

        Request request = (Request) item;
        String insertSQL = "INSERT INTO requests (user_id, department_id, leave_type_code, status, " +
                "start_date, end_date) VALUES(?,?,?,?,?,?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(insertSQL);

            statement.setInt(1, request.getUserId());
            statement.setInt(2, request.getDepartmentId());
            statement.setInt(3, request.getLeaveType());
            statement.setString(4, request.getStatus());
            statement.setDate(5, (Date) request.getStartDate());
            statement.setDate(6, (Date) request.getEndDate());

            statement.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {

            try {
                if (connection != null)
                    connection.close();

                if (statement != null)
                    statement.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
    }

}
