package main.java.model;

public class Admin extends User {

    private int adminId = super.getUserId();

    public Admin(String userType, String firstName, String lastName, String jobName, String email,
                 String password, int adminId) {
        super(userType, firstName, lastName, jobName, email, password);
        this.adminId = adminId;

    }

    public Admin(String userType, String firstName, String lastName, String jobName, String email,
                 String password) {
        super(userType, firstName, lastName, jobName, email, password);

    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    @Override
    public void setUserType(String userType) {
        super.setUserType("Admin");
    }
}
