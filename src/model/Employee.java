package model;

public class Employee extends User{

    private int employeeId = super.getUserId();
    private int managerId;
    private int departmentId;

    public Employee(String userType, String firstName, String lastName, String jobName, String email, String password,
                    int employeeId, int managerId, int departmentId) {
        super(userType, firstName, lastName, jobName, email, password);
        this.employeeId = employeeId;
        this.managerId = managerId;
        this.departmentId = departmentId;
    }

    public Employee(String userType, String firstName, String lastName, String jobName, String email, String password,
                    int managerId, int departmentId) {
        super(userType, firstName, lastName, jobName, email, password);
        this.managerId = managerId;
        this.departmentId = departmentId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }



    @Override
    public String toString() {
        return super.toString() +
                "employeeId=" + employeeId +
                ", managerId=" + managerId +
                ", departmentId='" + departmentId + '\'' +
                '}';
    }
}
