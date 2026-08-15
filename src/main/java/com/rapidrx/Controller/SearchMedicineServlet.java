package com.rapidrx.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.model.Medicine;

@WebServlet("/search-medicines")
public class SearchMedicineServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");

        List<Medicine> medicines =
                medicineDAO.searchMedicines(keyword, category);

        request.setAttribute("medicines", medicines);

        request.getRequestDispatcher("medicines.jsp")
               .forward(request, response);
    }
}