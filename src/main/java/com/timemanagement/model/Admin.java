package com.timemanagement.model;

public class Admin extends User{

    private static Admin admin = null;

    private Admin(){
        super();
    }

    public static Admin getAdmin(){

        if(admin == null)
            admin = new Admin();

        return admin;
    }
}
