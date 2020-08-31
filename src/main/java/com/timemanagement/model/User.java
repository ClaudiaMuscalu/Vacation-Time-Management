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
    private int holiday1June31August;
    private String favColor;

    public User(){}

    public User(String email, String password) {
        this();
        this.email = email;
        this.password = password;
    }

    public User(int id, int managerId, int roleId, Department department, String firstName, String lastName,
                String jobName, String email, String password, int daysLeft, int periodsLeft, int holiday, String favcolor) {
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
        this.holiday1June31August = holiday;
        this.favColor = favcolor;
    }

    public User(int id, int managerId, int roleId, Department department, String firstName, String lastName,
                String jobName, String email, String password, int daysLeft, int periodsLeft, int holiday) {
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
        this.holiday1June31August = holiday;
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

    public User(int managerId, int roleId, Department department, String firstName, String lastName, String jobName,
                String email, String password, String favColor) {
        this(email, password);
        this.managerId = managerId;
        this.roleId = roleId;
        this.department = department;
        this.firstName = firstName;
        this.lastName = lastName;
        this.jobName = jobName;
        this.favColor = favColor;
    }

    public User(int id, int managerId, int roleId, Department department, String firstName, String lastName, String jobName,
                String email, String password) {
        this(managerId, roleId, department, firstName, lastName, jobName, email, password);
        this.id = id;
    }

    public User(int user_id, int manager_id, int user_type_code, Department department, String first_name, String last_name, String job_name, String email, String password, String favcolor) {
        this.id = user_id;
        this.managerId = manager_id;
        this.roleId = user_type_code;
        this.department = department;
        this.firstName = first_name;
        this.lastName = last_name;
        this.jobName = job_name;
        this.email = email;
        this.password = password;
        this.favColor = favcolor;
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

    public String getFavColor() {
        return favColor;
    }

    public void setFavColor(String favColor) {
        this.favColor = favColor;
    }

    public int getHoliday1June31August() {
        return holiday1June31August;
    }

    public void setHoliday1June31August(int holiday1June31August) {
        this.holiday1June31August = holiday1June31August;
    }
}
