package com.timemanagement;


import com.timemanagement.model.LeaveType;
import com.timemanagement.model.Request;
import com.timemanagement.model.User;
import com.timemanagement.repository.LeaveTypeRepository;
import com.timemanagement.repository.RequestRepository;
import com.timemanagement.service.UserService;

public class Main {

    public static void main(String[] args) {

        LeaveTypeRepository leaveTypeRepository = new LeaveTypeRepository();

        for(LeaveType leaveType: leaveTypeRepository.getAll())
            System.out.println(leaveType.Title);

        UserService userService = UserService.getInstance();

        User user = userService.get("elenaclaudiamuscalu@yahoo.ro");
        System.out.print(user.getId());
    }
}
