package com.timemanagement;

import model.Admin;
import model.Employee;
import model.Manager;

public class Main {

    public static void main(String[] args) {

        Admin admin = new Admin("A", "admin","admin", "Administration",
                "admin@gmail.com", "111");

        Employee employee = new Employee("E", "William","Gietz", "AC ACCOUNT",
                "wgeitz@gmail.com", "123456", 205, 110);

        Manager manager = new Manager("M", "Shelley", "Higgins", "AC_MGR",
                "shiggins@gamil.com", "123", 101, 110);

        System.out.println(admin);
        System.out.println(employee);
        System.out.println(manager);
    }
}
