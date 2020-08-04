package com.timemanagement.repository;

import com.timemanagement.model.Department;
import com.timemanagement.model.LeaveType;

import java.sql.*;
import java.util.ArrayList;

public class LeaveTypeRepository implements IRepository
{
    private static final String Url = "jdbc:mysql://localhost:3306/sys";
    private static final String User = "root";
    private static final String Password = "1234";

    @Override
    public Object get(int id) {
        LeaveType leaveType = null;
        String query = "SELECT * FROM type_of_leave WHERE id = ?";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                leaveType = new LeaveType(resultset.getInt("id"), resultset.getString("title"));
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

        return leaveType;
    }

    @Override
    public void add(Object item) {
        LeaveType leaveType = (LeaveType) item;
        String insertSQL = "INSERT INTO type_of_leave (id, title) VALUES(?,?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(insertSQL);

            statement.setInt(1, leaveType.getId());
            statement.setString(2, leaveType.getTitle());

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
            }
        }
    }

    @Override
    public void delete(int id) {

    }

    public ArrayList<LeaveType> getAll()
    {
        ArrayList<LeaveType> typesOfLeave = new ArrayList<>();

        String query = "SELECT * FROM type_of_leave";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                LeaveType leaveType = new LeaveType(resultset.getInt("id"),
                        resultset.getString("title"));
                typesOfLeave.add(leaveType);

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

        return typesOfLeave;
    }

}

