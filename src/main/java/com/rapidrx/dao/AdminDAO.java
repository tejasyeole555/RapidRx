package com.rapidrx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rapidrx.model.Admin;
import com.rapidrx.util.DBConnection;

public class AdminDAO {

    public Admin loginAdmin(String username, String password) {

        String sql =
            "SELECT id, username FROM admins WHERE username = ? AND password = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Admin admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));

                return admin;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}