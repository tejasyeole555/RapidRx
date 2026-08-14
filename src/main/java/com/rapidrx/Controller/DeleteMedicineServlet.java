package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.MedicineDAO;

@WebServlet("/delete-medicine")
public class DeleteMedicineServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Only admin can delete medicine
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            medicineDAO.deleteMedicine(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin-medicines");
    }
}