package com.timemanagement.repository;

import com.timemanagement.model.Request;

import java.sql.*;
import java.util.ArrayList;

public class RequestRepository implements IRepository {

    private static final String Url = "jdbc:mysql://localhost:3306/sys";
    private static final String User = "root";
    private static final String Password = "1234";

    private static ArrayList<Request> requests = new ArrayList<>();

    @Override
    public Request get(int id) {
        Request request = null;
        String query = "SELECT * FROM requests WHERE request_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setString(1, String.valueOf(id));

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                request = new Request(resultset.getInt("request_id"),
                        resultset.getInt("user_id"),
                        resultset.getInt("department_id"),
                        resultset.getInt("leave_type_code"),
                        resultset.getString("status"),
                        resultset.getDate("start_date"),
                        resultset.getDate("end_date"));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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

        return request;
    }

    public ArrayList<Request> getAll()
    {
        ArrayList<Request>  requests= new ArrayList<>();
        String query = "SELECT * FROM requests";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                Request request;
                request = new Request(
                        resultset.getInt("request_id"),
                        resultset.getInt("user_id"),
                        resultset.getInt("department_id"),
                        resultset.getInt("leave_type_code"),
                        resultset.getString("status"),
                        resultset.getDate("start_date"),
                        resultset.getDate("end_date"));
                requests.add(request);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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
        return requests;
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

    public boolean update(Request request)
    {
        String updateSQL = "UPDATE requests SET request_id = ?, user_id = ?, department_id = ?, leave_type_code = ?," +
                " status = ?, start_date = ?, end_date = ? WHERE request_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(updateSQL);

            statement.setInt(1, request.getId());
            statement.setInt(2, request.getUserId());
            statement.setInt(3, request.getDepartmentId());
            statement.setInt(4, request.getLeaveType());
            statement.setString(5, request.getStatus());

            java.sql.Date sqlStartDate = new java.sql.Date(request.getStartDate().getTime());
            java.sql.Date sqlEndDate = new java.sql.Date(request.getEndDate().getTime());

            statement.setDate(6, sqlStartDate);
            statement.setDate(7, sqlEndDate);
            statement.setInt(8, request.getId());

            statement.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null)
                    connection.close();

                if (statement != null)
                    statement.close();
            } catch (SQLException se) {
                se.printStackTrace();
                return false;
            }
        }
        return true;
    }

    @Override
    public void delete(int id) {
    }
}
