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
import com.rapidrx.model.Order;

@WebServlet("/admin-orders")
public class AdminOrderServlet extends HttpServlet {

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

        // Only admin can view all orders
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("admin-orders.jsp")
               .forward(request, response);
    }
}