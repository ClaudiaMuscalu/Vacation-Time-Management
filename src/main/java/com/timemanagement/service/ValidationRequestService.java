package com.timemanagement.service;

import com.timemanagement.model.User;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class  ValidationRequestService {

    private UserService userService = UserService.getInstance();
    public long daysBetweenTwoDates (String date1, String date2){

        LocalDate dateBefore = LocalDate.parse(date1);
        LocalDate dateAfter = LocalDate.parse(date2);

        long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);

        return noOfDaysBetween;
    }

    public boolean hasLeftDaysForLeave (int userId, String date1, String date2)
    {
        long noOfDaysBetween = daysBetweenTwoDates(date1, date2);

        User userLeaveRequest = userService.get(userId);
        if(userLeaveRequest.getDaysLeft() - noOfDaysBetween < 0){
            return false;
        }
            return true;
    }
}
