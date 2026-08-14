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

@WebServlet("/confirm-payment")
public class ConfirmPaymentServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get saved checkout information
        String address =
                (String) session.getAttribute("deliveryAddress");

        Object totalObject =
                session.getAttribute("orderTotal");

        // Get cart
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        // Validate data
        if (user == null || address == null ||
                totalObject == null || cart == null || cart.isEmpty()) {

            response.sendRedirect("cart");
            return;
        }

        // Convert total amount
        double totalAmount =
                Double.parseDouble(totalObject.toString());

        // Create order using your EXISTING method
        int orderId = orderDAO.createOrder(
                user.getId(),
                totalAmount,
                address,
                cart
        );

        if (orderId > 0) {

            // Clear cart only after successful order
            session.removeAttribute("cart");

            // Redirect to existing success page
            response.sendRedirect(
                    "order-success.jsp?orderId=" + orderId
            );

        } else {

            response.sendRedirect("payment.jsp?error=failed");
        }
    }
}