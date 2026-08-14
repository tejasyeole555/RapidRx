package com.rapidrx.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rapidrx.dao.MedicineDAO;
import com.rapidrx.model.CartItem;
import com.rapidrx.model.Medicine;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private MedicineDAO medicineDAO;

    @Override
    public void init() {
        medicineDAO = new MedicineDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addToCart(request, response);
        } else if ("remove".equals(action)) {
            removeFromCart(request, response);
        } else if ("update".equals(action)) {
            updateCart(request, response);
        } else {
            response.sendRedirect("cart.jsp");
        }
    }

    private void addToCart(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException {

        int medicineId = Integer.parseInt(
                request.getParameter("id"));

        Medicine medicine = medicineDAO.getMedicineById(medicineId);

        if (medicine == null) {
            response.sendRedirect("medicines");
            return;
        }

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem item : cart) {

            if (item.getMedicineId() == medicineId) {

                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        if (!found) {

            CartItem item = new CartItem(
                    medicine.getId(),
                    medicine.getName(),
                    medicine.getPrice(),
                    1
            );

            cart.add(item);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }

    private void removeFromCart(HttpServletRequest request,
                                HttpServletResponse response)
            throws IOException {

        int medicineId = Integer.parseInt(
                request.getParameter("id"));

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {

            cart.removeIf(item ->
                    item.getMedicineId() == medicineId);

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }

    private void updateCart(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int medicineId = Integer.parseInt(
                request.getParameter("id"));

        int quantity = Integer.parseInt(
                request.getParameter("quantity"));

        HttpSession session = request.getSession();

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {

            for (CartItem item : cart) {

                if (item.getMedicineId() == medicineId) {

                    if (quantity > 0) {
                        item.setQuantity(quantity);
                    }

                    break;
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }
}