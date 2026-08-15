package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.OrderDAO;

@WebServlet("/update-order-status")
public class UpdateOrderStatusServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Only admin can update order status
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(
                    request.getParameter("orderId")
            );

            String status = request.getParameter("status");

            boolean updated =
                    orderDAO.updateOrderStatus(orderId, status);

            if (updated) {
                response.sendRedirect(
                        "admin-orders?message=statusUpdated"
                );
            } else {
                response.sendRedirect(
                        "admin-orders?error=updateFailed"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-orders?error=invalid");
        }
    }
}