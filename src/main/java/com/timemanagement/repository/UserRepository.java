package com.timemanagement.repository;

import com.timemanagement.model.Department;
import com.timemanagement.model.User;
import com.timemanagement.service.HasherService;

import java.sql.*;
import java.util.ArrayList;

public class UserRepository implements IRepository {

    private static HasherService hasherService = HasherService.getInstance();
    private static final String Url = "jdbc:mysql://localhost:3306/sys";
    private static final String User = "root";
    private static final String Password = "1234";

    private static ArrayList<User> users = new ArrayList<>();

    @Override
    public User get(int id) {
        User user = null;
        String query = "SELECT * FROM users WHERE user_id = ?";

        DepartmentRepository departmentRepository = new DepartmentRepository();

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setString(1, String.valueOf(id));

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                user = new User(resultset.getInt("user_id"),
                            resultset.getInt("manager_id"),
                            resultset.getInt("user_type_code"),
                            (Department)departmentRepository.get(resultset.getInt("department_id")),
                            resultset.getString("first_name"),
                            resultset.getString("last_name"),
                            resultset.getString("job_name"),
                            resultset.getString("email"),
                            resultset.getString("password"));
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

        return user;
    }

    public User get(String email) {
        User user = null;
        String query = "SELECT * FROM users WHERE email = ?";

        DepartmentRepository departmentRepository = new DepartmentRepository();

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(query);

            statement.setString(1, email);

            ResultSet resultset = statement.executeQuery();

            while (resultset.next()) {
                user = new User(
                        resultset.getInt("user_id"),
                        resultset.getInt("manager_id"),
                        resultset.getInt("user_type_code"),
                        (Department)departmentRepository.get(resultset.getInt("department_id")),
                        resultset.getString("first_name"),
                        resultset.getString("last_name"),
                        resultset.getString("job_name"),
                        resultset.getString("email"),
                        resultset.getString("password"));
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

        return user;
    }

    @Override
    public void add(Object obj) {

        User user = (User) obj;
        String insertSQL = "INSERT INTO users (department_id, user_type_code, first_name, last_name," +
                " email, password, job_name, manager_id) VALUES(?,?,?,?,?,?,?,?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(insertSQL);

            statement.setInt(1, user.getDepartment().getId());
            statement.setInt(2, user.getRoleId());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getPassword());
            statement.setString(7, user.getJobName());
            statement.setInt(8, 1);

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

        String deleteSQL = "DELETE FROM users WHERE user_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Url, User, Password);
            statement = connection.prepareStatement(deleteSQL);

            statement.setInt(1, id);

            statement.execute();

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
}


