package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.model.Medicine;

@WebServlet("/add-medicine")
public class AddMedicineServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Only admin can add medicine
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            double price =
                    Double.parseDouble(request.getParameter("price"));
            int stock =
                    Integer.parseInt(request.getParameter("stock"));

            Medicine medicine = new Medicine();

            medicine.setName(name);
            medicine.setCategory(category);
            medicine.setPrice(price);
            medicine.setStock(stock);

            boolean added = medicineDAO.addMedicine(medicine);

            if (added) {
                response.sendRedirect("admin-medicines");
            } else {
                response.sendRedirect("add-medicine.jsp?error=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-medicine.jsp?error=invalid");
        }
    }
}