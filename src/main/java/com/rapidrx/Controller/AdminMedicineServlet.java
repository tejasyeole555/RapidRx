package com.rapidrx.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.model.Medicine;

@WebServlet("/admin-medicines")
public class AdminMedicineServlet extends HttpServlet {

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

        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        List<Medicine> medicines =
                medicineDAO.getAllMedicines();

        request.setAttribute("medicines", medicines);

        request.getRequestDispatcher("admin-medicines.jsp")
               .forward(request, response);
    }
}