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
import com.rapidrx.model.Order;
import com.rapidrx.model.User;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {

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

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("id");

        if (id == null) {
            response.sendRedirect("order-history");
            return;
        }

        int orderId;

        try {
            orderId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.sendRedirect("order-history");
            return;
        }

        // Get user's orders
        List<Order> orders =
                orderDAO.getOrdersByUser(user.getId());

        Order selectedOrder = null;

        for (Order order : orders) {

            if (order.getId() == orderId) {
                selectedOrder = order;
                break;
            }
        }

        // Security check:
        // User can only view their own order.
        if (selectedOrder == null) {
            response.sendRedirect("order-history");
            return;
        }

        List<CartItem> items =
                orderDAO.getOrderItems(orderId);

        request.setAttribute("order", selectedOrder);
        request.setAttribute("orderItems", items);

        request.getRequestDispatcher("order-details.jsp")
               .forward(request, response);
    }
}