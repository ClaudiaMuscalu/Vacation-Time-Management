package main.java.model;

import java.util.Date;

public class Request {

    private String requestId;
    private int userId;
    private String departmentId;
    private String status;
    private Date startDate;
    private Date endDate;
    private int period;

    public Request(String requestId, int userId, String departmentId, String status,
                   Date startDate, Date endDate, int period) {
        this.requestId = requestId;
        this.userId = userId;
        this.departmentId = departmentId;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.period = period;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }
}
