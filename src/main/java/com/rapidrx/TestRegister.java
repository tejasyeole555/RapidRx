package com.rapidrx;

import com.rapidrx.dao.UserDAO;
import com.rapidrx.model.User;

public class TestRegister {

    public static void main(String[] args) {

        User user = new User(
                "Test User",
                "testuser@gmail.com",
                "123456"
        );

        UserDAO userDAO = new UserDAO();

        boolean result = userDAO.registerUser(user);

        if (result) {
            System.out.println("User Registered Successfully!");
        } else {
            System.out.println("Registration Failed!");
        }
    }
}