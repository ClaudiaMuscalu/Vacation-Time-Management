package com.timemanagement.service;

import com.timemanagement.model.Request;
import com.timemanagement.repository.RequestRepository;

import java.util.ArrayList;

public class RequestService {

    private RequestRepository requestRepository = new RequestRepository();

    public static RequestService instance = null;

    private RequestService(){}

    public static RequestService getInstance(){
        if(instance == null){
            instance = new RequestService();
        }
        return instance;
    }

    public Request get(int id){
        return requestRepository.get(id);
    }

    public ArrayList<Request> getAll(){
        return requestRepository.getAll();
    }

    public boolean update(Request request){
        return requestRepository.update(request);
    }

    public void add(Request request){
        requestRepository.add(request);
    }

    public ArrayList<Request> getAllApprovedLeaveRequestsForADepartment(int idDepartment)
    {
        return requestRepository.getAllApprovedLeaveRequestsForADepartment(idDepartment);
    }
}
