package com.timemanagement.repository;

import com.timemanagement.model.Department;

import java.sql.*;
import java.util.ArrayList;

public class DepartmentRepository implements IRepository {

    private static final String Url = "jdbc:mysql://localhost:3306/sys";
    private static final String User = "root";
    private static final String Password = "1234";

    @Override
    public Object get(int id) {
        Department department = null;
        String query = "SELECT * FROM departments WHERE department_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                department = new Department(resultset.getInt("department_id"),
                        resultset.getString("name"), resultset.getInt("manager_id"));
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
        return department;
    }

    public Object get(String name) {
        Department department = null;
        String query = "SELECT password FROM departments WHERE name = ?";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setString(1, name);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                department = new Department(resultset.getInt("department_id"),
                        resultset.getString("name"), resultset.getInt("manager_id"));
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

        return department;
    }

    public ArrayList<Department> getAll()
    {
        ArrayList<Department> departments = new ArrayList<>();
        String query = "SELECT department_id, name FROM departments";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
              Department department = new Department(resultset.getInt("department_id"),
                        resultset.getString("name"));
              departments.add(department);

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

        return departments;
    }

    @Override
    public void add(Object item) {
        Department department = (Department) item;
        String insertSQL = "INSERT INTO departments (department_id, name, manager_id) VALUES(?,?,?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(insertSQL);

            statement.setInt(1, department.getId());
            statement.setString(2, department.getName());
            statement.setInt(3, department.getManagerId());

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


    public void update(int id, String newName, int newManager) {

        String updateSQL = "UPDATE departments SET name = ?, manager_id = ? WHERE department_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(updateSQL);

            statement.setString(1, newName);
            statement.setInt(2, newManager);
            statement.setInt(3, id);

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
    public void delete(int id) { }
}
