package com.timemanagement.model;

public class User {

    private int id;
    private int managerId;
    private int roleId;
    private Department department;
    private String firstName;
    private String lastName;
    private String jobName;
    private String email;
    private String password;
    private int daysLeft;
    private int periodsLeft;

    public User(int id, int managerId, int roleId, Department department, String firstName, String lastName,
                String jobName, String email, String password, int daysLeft, int periodsLeft) {
        this.id = id;
        this.managerId = managerId;
        this.roleId = roleId;
        this.department = department;
        this.firstName = firstName;
        this.lastName = lastName;
        this.jobName = jobName;
        this.email = email;
        this.password = password;
        this.daysLeft = daysLeft;
        this.periodsLeft = periodsLeft;
    }

    public User(){}

    public User(String email, String password) {
        this();
        this.email = email;
        this.password = password;
    }

    public User(int managerId, int roleId, Department department, String firstName, String lastName, String jobName,
                String email, String password) {
        this(email, password);
        this.managerId = managerId;
        this.roleId = roleId;
        this.department = department;
        this.firstName = firstName;
        this.lastName = lastName;
        this.jobName = jobName;
    }

    public User(int id, int managerId, int roleId, Department department, String firstName, String lastName, String jobName,
                String email, String password) {
        this(managerId, roleId, department, firstName, lastName, jobName, email, password);
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getDaysLeft() {
        return daysLeft;
    }

    public void setDaysLeft(int daysLeft) {
        this.daysLeft = daysLeft;
    }

    public int getPeriodsLeft() {
        return periodsLeft;
    }

    public void setPeriodsLeft(int periodsLeft) {
        this.periodsLeft = periodsLeft;
    }
}
