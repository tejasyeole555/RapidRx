package com.rapidrx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rapidrx.model.User;
import com.rapidrx.util.DBConnection;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, 'USER')";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public User loginUser(String email, String password) {

    User user = null;

    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            user = new User();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return user;
    }
}