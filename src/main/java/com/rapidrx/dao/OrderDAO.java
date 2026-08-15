package com.rapidrx.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.rapidrx.model.CartItem;
import com.rapidrx.util.DBConnection;
public class OrderDAO {

    public int createOrder(int userId,
                           double totalAmount,
                           String address,
                           List<CartItem> cart) {

        Connection con = null;
        PreparedStatement orderPs = null;
        PreparedStatement itemPs = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            con.setAutoCommit(false);

            String orderSql =
                    "INSERT INTO orders " +
                    "(user_id, total_amount, address, status) " +
                    "VALUES (?, ?, ?, ?)";

            orderPs = con.prepareStatement(
                    orderSql,
                    Statement.RETURN_GENERATED_KEYS
            );

            orderPs.setInt(1, userId);
            orderPs.setDouble(2, totalAmount);
            orderPs.setString(3, address);
            orderPs.setString(4, "PLACED");

            orderPs.executeUpdate();

            rs = orderPs.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            String itemSql =
                    "INSERT INTO order_items " +
                    "(order_id, medicine_id, medicine_name, " +
                    "price, quantity, total) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            itemPs = con.prepareStatement(itemSql);
            MedicineDAO medicineDAO = new MedicineDAO();

            for (CartItem item : cart) {

                // Reduce medicine stock
                boolean stockUpdated = medicineDAO.reduceStock(con,item.getMedicineId(),item.getQuantity());

                // Stop order if sufficient stock is not available
                if (!stockUpdated) {
                    con.rollback();
                    return 0;
                }

                // Add order item
                itemPs.setInt(1, orderId);
                itemPs.setInt(2, item.getMedicineId());
                itemPs.setString(3, item.getMedicineName());
                itemPs.setDouble(4, item.getPrice());
                itemPs.setInt(5, item.getQuantity());
                itemPs.setDouble(6, item.getTotal());

                itemPs.addBatch();
            }

            itemPs.executeBatch();

            con.commit();

            return orderId;

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (Exception rollbackError) {
                rollbackError.printStackTrace();
            }

            return 0;

        } finally {

            try {
                if (rs != null) rs.close();
                if (orderPs != null) orderPs.close();
                if (itemPs != null) itemPs.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<com.rapidrx.model.Order> getOrdersByUser(int userId) {

    List<com.rapidrx.model.Order> orders = new java.util.ArrayList<>();

    String sql = "SELECT id, user_id, total_amount, address, status " +
                 "FROM orders WHERE user_id = ? ORDER BY order_date DESC";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            com.rapidrx.model.Order order =
                    new com.rapidrx.model.Order();

            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("user_id"));
            order.setTotalAmount(rs.getDouble("total_amount"));
            order.setAddress(rs.getString("address"));
            order.setStatus(rs.getString("status"));

            orders.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return orders;
    }

    public List<com.rapidrx.model.CartItem> getOrderItems(int orderId) {

    List<com.rapidrx.model.CartItem> items =
            new java.util.ArrayList<>();

    String sql = "SELECT medicine_id, medicine_name, price, quantity " +
                 "FROM order_items WHERE order_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, orderId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            com.rapidrx.model.CartItem item =
                    new com.rapidrx.model.CartItem();

            item.setMedicineId(rs.getInt("medicine_id"));
            item.setMedicineName(rs.getString("medicine_name"));
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));

            items.add(item);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return items;
    }

    public boolean placeOrder(int userId, double totalAmount,
                          String paymentMethod, String paymentStatus) {

    String sql = "INSERT INTO orders "
            + "(user_id, total_amount, status, payment_method, payment_status) "
            + "VALUES (?, ?, ?, ?, ?)";

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {

        ps.setInt(1, userId);
        ps.setDouble(2, totalAmount);
        ps.setString(3, "Placed");
        ps.setString(4, paymentMethod);
        ps.setString(5, paymentStatus);

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
    }

    public List<com.rapidrx.model.Order> getAllOrders() {

    List<com.rapidrx.model.Order> orders =
            new java.util.ArrayList<>();

    String sql = "SELECT id, user_id, total_amount, address, status, " +
                 "payment_method, payment_status " +
                 "FROM orders ORDER BY order_date DESC";

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {

        while (rs.next()) {

            com.rapidrx.model.Order order =
                    new com.rapidrx.model.Order();

            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("user_id"));
            order.setTotalAmount(rs.getDouble("total_amount"));
            order.setAddress(rs.getString("address"));
            order.setStatus(rs.getString("status"));
            order.setPaymentMethod(
                    rs.getString("payment_method")
            );
            order.setPaymentStatus(
                    rs.getString("payment_status")
            );

            orders.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return orders;
    }

    public boolean updateOrderStatus(int orderId, String status) {

    String sql = "UPDATE orders SET status = ? WHERE id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, status);
        ps.setInt(2, orderId);

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
    }

    public int getTotalOrders() {

    String sql = "SELECT COUNT(*) FROM orders";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            return rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
    }

}