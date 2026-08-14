package com.rapidrx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rapidrx.model.Medicine;
import com.rapidrx.util.DBConnection;

public class MedicineDAO {

    public List<Medicine> getAllMedicines() {

        List<Medicine> medicines = new ArrayList<>();

        String sql = "SELECT * FROM medicines";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Medicine medicine = new Medicine();

                medicine.setId(rs.getInt("id"));
                medicine.setName(rs.getString("name"));
                medicine.setCategory(rs.getString("category"));
                medicine.setPrice(rs.getDouble("price"));
                medicine.setStock(rs.getInt("stock"));

                medicines.add(medicine);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return medicines;
    }

    public Medicine getMedicineById(int id) {

    Medicine medicine = null;

    String sql = "SELECT * FROM medicines WHERE id = ?";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            medicine = new Medicine();

            medicine.setId(rs.getInt("id"));
            medicine.setName(rs.getString("name"));
            medicine.setCategory(rs.getString("category"));
            medicine.setPrice(rs.getDouble("price"));
            medicine.setStock(rs.getInt("stock"));
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return medicine;
    }
    
    public boolean addMedicine(Medicine medicine) {

    String sql = "INSERT INTO medicines (name, category, price, stock) VALUES (?, ?, ?, ?)";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, medicine.getName());
        ps.setString(2, medicine.getCategory());
        ps.setDouble(3, medicine.getPrice());
        ps.setInt(4, medicine.getStock());

        int rows = ps.executeUpdate();

        ps.close();
        con.close();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
    }

    public boolean deleteMedicine(int id) {

    String sql = "DELETE FROM medicines WHERE id = ?";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        int rows = ps.executeUpdate();

        ps.close();
        con.close();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
    }
    
}