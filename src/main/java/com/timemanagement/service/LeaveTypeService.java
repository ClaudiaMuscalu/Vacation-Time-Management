package com.timemanagement.service;

import com.timemanagement.model.LeaveType;
import com.timemanagement.repository.LeaveTypeRepository;

import java.util.ArrayList;

public class LeaveTypeService {

    private LeaveTypeRepository leaveTypeRepository = new LeaveTypeRepository();

    public static LeaveTypeService instance = null;

    private LeaveTypeService(){}

    public static LeaveTypeService getInstance(){

        if(instance == null)
        {
            instance = new LeaveTypeService();
        }
        return instance;
    }

    public LeaveType get(int id) {
        return (LeaveType) leaveTypeRepository.get(id);
    }

    public ArrayList<LeaveType> getAll(){
        return leaveTypeRepository.getAll();
    }

    public void add(LeaveType item){
        leaveTypeRepository.add(item);
    }

    public void update(int id, String newName) { leaveTypeRepository.update(id, newName);}

    public void delete(int id) { leaveTypeRepository.delete(id);}
}
