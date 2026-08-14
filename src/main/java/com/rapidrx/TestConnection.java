package com.rapidrx;
import java.sql.Connection;

import com.rapidrx.util.DBConnection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("RapidRx database connection successful!");
        } else {
            System.out.println("Connection failed!");
        }
    }
}