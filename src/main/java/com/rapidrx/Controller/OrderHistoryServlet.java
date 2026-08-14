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
import com.rapidrx.model.User;

@WebServlet("/order-history")
public class OrderHistoryServlet extends HttpServlet {

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

        List<Order> orders =
                orderDAO.getOrdersByUser(user.getId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("order-history.jsp")
               .forward(request, response);
    }
}