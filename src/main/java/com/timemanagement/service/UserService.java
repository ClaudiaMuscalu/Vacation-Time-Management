package com.timemanagement.service;

import com.timemanagement.model.User;
import com.timemanagement.repository.UserRepository;

public class UserService {

    private UserRepository userRepository = new UserRepository();
    public static UserService instance = null;

    private UserService(){}

    public static UserService getInstance(){
        if(instance == null)
            instance = new UserService();

        return instance;
    }

    public User get(int id){
        return userRepository.get(id);
    }

    public User get(String email){
        return userRepository.get(email);
    }

    public void add(User user){
        userRepository.add(user);
    }

    public void delete(int id){
        userRepository.delete(id);
    }
}
