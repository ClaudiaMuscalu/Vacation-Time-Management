package com.timemanagement.model;

import java.util.Date;

public class Request{

    private int id;
    private int userId;
    private int departmentId;
    private int leaveType;
    private String status;
    private Date startDate;
    private Date endDate;
    private int period;

    public Request() { }

    public Request(int userId, int departmentId, int leaveType, String statusLeave, Date startDate, Date endDate) {
        this.userId = userId;
        this.departmentId = departmentId;
        this.leaveType = leaveType;
        this.status = statusLeave;
        this.startDate = startDate;
        this.endDate = endDate;

    }
    public Request(int id, int userId, int departmentId, int leaveType, String status,
                   Date startDate, Date endDate) {

        this.id = id;
        this.userId = userId;
        this.departmentId = departmentId;
        this.leaveType = leaveType;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
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

    public int getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(int leaveType) {
        this.leaveType = leaveType;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

}
