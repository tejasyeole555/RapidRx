package com.rapidrx.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.OrderDAO;
import com.rapidrx.model.CartItem;
import com.rapidrx.model.User;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check logged-in user
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get delivery address
        String address = request.getParameter("address");

        if (address == null || address.trim().isEmpty()) {
            response.sendRedirect("checkout.jsp");
            return;
        }

        // Get cart
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // Calculate total
        double totalAmount = 0;

        for (CartItem item : cart) {
            totalAmount += item.getTotal();
        }

        // Save checkout details temporarily
        session.setAttribute("deliveryAddress", address);
        session.setAttribute("orderTotal", totalAmount);

        // Go to payment selection
        response.sendRedirect("payment.jsp");
    }
}