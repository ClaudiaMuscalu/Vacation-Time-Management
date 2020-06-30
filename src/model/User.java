package model;

public class User {

    private static int userId = 100;
    private String userType;
    private String firstName;
    private String lastName;
    private String jobName;
    private String email;
    private String password;

    private int numberOfPeriods = 3; // an employee can take 30 days off in a maximum of three different times of the year
    private int daysLeft = 30;

    public User(String userType, String firstName, String lastName, String jobName, String email, String password) {
        userId ++;
        this.userType = userType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.jobName = jobName;
        this.email = email;
        this.password = password;
    }

    public User(String userType, String firstName, String lastName, String jobName, String email, String password,
                int numberOfPeriods, int daysLeft) {
        userId ++;
        this.userType = userType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.jobName = jobName;
        this.email = email;
        this.password = password;
        this.numberOfPeriods = numberOfPeriods;
        this.daysLeft = daysLeft;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        User.userId = userId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
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

    public int getNumberOfPeriods() {
        return numberOfPeriods;
    }

    public void setNumberOfPeriods(int numberOfPeriods) {
        this.numberOfPeriods = numberOfPeriods;
    }

    public int getDaysLeft() {
        return daysLeft;
    }

    public void setDaysLeft(int daysLeft) {
        this.daysLeft = daysLeft;
    }

    @Override
    public String toString() {
        return "User{" +
                "userType='" + userType + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", jobName='" + jobName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' + ", ";
    }
}
