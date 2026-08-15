package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.dao.OrderDAO;
import com.rapidrx.dao.UserDAO;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private MedicineDAO medicineDAO;
    private OrderDAO orderDAO;
    private UserDAO userDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
        orderDAO = new OrderDAO();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Get statistics
        int totalMedicines = medicineDAO.getTotalMedicines();
        int totalOrders = orderDAO.getTotalOrders();
        int totalUsers = userDAO.getTotalUsers();
        int lowStockCount = medicineDAO.getLowStockCount();

        // Send data to JSP
        request.setAttribute("totalMedicines", totalMedicines);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("lowStockCount", lowStockCount);

        // Open dashboard
        request.getRequestDispatcher("admin-dashboard.jsp")
               .forward(request, response);
    }
}