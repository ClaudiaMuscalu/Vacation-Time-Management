package com.timemanagement.repository;

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
        return null;
    }

    @Override
    public void add(Object item) {

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

        return typesOfLeave;
    }

}

