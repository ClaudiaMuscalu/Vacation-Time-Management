package com.timemanagement.service;

import com.timemanagement.model.Department;
import com.timemanagement.repository.DepartmentRepository;

import java.util.ArrayList;

public class DepartmentService {

    private DepartmentRepository departmentRepository = new DepartmentRepository();
    public static DepartmentService instance = null;

    private DepartmentService(){}

    public static DepartmentService getInstance(){
        if(instance == null)
            instance = new DepartmentService();
        return instance;
    }

    public Department get(int id){
        return (Department)departmentRepository.get(id);
    }

    public Department get(String name){
        return (Department)departmentRepository.get(name);
    }

    public ArrayList<Department> getAll(){
        return departmentRepository.getAll();
    }
}
