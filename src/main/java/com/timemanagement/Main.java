
import main.java.model.Admin;
import main.java.model.Employee;
import main.java.model.Manager;
import main.java.model.Department;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {

        Admin admin = new Admin("A", "admin","admin", "Administration",
                "admin@gmail.com", "111");

        Employee employee = new Employee("E", "William","Gietz", "AC ACCOUNT",
                "wgeitz@gmail.com", "123456", 205, 110);

        Manager manager = new Manager("M", "Shelley", "Higgins", "AC_MGR",
                "shiggins@gamil.com", "123", 101, 110);

        Department d = new Department(1,"IT",205);
        Department d1 = new Department(2,"SALES",101);
        System.out.println(admin);
        System.out.println(employee);
        System.out.println(manager);


        // Testing database connection
        String url = "jdbc:mysql://localhost:3306/vacationtimedatabase";;
        String username = "root";
        String password = "";

        Connection dbConnection = null;
        PreparedStatement statement = null;

        String sqlInsert = "INSERT INTO DEPARTMENTS " +
                "(departmentId, departmentName, managerId) " +
                "VALUES (?, ?, ?)";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbConnection = DriverManager.getConnection(url, username, password);
            statement = dbConnection.prepareStatement(sqlInsert);

            statement.setInt(1, d.getDepartmentId());
            statement.setString(2, d.getDepartmentName());
            statement.setInt(3, d.getManagerId());


            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e)   {
            e.printStackTrace();
        } finally {
            try {
                assert dbConnection != null;
                dbConnection.close();

                assert statement != null;
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
