package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String paymentMethod =
                request.getParameter("paymentMethod");

        if ("COD".equals(paymentMethod)) {

            session.setAttribute(
                    "paymentMethod",
                    "Cash on Delivery"
            );

            session.setAttribute(
                    "paymentStatus",
                    "Pending"
            );

            response.sendRedirect("confirm-payment");

        } else if ("ONLINE".equals(paymentMethod)) {

            response.sendRedirect("online-payment.jsp");

        } else {

            response.sendRedirect("payment.jsp");
        }
    }
}