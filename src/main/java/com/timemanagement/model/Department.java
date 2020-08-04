package com.timemanagement.model;

public class Department {

    private int id;
    private String name;
    private int managerId;

    public Department(){}

    public Department(int Id, String name) {
        this();
        this.id = Id;
        this.name = name;
    }

    public Department(int Id, String name, int managerId){
        this(Id, name);
        this.managerId = managerId;
    }

    public Department(String name, int managerId){
        this.name = name;
        this.managerId = managerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }
}
