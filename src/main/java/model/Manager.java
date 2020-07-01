package main.java.model;

public class Manager extends User {

    private int managerId = super.getUserId();
    private int  departmentId;

    public Manager(String userType, String firstName, String lastName, String jobName, String email, String password,
                   int managerId, int departmentId) {
        super(userType, firstName, lastName, jobName, email, password);
        this.managerId = managerId;
        this.departmentId = departmentId;
    }

    public Manager(String userType, String firstName, String lastName, String jobName, String email, String password,
                   int departmentId) {
        super(userType, firstName, lastName, jobName, email, password);
        this.departmentId = departmentId;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    @Override
    public int getUserId() {
        return managerId;
    }

    @Override
    public String toString() {
        return super.toString() +
                "managerId=" + managerId +
                ", departmentId=" + departmentId +
                '}';
    }
}
