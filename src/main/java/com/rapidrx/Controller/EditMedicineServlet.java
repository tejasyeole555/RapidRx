package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.model.Medicine;

@WebServlet("/edit-medicine")
public class EditMedicineServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Medicine medicine = medicineDAO.getMedicineById(id);

        if (medicine != null) {
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("edit-medicine.jsp")
                   .forward(request, response);
        } else {
            response.sendRedirect("admin-medicines.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Medicine medicine = new Medicine(
                id, name, category, price, stock
        );

        boolean updated = medicineDAO.updateMedicine(medicine);

        if (updated) {
            response.sendRedirect("admin-medicines.jsp?message=updated");
        } else {
            response.sendRedirect("edit-medicine?id=" + id + "&error=failed");
        }
    }
}